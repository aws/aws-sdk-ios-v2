//
//  ViewController.swift
//  AWSAuthSDKTestApp
//

import UIKit
import AWSMobileClient
import AWSCore
import AWSTestResources

/// View controller to handle user details.
///
/// This controller is not specific for any provider. Controller just displays tokens
/// credentials and user attributes. We make the assumption that the user in the userpool
/// has two custom attributes named custom:mutableStringAttr1 and custom:mutableStringAttr1
@available(iOS 10.0, *)
class UserDetailsViewController: UIViewController {
    
    let CUSTOM_ATTRIBUTE_KEY1 = "custom:mutableStringAttr1"
    let CUSTOM_ATTRIBUTE_KEY2 = "custom:mutableStringAttr2"
    
    @IBOutlet weak var idTokenLabel: UILabel!
    @IBOutlet weak var accessTokenLabel: UILabel!
    @IBOutlet weak var refreshTokenLabel: UILabel!
    @IBOutlet weak var tokenExpirationLabel: UILabel!
    
    @IBOutlet weak var accesKeyLabel: UILabel!
    @IBOutlet weak var secretKeyLabel: UILabel!
    @IBOutlet weak var sessionKeyLabel: UILabel!
    @IBOutlet weak var credentialExpirationLabel: UILabel!
    
    @IBOutlet weak var attribute1Label: UILabel!
    @IBOutlet weak var attribute2Label: UILabel!
    @IBOutlet weak var attribute3Label: UILabel!
    @IBOutlet weak var customeAttribute1Label: UILabel!
    @IBOutlet weak var customeAttribute2Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshData()
    }
    
    @IBAction func updateUserAttributeAction(_ sender: Any) {
        resetData()
        updateUserAttributes()
    }
    
    func refreshData() {
        invalidateTokenOrNot()
        fetchUserAttributes()
        fetchToken()
        fetchCredentials()
    }
    
    func resetData() {
        DispatchQueue.main.async {
            self.idTokenLabel.text = "NA"
            self.accessTokenLabel.text = "NA"
            self.refreshTokenLabel.text = "NA"
            self.tokenExpirationLabel.text = "NA"
            self.accessTokenLabel.text = "NA"
            self.secretKeyLabel.text = "NA"
            self.sessionKeyLabel.text = "NA"
            self.credentialExpirationLabel.text = "NA"
            self.attribute1Label.text = "NA"
            self.attribute2Label.text = "NA"
            self.attribute3Label.text = "NA"
            self.customeAttribute1Label.text = "NA"
            self.customeAttribute2Label.text = "NA"
        }
    }

    /// There is one test case `testHostedUIGetAttributesWhenSessionExpired` in `AWSHostedUIUserPoolTests.swift`
    /// that requires the refresh token to be invalidated. But `UserDetailsViewController` doesn't have context which test case it is in
    /// The workaround is to create a user `sessionExpired+UUID` so that when `UserDetailsViewController` sees that,
    /// it knows it should call `mockIncalidateRefreshToken()`
    func invalidateTokenOrNot() {
        let username = AWSMobileClient.default().username
        if username?.prefix(12) == "refreshToken" {
            invalidateRefreshToken()
        }
        if username?.prefix(11) == "accessToken" {
            invalidateAccessToken()
        }
    }

    func fetchToken() {
        AWSMobileClient.default().getTokens { (token, error) in
            
            DispatchQueue.main.async {
                guard let result = token else {
                    
                    self.idTokenLabel.text = "NA"
                    self.accessTokenLabel.text = "NA"
                    self.refreshTokenLabel.text = "NA"
                    self.tokenExpirationLabel.text = "NA"
                    return
                }
                
                if let idTokenString = result.idToken?.tokenString {
                    let subIndex = idTokenString.index(idTokenString.startIndex, offsetBy: 20)
                    self.idTokenLabel.text = String(idTokenString[..<subIndex])
                }
                
                if let accessTokenString = result.accessToken?.tokenString {
                    let subIndex = accessTokenString.index(accessTokenString.startIndex, offsetBy: 20)
                    self.accessTokenLabel.text = String(accessTokenString[..<subIndex])
                }
                
                if let refreshTokenString = result.refreshToken?.tokenString {
                    let subIndex = refreshTokenString.index(refreshTokenString.startIndex, offsetBy: 20)
                    self.refreshTokenLabel.text = String(refreshTokenString[..<subIndex])
                }
                
                let df = DateFormatter()
                df.dateFormat = "yyyy-MM-dd hh:mm:ss"
                self.tokenExpirationLabel.text = df.string(from: result.expiration!)
            }
        }
    }
    
    func fetchCredentials() {
        AWSMobileClient.default().getAWSCredentials { (credentials, error) in
            DispatchQueue.main.async {
                guard let result = credentials else {

                    self.accessTokenLabel.text = "NA"
                    self.secretKeyLabel.text = "NA"
                    self.sessionKeyLabel.text = "NA"
                    self.credentialExpirationLabel.text = "NA"
                    return
                }
                
                self.accesKeyLabel.text = result.accessKey
                
                let subIndex = result.secretKey.index(result.secretKey.startIndex, offsetBy: 20)
                self.secretKeyLabel.text = String(result.secretKey[..<subIndex])
                self.sessionKeyLabel.text = String(result.sessionKey![..<subIndex])
                let df = DateFormatter()
                df.dateFormat = "yyyy-MM-dd hh:mm:ss"
                self.credentialExpirationLabel.text = df.string(from: result.expiration!)
            }
            
        }
    }
    
    func fetchUserAttributes() {
        AWSMobileClient.default().getUserAttributes { attributes, error in
            DispatchQueue.main.async {
                guard let attributes = attributes else {
                    return
                }
                if attributes.count == 3 {
                    self.attribute1Label.text = attributes["email_verified"]
                    self.attribute2Label.text = attributes["email"]
                    self.attribute3Label.text = attributes["sub"]
                    self.customeAttribute1Label.text = "NA"
                    self.customeAttribute2Label.text = "NA"
                } else {
                    self.attribute1Label.text = attributes["email_verified"]
                    self.attribute2Label.text = attributes["email"]
                    self.attribute3Label.text = attributes["sub"]
                    self.customeAttribute1Label.text = attributes[self.CUSTOM_ATTRIBUTE_KEY1]
                    self.customeAttribute2Label.text = attributes[self.CUSTOM_ATTRIBUTE_KEY2]
                }
            }
        }
    }
    
    func updateUserAttributes() {
        let newUserAttributes = [
            CUSTOM_ATTRIBUTE_KEY1: UUID().uuidString,
            CUSTOM_ATTRIBUTE_KEY2: UUID().uuidString
        ]
        
        AWSMobileClient.default().updateUserAttributes(attributeMap: newUserAttributes) { result, error in
            self.refreshData()
        }
    }
    
    func invalidateRefreshToken() {
        let key = getTokenKeychain()
        getKeychain().removeItem(forKey: key)
    }

    func invalidateAccessToken() {
        let key = getTokenKeychain()
        let pastDate = Date(timeIntervalSinceNow: -1)
        let formattedDate = ISO8601DateFormatter().string(from: pastDate)
        let dateData = formattedDate.data(using: .utf8)
        getKeychain().setData(dateData, forKey: key)
    }

    private func getKeychain() -> AWSUICKeyChainStore {
        let bundleID = Bundle.main.bundleIdentifier
        let keychain = AWSUICKeyChainStore(service: "\(bundleID!).\(AWSCognitoIdentityUserPool.self)")
        return keychain
    }

    private func getTokenKeychain() -> String {
        let mobileClientConfig = AWSTestConfiguration.getIntegrationTestConfiguration(forPackageId: "mobileclient")
        let awsconfiguration = mobileClientConfig["awsconfiguration"] as! [String: Any]
        let userPoolConfig = awsconfiguration["CognitoUserPool"] as! [String: [String: Any]]
        let appClientId = (userPoolConfig["Default"]!["AppClientId"] as! String)
        let namespace = "\(appClientId).\(AWSMobileClient.default().username ?? "")"
        let key = "\(namespace).tokenExpiration"
        return key
    }
}
