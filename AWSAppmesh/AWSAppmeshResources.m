//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSAppmeshResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSAppmeshResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSAppmeshResources

+ (instancetype)sharedInstance {
    static AWSAppmeshResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSAppmeshResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\": \"2.0\",\
  \"metadata\": {\
    \"apiVersion\": \"2019-01-25\",\
    \"endpointPrefix\": \"appmesh\",\
    \"jsonVersion\": \"1.1\",\
    \"protocol\": \"rest-json\",\
    \"serviceFullName\": \"AWS App Mesh\",\
    \"serviceId\": \"App Mesh\",\
    \"signatureVersion\": \"v4\",\
    \"signingName\": \"appmesh\",\
    \"uid\": \"appmesh-2019-01-25\"\
  },\
  \"documentation\": \"<p>AWS App Mesh is a service mesh based on the Envoy proxy that makes it easy to monitor and\\n         control microservices. App Mesh standardizes how your microservices communicate, giving you\\n         end-to-end visibility and helping to ensure high availability for your applications.</p>\\n         <p>App Mesh gives you consistent visibility and network traffic controls for every\\n         microservice in an application. You can use App Mesh with AWS Fargate, Amazon ECS, Amazon EKS,\\n         Kubernetes on AWS, and Amazon EC2.</p>\\n         <note>\\n            <p>App Mesh supports microservice applications that use service discovery naming for their\\n            components. For more information about service discovery on Amazon ECS, see <a href=\\\"https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html\\\">Service Discovery</a> in the <i>Amazon Elastic Container Service Developer Guide</i>. Kubernetes\\n               <code>kube-dns</code> and <code>coredns</code> are supported. For more information,\\n            see <a href=\\\"https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/\\\">DNS\\n               for Services and Pods</a> in the Kubernetes documentation.</p>\\n         </note>\",\
  \"operations\": {\
    \"CreateMesh\": {\
      \"name\": \"CreateMesh\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v20190125/meshes\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"CreateMeshInput\"\
      },\
      \"output\": {\
        \"shape\": \"CreateMeshOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ConflictException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"LimitExceededException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a service mesh.</p>\\n         <p> A service mesh is a logical boundary for network traffic between services that are\\n         represented by resources within the mesh. After you create your service mesh, you can\\n         create virtual services, virtual nodes, virtual routers, and routes to distribute traffic\\n         between the applications in your mesh.</p>\\n         <p>For more information about service meshes, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/meshes.html\\\">Service meshes</a>.</p>\",\
      \"idempotent\": true\
    },\
    \"CreateRoute\": {\
      \"name\": \"CreateRoute\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"CreateRouteInput\"\
      },\
      \"output\": {\
        \"shape\": \"CreateRouteOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ConflictException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"LimitExceededException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a route that is associated with a virtual router.</p>\\n         <p> You can route several different protocols and define a retry policy for a route.\\n         Traffic can be routed to one or more virtual nodes.</p>\\n         <p>For more information about routes, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/routes.html\\\">Routes</a>.</p>\",\
      \"idempotent\": true\
    },\
    \"CreateVirtualNode\": {\
      \"name\": \"CreateVirtualNode\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualNodes\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"CreateVirtualNodeInput\"\
      },\
      \"output\": {\
        \"shape\": \"CreateVirtualNodeOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ConflictException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"LimitExceededException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a virtual node within a service mesh.</p>\\n         <p> A virtual node acts as a logical pointer to a particular task group, such as an Amazon ECS\\n         service or a Kubernetes deployment. When you create a virtual node, you can specify the\\n         service discovery information for your task group, and whether the proxy running in a task\\n         group will communicate with other proxies using Transport Layer Security (TLS).</p>\\n         <p>You define a <code>listener</code> for any inbound traffic that your virtual node\\n         expects. Any virtual service that your virtual node expects to communicate to is specified\\n         as a <code>backend</code>.</p>\\n         <p>The response metadata for your new virtual node contains the <code>arn</code> that is\\n         associated with the virtual node. Set this value (either the full ARN or the truncated\\n         resource name: for example, <code>mesh/default/virtualNode/simpleapp</code>) as the\\n            <code>APPMESH_VIRTUAL_NODE_NAME</code> environment variable for your task group's Envoy\\n         proxy container in your task definition or pod spec. This is then mapped to the\\n            <code>node.id</code> and <code>node.cluster</code> Envoy parameters.</p>\\n         <note>\\n            <p>If you require your Envoy stats or tracing to use a different name, you can override\\n            the <code>node.cluster</code> value that is set by\\n               <code>APPMESH_VIRTUAL_NODE_NAME</code> with the\\n               <code>APPMESH_VIRTUAL_NODE_CLUSTER</code> environment variable.</p>\\n         </note>\\n         <p>For more information about virtual nodes, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_nodes.html\\\">Virtual nodes</a>.</p>\",\
      \"idempotent\": true\
    },\
    \"CreateVirtualRouter\": {\
      \"name\": \"CreateVirtualRouter\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualRouters\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"CreateVirtualRouterInput\"\
      },\
      \"output\": {\
        \"shape\": \"CreateVirtualRouterOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ConflictException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"LimitExceededException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a virtual router within a service mesh.</p>\\n         <p>Specify a <code>listener</code> for any inbound traffic that your virtual router\\n         receives. Create a virtual router for each protocol and port that you need to route.\\n         Virtual routers handle traffic for one or more virtual services within your mesh. After you\\n         create your virtual router, create and associate routes for your virtual router that direct\\n         incoming requests to different virtual nodes.</p>\\n         <p>For more information about virtual routers, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_routers.html\\\">Virtual routers</a>.</p>\",\
      \"idempotent\": true\
    },\
    \"CreateVirtualService\": {\
      \"name\": \"CreateVirtualService\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualServices\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"CreateVirtualServiceInput\"\
      },\
      \"output\": {\
        \"shape\": \"CreateVirtualServiceOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ConflictException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"LimitExceededException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Creates a virtual service within a service mesh.</p>\\n         <p>A virtual service is an abstraction of a real service that is provided by a virtual node\\n         directly or indirectly by means of a virtual router. Dependent services call your virtual\\n         service by its <code>virtualServiceName</code>, and those requests are routed to the\\n         virtual node or virtual router that is specified as the provider for the virtual\\n         service.</p>\\n         <p>For more information about virtual services, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_services.html\\\">Virtual services</a>.</p>\",\
      \"idempotent\": true\
    },\
    \"DeleteMesh\": {\
      \"name\": \"DeleteMesh\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteMeshInput\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteMeshOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ResourceInUseException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes an existing service mesh.</p>\\n         <p>You must delete all resources (virtual services, routes, virtual routers, and virtual\\n         nodes) in the service mesh before you can delete the mesh itself.</p>\",\
      \"idempotent\": true\
    },\
    \"DeleteRoute\": {\
      \"name\": \"DeleteRoute\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes/{routeName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteRouteInput\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteRouteOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ResourceInUseException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes an existing route.</p>\",\
      \"idempotent\": true\
    },\
    \"DeleteVirtualNode\": {\
      \"name\": \"DeleteVirtualNode\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualNodes/{virtualNodeName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteVirtualNodeInput\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteVirtualNodeOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ResourceInUseException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes an existing virtual node.</p>\\n         <p>You must delete any virtual services that list a virtual node as a service provider\\n         before you can delete the virtual node itself.</p>\",\
      \"idempotent\": true\
    },\
    \"DeleteVirtualRouter\": {\
      \"name\": \"DeleteVirtualRouter\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualRouters/{virtualRouterName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteVirtualRouterInput\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteVirtualRouterOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ResourceInUseException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes an existing virtual router.</p>\\n         <p>You must delete any routes associated with the virtual router before you can delete the\\n         router itself.</p>\",\
      \"idempotent\": true\
    },\
    \"DeleteVirtualService\": {\
      \"name\": \"DeleteVirtualService\",\
      \"http\": {\
        \"method\": \"DELETE\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualServices/{virtualServiceName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DeleteVirtualServiceInput\"\
      },\
      \"output\": {\
        \"shape\": \"DeleteVirtualServiceOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ResourceInUseException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes an existing virtual service.</p>\",\
      \"idempotent\": true\
    },\
    \"DescribeMesh\": {\
      \"name\": \"DescribeMesh\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeMeshInput\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeMeshOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Describes an existing service mesh.</p>\"\
    },\
    \"DescribeRoute\": {\
      \"name\": \"DescribeRoute\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes/{routeName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeRouteInput\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeRouteOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Describes an existing route.</p>\"\
    },\
    \"DescribeVirtualNode\": {\
      \"name\": \"DescribeVirtualNode\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualNodes/{virtualNodeName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeVirtualNodeInput\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeVirtualNodeOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Describes an existing virtual node.</p>\"\
    },\
    \"DescribeVirtualRouter\": {\
      \"name\": \"DescribeVirtualRouter\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualRouters/{virtualRouterName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeVirtualRouterInput\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeVirtualRouterOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Describes an existing virtual router.</p>\"\
    },\
    \"DescribeVirtualService\": {\
      \"name\": \"DescribeVirtualService\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualServices/{virtualServiceName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"DescribeVirtualServiceInput\"\
      },\
      \"output\": {\
        \"shape\": \"DescribeVirtualServiceOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Describes an existing virtual service.</p>\"\
    },\
    \"ListMeshes\": {\
      \"name\": \"ListMeshes\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v20190125/meshes\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListMeshesInput\"\
      },\
      \"output\": {\
        \"shape\": \"ListMeshesOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Returns a list of existing service meshes.</p>\"\
    },\
    \"ListRoutes\": {\
      \"name\": \"ListRoutes\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListRoutesInput\"\
      },\
      \"output\": {\
        \"shape\": \"ListRoutesOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Returns a list of existing routes in a service mesh.</p>\"\
    },\
    \"ListTagsForResource\": {\
      \"name\": \"ListTagsForResource\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v20190125/tags\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListTagsForResourceInput\"\
      },\
      \"output\": {\
        \"shape\": \"ListTagsForResourceOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>List the tags for an App Mesh resource.</p>\"\
    },\
    \"ListVirtualNodes\": {\
      \"name\": \"ListVirtualNodes\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualNodes\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListVirtualNodesInput\"\
      },\
      \"output\": {\
        \"shape\": \"ListVirtualNodesOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Returns a list of existing virtual nodes.</p>\"\
    },\
    \"ListVirtualRouters\": {\
      \"name\": \"ListVirtualRouters\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualRouters\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListVirtualRoutersInput\"\
      },\
      \"output\": {\
        \"shape\": \"ListVirtualRoutersOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Returns a list of existing virtual routers in a service mesh.</p>\"\
    },\
    \"ListVirtualServices\": {\
      \"name\": \"ListVirtualServices\",\
      \"http\": {\
        \"method\": \"GET\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualServices\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"ListVirtualServicesInput\"\
      },\
      \"output\": {\
        \"shape\": \"ListVirtualServicesOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Returns a list of existing virtual services in a service mesh.</p>\"\
    },\
    \"TagResource\": {\
      \"name\": \"TagResource\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v20190125/tag\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"TagResourceInput\"\
      },\
      \"output\": {\
        \"shape\": \"TagResourceOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        },\
        {\
          \"shape\": \"TooManyTagsException\"\
        }\
      ],\
      \"documentation\": \"<p>Associates the specified tags to a resource with the specified <code>resourceArn</code>.\\n         If existing tags on a resource aren't specified in the request parameters, they aren't\\n         changed. When a resource is deleted, the tags associated with that resource are also\\n         deleted.</p>\",\
      \"idempotent\": true\
    },\
    \"UntagResource\": {\
      \"name\": \"UntagResource\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v20190125/untag\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UntagResourceInput\"\
      },\
      \"output\": {\
        \"shape\": \"UntagResourceOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Deletes specified tags from a resource.</p>\",\
      \"idempotent\": true\
    },\
    \"UpdateMesh\": {\
      \"name\": \"UpdateMesh\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateMeshInput\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateMeshOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ConflictException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Updates an existing service mesh.</p>\",\
      \"idempotent\": true\
    },\
    \"UpdateRoute\": {\
      \"name\": \"UpdateRoute\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes/{routeName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateRouteInput\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateRouteOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ConflictException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"LimitExceededException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Updates an existing route for a specified service mesh and virtual router.</p>\",\
      \"idempotent\": true\
    },\
    \"UpdateVirtualNode\": {\
      \"name\": \"UpdateVirtualNode\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualNodes/{virtualNodeName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateVirtualNodeInput\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateVirtualNodeOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ConflictException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"LimitExceededException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Updates an existing virtual node in a specified service mesh.</p>\",\
      \"idempotent\": true\
    },\
    \"UpdateVirtualRouter\": {\
      \"name\": \"UpdateVirtualRouter\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualRouters/{virtualRouterName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateVirtualRouterInput\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateVirtualRouterOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ConflictException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"LimitExceededException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Updates an existing virtual router in a specified service mesh.</p>\",\
      \"idempotent\": true\
    },\
    \"UpdateVirtualService\": {\
      \"name\": \"UpdateVirtualService\",\
      \"http\": {\
        \"method\": \"PUT\",\
        \"requestUri\": \"/v20190125/meshes/{meshName}/virtualServices/{virtualServiceName}\",\
        \"responseCode\": 200\
      },\
      \"input\": {\
        \"shape\": \"UpdateVirtualServiceInput\"\
      },\
      \"output\": {\
        \"shape\": \"UpdateVirtualServiceOutput\"\
      },\
      \"errors\": [\
        {\
          \"shape\": \"BadRequestException\"\
        },\
        {\
          \"shape\": \"ConflictException\"\
        },\
        {\
          \"shape\": \"ForbiddenException\"\
        },\
        {\
          \"shape\": \"InternalServerErrorException\"\
        },\
        {\
          \"shape\": \"LimitExceededException\"\
        },\
        {\
          \"shape\": \"NotFoundException\"\
        },\
        {\
          \"shape\": \"ServiceUnavailableException\"\
        },\
        {\
          \"shape\": \"TooManyRequestsException\"\
        }\
      ],\
      \"documentation\": \"<p>Updates an existing virtual service in a specified service mesh.</p>\",\
      \"idempotent\": true\
    }\
  },\
  \"shapes\": {\
    \"VirtualRouterListener\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"portMapping\"\
      ],\
      \"members\": {\
        \"portMapping\": {\
          \"shape\": \"PortMapping\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a virtual router listener.</p>\"\
    },\
    \"VirtualRouterStatusCode\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"ACTIVE\",\
        \"DELETED\",\
        \"INACTIVE\"\
      ]\
    },\
    \"TagKeyList\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"TagKey\"\
      },\
      \"min\": 0,\
      \"max\": 50\
    },\
    \"GrpcRetryPolicy\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"maxRetries\",\
        \"perRetryTimeout\"\
      ],\
      \"members\": {\
        \"grpcRetryEvents\": {\
          \"shape\": \"GrpcRetryPolicyEvents\",\
          \"documentation\": \"<p>Specify at least one of the valid values.</p>\"\
        },\
        \"httpRetryEvents\": {\
          \"shape\": \"HttpRetryPolicyEvents\",\
          \"documentation\": \"<p>Specify at least one of the following values.</p> \\n         <ul>\\n            <li>\\n               <p>\\n                  <b>server-error</b> â HTTP status codes 500, 501,\\n                  502, 503, 504, 505, 506, 507, 508, 510, and 511</p>\\n            </li>\\n            <li>\\n               <p>\\n                  <b>gateway-error</b> â HTTP status codes 502,\\n                  503, and 504</p>\\n            </li>\\n            <li>\\n               <p>\\n                  <b>client-error</b> â HTTP status code 409</p>\\n            </li>\\n            <li>\\n               <p>\\n                  <b>stream-error</b> â Retry on refused\\n                  stream</p>\\n            </li>\\n         </ul>\"\
        },\
        \"maxRetries\": {\
          \"shape\": \"MaxRetries\",\
          \"documentation\": \"<p>The maximum number of retry attempts.</p>\"\
        },\
        \"perRetryTimeout\": {\
          \"shape\": \"Duration\",\
          \"documentation\": \"<p>An object that represents a duration of time.</p>\"\
        },\
        \"tcpRetryEvents\": {\
          \"shape\": \"TcpRetryPolicyEvents\",\
          \"documentation\": \"<p>Specify a valid value.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a retry policy. Specify at least one value for at least one of the types of <code>RetryEvents</code>, a value for <code>maxRetries</code>, and a value for <code>perRetryTimeout</code>.</p>\"\
    },\
    \"CreateVirtualNodeOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualNode\"\
      ],\
      \"members\": {\
        \"virtualNode\": {\
          \"shape\": \"VirtualNodeData\",\
          \"documentation\": \"<p>The full description of your virtual node following the create call.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"virtualNode\"\
    },\
    \"Logging\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"accessLog\": {\
          \"shape\": \"AccessLog\",\
          \"documentation\": \"<p>The access log configuration for a virtual node.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the logging information for a virtual node.</p>\"\
    },\
    \"Long\": {\
      \"type\": \"long\",\
      \"box\": true\
    },\
    \"UpdateVirtualRouterOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualRouter\"\
      ],\
      \"members\": {\
        \"virtualRouter\": {\
          \"shape\": \"VirtualRouterData\",\
          \"documentation\": \"<p>A full description of the virtual router that was updated.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"virtualRouter\"\
    },\
    \"ListVirtualRoutersOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualRouters\"\
      ],\
      \"members\": {\
        \"nextToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>The <code>nextToken</code> value to include in a future <code>ListVirtualRouters</code>\\n         request. When the results of a <code>ListVirtualRouters</code> request exceed\\n            <code>limit</code>, you can use this value to retrieve the next page of results. This\\n         value is <code>null</code> when there are no more results to return.</p>\"\
        },\
        \"virtualRouters\": {\
          \"shape\": \"VirtualRouterList\",\
          \"documentation\": \"<p>The list of existing virtual routers for the specified service mesh.</p>\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"ResourceMetadata\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"arn\",\
        \"createdAt\",\
        \"lastUpdatedAt\",\
        \"meshOwner\",\
        \"resourceOwner\",\
        \"uid\",\
        \"version\"\
      ],\
      \"members\": {\
        \"arn\": {\
          \"shape\": \"Arn\",\
          \"documentation\": \"<p>The full Amazon Resource Name (ARN) for the resource.</p>\"\
        },\
        \"createdAt\": {\
          \"shape\": \"Timestamp\",\
          \"documentation\": \"<p>The Unix epoch timestamp in seconds for when the resource was created.</p>\"\
        },\
        \"lastUpdatedAt\": {\
          \"shape\": \"Timestamp\",\
          \"documentation\": \"<p>The Unix epoch timestamp in seconds for when the resource was last updated.</p>\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\"\
        },\
        \"resourceOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the resource owner. If the account ID is not your own, then it's\\n               the ID of the mesh owner or of another account that the mesh is shared with. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\"\
        },\
        \"uid\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>The unique identifier for the resource.</p>\"\
        },\
        \"version\": {\
          \"shape\": \"Long\",\
          \"documentation\": \"<p>The version of the resource. Resources are created at version 1, and this version is\\n         incremented each time that they're updated.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents metadata for a resource.</p>\"\
    },\
    \"ResourceInUseException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"message\": {\
          \"shape\": \"String\"\
        }\
      },\
      \"documentation\": \"<p>You can't delete the specified resource because it's in use or required by another\\n         resource.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"code\": \"ResourceInUseException\",\
        \"httpStatusCode\": 409,\
        \"senderFault\": true\
      }\
    },\
    \"UpdateVirtualNodeOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualNode\"\
      ],\
      \"members\": {\
        \"virtualNode\": {\
          \"shape\": \"VirtualNodeData\",\
          \"documentation\": \"<p>A full description of the virtual node that was updated.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"virtualNode\"\
    },\
    \"ListRoutesOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"routes\"\
      ],\
      \"members\": {\
        \"nextToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>The <code>nextToken</code> value to include in a future <code>ListRoutes</code> request.\\n         When the results of a <code>ListRoutes</code> request exceed <code>limit</code>, you can\\n         use this value to retrieve the next page of results. This value is <code>null</code> when\\n         there are no more results to return.</p>\"\
        },\
        \"routes\": {\
          \"shape\": \"RouteList\",\
          \"documentation\": \"<p>The list of existing routes for the specified service mesh and virtual router.</p>\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"VirtualServiceBackend\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualServiceName\"\
      ],\
      \"members\": {\
        \"clientPolicy\": {\
          \"shape\": \"ClientPolicy\",\
          \"documentation\": \"<p>A reference to an object that represents the client policy for a backend.</p>\"\
        },\
        \"virtualServiceName\": {\
          \"shape\": \"ServiceName\",\
          \"documentation\": \"<p>The name of the virtual service that is acting as a virtual node backend.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a virtual service backend for a virtual node.</p>\"\
    },\
    \"BadRequestException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"message\": {\
          \"shape\": \"String\"\
        }\
      },\
      \"documentation\": \"<p>The request syntax was malformed. Check your request syntax and try again.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"code\": \"BadRequestException\",\
        \"httpStatusCode\": 400,\
        \"senderFault\": true\
      }\
    },\
    \"GrpcRouteMetadataList\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"GrpcRouteMetadata\"\
      },\
      \"min\": 1,\
      \"max\": 10\
    },\
    \"ListenerTlsMode\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"DISABLED\",\
        \"PERMISSIVE\",\
        \"STRICT\"\
      ]\
    },\
    \"HealthCheckPolicy\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"healthyThreshold\",\
        \"intervalMillis\",\
        \"protocol\",\
        \"timeoutMillis\",\
        \"unhealthyThreshold\"\
      ],\
      \"members\": {\
        \"healthyThreshold\": {\
          \"shape\": \"HealthCheckThreshold\",\
          \"documentation\": \"<p>The number of consecutive successful health checks that must occur before declaring\\n         listener healthy.</p>\"\
        },\
        \"intervalMillis\": {\
          \"shape\": \"HealthCheckIntervalMillis\",\
          \"documentation\": \"<p>The time period in milliseconds between each health check execution.</p>\"\
        },\
        \"path\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>The destination path for the health check request. This value is only used if the\\n         specified protocol is HTTP or HTTP/2. For any other protocol, this value is ignored.</p>\"\
        },\
        \"port\": {\
          \"shape\": \"PortNumber\",\
          \"documentation\": \"<p>The destination port for the health check request. This port must match the port defined\\n         in the <a>PortMapping</a> for the listener.</p>\"\
        },\
        \"protocol\": {\
          \"shape\": \"PortProtocol\",\
          \"documentation\": \"<p>The protocol for the health check request. If you specify <code>grpc</code>, then your\\n         service must conform to the <a href=\\\"https://github.com/grpc/grpc/blob/master/doc/health-checking.md\\\">GRPC Health\\n            Checking Protocol</a>.</p>\"\
        },\
        \"timeoutMillis\": {\
          \"shape\": \"HealthCheckTimeoutMillis\",\
          \"documentation\": \"<p>The amount of time to wait when receiving a response from the health check, in\\n         milliseconds.</p>\"\
        },\
        \"unhealthyThreshold\": {\
          \"shape\": \"HealthCheckThreshold\",\
          \"documentation\": \"<p>The number of consecutive failed health checks that must occur before declaring a\\n         virtual node unhealthy. </p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the health check policy for a virtual node's listener.</p>\"\
    },\
    \"EgressFilter\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"type\"\
      ],\
      \"members\": {\
        \"type\": {\
          \"shape\": \"EgressFilterType\",\
          \"documentation\": \"<p>The egress filter type. By default, the type is <code>DROP_ALL</code>, which allows\\n         egress only from virtual nodes to other defined resources in the service mesh (and any\\n         traffic to <code>*.amazonaws.com</code> for AWS API calls). You can set the egress filter\\n         type to <code>ALLOW_ALL</code> to allow egress to any endpoint inside or outside of the\\n         service mesh.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the egress filter rules for a service mesh.</p>\"\
    },\
    \"VirtualServiceList\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"VirtualServiceRef\"\
      }\
    },\
    \"ClientPolicy\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"tls\": {\
          \"shape\": \"ClientPolicyTls\",\
          \"documentation\": \"<p>A reference to an object that represents a Transport Layer Security (TLS) client policy.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a client policy.</p>\"\
    },\
    \"Boolean\": {\
      \"type\": \"boolean\",\
      \"box\": true\
    },\
    \"HttpRetryPolicyEvent\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 25\
    },\
    \"DescribeVirtualServiceOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualService\"\
      ],\
      \"members\": {\
        \"virtualService\": {\
          \"shape\": \"VirtualServiceData\",\
          \"documentation\": \"<p>The full description of your virtual service.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"virtualService\"\
    },\
    \"CertificateAuthorityArns\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"Arn\"\
      },\
      \"min\": 1,\
      \"max\": 3\
    },\
    \"DescribeVirtualNodeOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualNode\"\
      ],\
      \"members\": {\
        \"virtualNode\": {\
          \"shape\": \"VirtualNodeData\",\
          \"documentation\": \"<p>The full description of your virtual node.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"virtualNode\"\
    },\
    \"AwsCloudMapName\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 1024,\
      \"pattern\": \"((?=^.{1,127}$)^([a-zA-Z0-9_][a-zA-Z0-9-_]{0,61}[a-zA-Z0-9_]|[a-zA-Z0-9])(.([a-zA-Z0-9_][a-zA-Z0-9-_]{0,61}[a-zA-Z0-9_]|[a-zA-Z0-9]))*$)|(^.$)\"\
    },\
    \"CreateRouteOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"route\"\
      ],\
      \"members\": {\
        \"route\": {\
          \"shape\": \"RouteData\",\
          \"documentation\": \"<p>The full description of your mesh following the create call.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"route\"\
    },\
    \"DnsServiceDiscovery\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"hostname\"\
      ],\
      \"members\": {\
        \"hostname\": {\
          \"shape\": \"Hostname\",\
          \"documentation\": \"<p>Specifies the DNS service discovery hostname for the virtual node. </p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the DNS service discovery information for your virtual\\n         node.</p>\"\
    },\
    \"DeleteRouteInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"routeName\",\
        \"virtualRouterName\"\
      ],\
      \"members\": {\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh to delete the route in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"routeName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the route to delete.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"routeName\"\
        },\
        \"virtualRouterName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual router to delete the route in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"virtualRouterName\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"VirtualNodeData\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"metadata\",\
        \"spec\",\
        \"status\",\
        \"virtualNodeName\"\
      ],\
      \"members\": {\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh that the virtual node resides in.</p>\"\
        },\
        \"metadata\": {\
          \"shape\": \"ResourceMetadata\",\
          \"documentation\": \"<p>The associated metadata for the virtual node.</p>\"\
        },\
        \"spec\": {\
          \"shape\": \"VirtualNodeSpec\",\
          \"documentation\": \"<p>The specifications of the virtual node.</p>\"\
        },\
        \"status\": {\
          \"shape\": \"VirtualNodeStatus\",\
          \"documentation\": \"<p>The current status for the virtual node.</p>\"\
        },\
        \"virtualNodeName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual node.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a virtual node returned by a describe operation.</p>\"\
    },\
    \"UntagResourceOutput\": {\
      \"type\": \"structure\",\
      \"members\": { },\
      \"documentation\": \"\"\
    },\
    \"TcpRetryPolicyEvent\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"connection-error\"\
      ]\
    },\
    \"Backend\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"virtualService\": {\
          \"shape\": \"VirtualServiceBackend\",\
          \"documentation\": \"<p>Specifies a virtual service to use as a backend for a virtual node. </p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the backends that a virtual node is expected to send outbound\\n         traffic to. </p>\"\
    },\
    \"ListMeshesInput\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"limit\": {\
          \"shape\": \"ListMeshesLimit\",\
          \"documentation\": \"<p>The maximum number of results returned by <code>ListMeshes</code> in paginated output.\\n         When you use this parameter, <code>ListMeshes</code> returns only <code>limit</code>\\n         results in a single page along with a <code>nextToken</code> response element. You can see\\n         the remaining results of the initial request by sending another <code>ListMeshes</code>\\n         request with the returned <code>nextToken</code> value. This value can be between\\n         1 and 100. If you don't use this parameter,\\n            <code>ListMeshes</code> returns up to 100 results and a\\n            <code>nextToken</code> value if applicable.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"limit\"\
        },\
        \"nextToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>The <code>nextToken</code> value returned from a previous paginated\\n            <code>ListMeshes</code> request where <code>limit</code> was used and the results\\n         exceeded the value of that parameter. Pagination continues from the end of the previous\\n         results that returned the <code>nextToken</code> value.</p> \\n         <note>\\n            <p>This token should be treated as an opaque identifier that is used only to\\n                retrieve the next items in a list and not for other programmatic purposes.</p>\\n        </note>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"VirtualRouterData\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"metadata\",\
        \"spec\",\
        \"status\",\
        \"virtualRouterName\"\
      ],\
      \"members\": {\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh that the virtual router resides in.</p>\"\
        },\
        \"metadata\": {\
          \"shape\": \"ResourceMetadata\",\
          \"documentation\": \"<p>The associated metadata for the virtual router.</p>\"\
        },\
        \"spec\": {\
          \"shape\": \"VirtualRouterSpec\",\
          \"documentation\": \"<p>The specifications of the virtual router.</p>\"\
        },\
        \"status\": {\
          \"shape\": \"VirtualRouterStatus\",\
          \"documentation\": \"<p>The current status of the virtual router.</p>\"\
        },\
        \"virtualRouterName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual router.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a virtual router returned by a describe operation.</p>\"\
    },\
    \"UpdateMeshInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\"\
      ],\
      \"members\": {\
        \"clientToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the\\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>\",\
          \"idempotencyToken\": true\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh to update.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"spec\": {\
          \"shape\": \"MeshSpec\",\
          \"documentation\": \"<p>The service mesh specification to apply.</p>\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"CreateVirtualRouterInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"spec\",\
        \"virtualRouterName\"\
      ],\
      \"members\": {\
        \"clientToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the\\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>\",\
          \"idempotencyToken\": true\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh to create the virtual router in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then\\n               the account that you specify must share the mesh with your account before you can create \\n             the resource in the service mesh. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"spec\": {\
          \"shape\": \"VirtualRouterSpec\",\
          \"documentation\": \"<p>The virtual router specification to apply.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"TagList\",\
          \"documentation\": \"<p>Optional metadata that you can apply to the virtual router to assist with categorization\\n         and organization. Each tag consists of a key and an optional value, both of which you\\n         define. Tag keys can have a maximum character length of 128 characters, and tag values can have\\n            a maximum length of 256 characters.</p>\",\
          \"tags\": [\
            \"not-preview\"\
          ]\
        },\
        \"virtualRouterName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name to use for the virtual router.</p>\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"DescribeVirtualRouterOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualRouter\"\
      ],\
      \"members\": {\
        \"virtualRouter\": {\
          \"shape\": \"VirtualRouterData\",\
          \"documentation\": \"<p>The full description of your virtual router.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"virtualRouter\"\
    },\
    \"CreateMeshOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"mesh\"\
      ],\
      \"members\": {\
        \"mesh\": {\
          \"shape\": \"MeshData\",\
          \"documentation\": \"<p>The full description of your service mesh following the create call.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"mesh\"\
    },\
    \"CreateVirtualRouterOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualRouter\"\
      ],\
      \"members\": {\
        \"virtualRouter\": {\
          \"shape\": \"VirtualRouterData\",\
          \"documentation\": \"<p>The full description of your virtual router following the create call.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"virtualRouter\"\
    },\
    \"VirtualServiceStatus\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"status\"\
      ],\
      \"members\": {\
        \"status\": {\
          \"shape\": \"VirtualServiceStatusCode\",\
          \"documentation\": \"<p>The current status of the virtual service.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the status of a virtual service.</p>\"\
    },\
    \"HttpRetryPolicyEvents\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"HttpRetryPolicyEvent\"\
      },\
      \"min\": 1,\
      \"max\": 25\
    },\
    \"ListenerTlsCertificate\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"acm\": {\
          \"shape\": \"ListenerTlsAcmCertificate\",\
          \"documentation\": \"<p>A reference to an object that represents an AWS Certicate Manager (ACM) certificate.</p>\"\
        },\
        \"file\": {\
          \"shape\": \"ListenerTlsFileCertificate\",\
          \"documentation\": \"<p>A reference to an object that represents a local file certificate.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a listener's Transport Layer Security (TLS) certificate.</p>\"\
    },\
    \"ListMeshesLimit\": {\
      \"type\": \"integer\",\
      \"box\": true,\
      \"min\": 1,\
      \"max\": 100\
    },\
    \"AwsCloudMapInstanceAttributeKey\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 255,\
      \"pattern\": \"^[a-zA-Z0-9!-~]+$\"\
    },\
    \"VirtualRouterSpec\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"listeners\": {\
          \"shape\": \"VirtualRouterListeners\",\
          \"documentation\": \"<p>The listeners that the virtual router is expected to receive inbound traffic from. You\\n         can specify one listener.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the specification of a virtual router.</p>\"\
    },\
    \"VirtualNodeSpec\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"backendDefaults\": {\
          \"shape\": \"BackendDefaults\",\
          \"documentation\": \"<p>A reference to an object that represents the defaults for backends.</p>\"\
        },\
        \"backends\": {\
          \"shape\": \"Backends\",\
          \"documentation\": \"<p>The backends that the virtual node is expected to send outbound traffic to.</p>\"\
        },\
        \"listeners\": {\
          \"shape\": \"Listeners\",\
          \"documentation\": \"<p>The listener that the virtual node is expected to receive inbound traffic from. You can\\n         specify one listener.</p>\"\
        },\
        \"logging\": {\
          \"shape\": \"Logging\",\
          \"documentation\": \"<p>The inbound and outbound access logging information for the virtual node.</p>\"\
        },\
        \"serviceDiscovery\": {\
          \"shape\": \"ServiceDiscovery\",\
          \"documentation\": \"<p>The service discovery information for the virtual node. If your virtual node does not\\n         expect ingress traffic, you can omit this parameter. If you specify a\\n         <code>listener</code>, then you must specify service discovery information.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the specification of a virtual node.</p>\"\
    },\
    \"ListMeshesOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshes\"\
      ],\
      \"members\": {\
        \"meshes\": {\
          \"shape\": \"MeshList\",\
          \"documentation\": \"<p>The list of existing service meshes.</p>\"\
        },\
        \"nextToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>The <code>nextToken</code> value to include in a future <code>ListMeshes</code> request.\\n         When the results of a <code>ListMeshes</code> request exceed <code>limit</code>, you can\\n         use this value to retrieve the next page of results. This value is <code>null</code> when\\n         there are no more results to return.</p>\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"VirtualRouterListeners\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"VirtualRouterListener\"\
      },\
      \"min\": 1,\
      \"max\": 1\
    },\
    \"PortSet\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"PortNumber\"\
      }\
    },\
    \"HttpMethod\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"CONNECT\",\
        \"DELETE\",\
        \"GET\",\
        \"HEAD\",\
        \"OPTIONS\",\
        \"PATCH\",\
        \"POST\",\
        \"PUT\",\
        \"TRACE\"\
      ]\
    },\
    \"ConflictException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"message\": {\
          \"shape\": \"String\"\
        }\
      },\
      \"documentation\": \"<p>The request contains a client token that was used for a previous update resource call\\n         with different specifications. Try the request again with a new client token.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"code\": \"ConflictException\",\
        \"httpStatusCode\": 409,\
        \"senderFault\": true\
      }\
    },\
    \"ListenerTimeout\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"grpc\": {\
          \"shape\": \"GrpcTimeout\"\
        },\
        \"http\": {\
          \"shape\": \"HttpTimeout\"\
        },\
        \"http2\": {\
          \"shape\": \"HttpTimeout\"\
        },\
        \"tcp\": {\
          \"shape\": \"TcpTimeout\"\
        }\
      }\
    },\
    \"MeshList\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"MeshRef\"\
      }\
    },\
    \"MaxRetries\": {\
      \"type\": \"long\",\
      \"box\": true,\
      \"min\": 0\
    },\
    \"TlsValidationContextTrust\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"acm\": {\
          \"shape\": \"TlsValidationContextAcmTrust\",\
          \"documentation\": \"<p>A reference to an object that represents a TLS validation context trust for an AWS Certicate Manager (ACM)\\n         certificate.</p>\"\
        },\
        \"file\": {\
          \"shape\": \"TlsValidationContextFileTrust\",\
          \"documentation\": \"<p>An object that represents a TLS validation context trust for a local file.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a Transport Layer Security (TLS) validation context trust.</p>\"\
    },\
    \"PortMapping\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"port\",\
        \"protocol\"\
      ],\
      \"members\": {\
        \"port\": {\
          \"shape\": \"PortNumber\",\
          \"documentation\": \"<p>The port used for the port mapping.</p>\"\
        },\
        \"protocol\": {\
          \"shape\": \"PortProtocol\",\
          \"documentation\": \"<p>The protocol used for the port mapping. Specify one protocol.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a port mapping.</p>\"\
    },\
    \"ListVirtualServicesOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualServices\"\
      ],\
      \"members\": {\
        \"nextToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>The <code>nextToken</code> value to include in a future <code>ListVirtualServices</code>\\n         request. When the results of a <code>ListVirtualServices</code> request exceed\\n            <code>limit</code>, you can use this value to retrieve the next page of results. This\\n         value is <code>null</code> when there are no more results to return.</p>\"\
        },\
        \"virtualServices\": {\
          \"shape\": \"VirtualServiceList\",\
          \"documentation\": \"<p>The list of existing virtual services for the specified service mesh.</p>\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"AwsCloudMapInstanceAttributeValue\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 1024,\
      \"pattern\": \"^([a-zA-Z0-9!-~][ ta-zA-Z0-9!-~]*){0,1}[a-zA-Z0-9!-~]{0,1}$\"\
    },\
    \"WeightedTarget\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualNode\",\
        \"weight\"\
      ],\
      \"members\": {\
        \"virtualNode\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The virtual node to associate with the weighted target.</p>\"\
        },\
        \"weight\": {\
          \"shape\": \"PercentInt\",\
          \"documentation\": \"<p>The relative weight of the weighted target.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a target and its relative weight. Traffic is distributed\\n         across targets according to their relative weight. For example, a weighted target with a\\n         relative weight of 50 receives five times as much traffic as one with a relative weight of\\n         10. The total weight for all targets combined must be less than or equal to 100.</p>\"\
    },\
    \"RouteRef\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"arn\",\
        \"createdAt\",\
        \"lastUpdatedAt\",\
        \"meshName\",\
        \"meshOwner\",\
        \"resourceOwner\",\
        \"routeName\",\
        \"version\",\
        \"virtualRouterName\"\
      ],\
      \"members\": {\
        \"arn\": {\
          \"shape\": \"Arn\",\
          \"documentation\": \"<p>The full Amazon Resource Name (ARN) for the route.</p>\"\
        },\
        \"createdAt\": {\
          \"shape\": \"Timestamp\",\
          \"documentation\": \"<p>The Unix epoch timestamp in seconds for when the resource was created.</p>\"\
        },\
        \"lastUpdatedAt\": {\
          \"shape\": \"Timestamp\",\
          \"documentation\": \"<p>The Unix epoch timestamp in seconds for when the resource was last updated.</p>\"\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh that the route resides in.</p>\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\"\
        },\
        \"resourceOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the resource owner. If the account ID is not your own, then it's\\n               the ID of the mesh owner or of another account that the mesh is shared with. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\"\
        },\
        \"routeName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the route.</p>\"\
        },\
        \"version\": {\
          \"shape\": \"Long\",\
          \"documentation\": \"<p>The version of the resource. Resources are created at version 1, and this version is incremented each time that they're updated.</p>\"\
        },\
        \"virtualRouterName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The virtual router that the route is associated with.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a route returned by a list operation.</p>\"\
    },\
    \"DeleteVirtualNodeInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"virtualNodeName\"\
      ],\
      \"members\": {\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh to delete the virtual node in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"virtualNodeName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual node to delete.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"virtualNodeName\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"RouteData\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"metadata\",\
        \"routeName\",\
        \"spec\",\
        \"status\",\
        \"virtualRouterName\"\
      ],\
      \"members\": {\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh that the route resides in.</p>\"\
        },\
        \"metadata\": {\
          \"shape\": \"ResourceMetadata\",\
          \"documentation\": \"<p>The associated metadata for the route.</p>\"\
        },\
        \"routeName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the route.</p>\"\
        },\
        \"spec\": {\
          \"shape\": \"RouteSpec\",\
          \"documentation\": \"<p>The specifications of the route.</p>\"\
        },\
        \"status\": {\
          \"shape\": \"RouteStatus\",\
          \"documentation\": \"<p>The status of the route.</p>\"\
        },\
        \"virtualRouterName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The virtual router that the route is associated with.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a route returned by a describe operation.</p>\"\
    },\
    \"RouteStatusCode\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"ACTIVE\",\
        \"DELETED\",\
        \"INACTIVE\"\
      ]\
    },\
    \"InternalServerErrorException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"message\": {\
          \"shape\": \"String\"\
        }\
      },\
      \"documentation\": \"<p>The request processing has failed because of an unknown error, exception, or\\n         failure.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"code\": \"InternalServerErrorException\",\
        \"httpStatusCode\": 500,\
        \"fault\": true\
      }\
    },\
    \"HeaderName\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 50\
    },\
    \"TagList\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"TagRef\"\
      },\
      \"min\": 0,\
      \"max\": 50\
    },\
    \"GrpcRetryPolicyEvent\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"cancelled\",\
        \"deadline-exceeded\",\
        \"internal\",\
        \"resource-exhausted\",\
        \"unavailable\"\
      ]\
    },\
    \"TlsValidationContextAcmTrust\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"certificateAuthorityArns\"\
      ],\
      \"members\": {\
        \"certificateAuthorityArns\": {\
          \"shape\": \"CertificateAuthorityArns\",\
          \"documentation\": \"<p>One or more ACM Amazon Resource Name (ARN)s.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a TLS validation context trust for an AWS Certicate Manager (ACM)\\n         certificate.</p>\"\
    },\
    \"ForbiddenException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"message\": {\
          \"shape\": \"String\"\
        }\
      },\
      \"documentation\": \"<p>You don't have permissions to perform this action.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"code\": \"ForbiddenException\",\
        \"httpStatusCode\": 403,\
        \"senderFault\": true\
      }\
    },\
    \"HeaderMatchMethod\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"exact\": {\
          \"shape\": \"HeaderMatch\",\
          \"documentation\": \"<p>The value sent by the client must match the specified value exactly.</p>\"\
        },\
        \"prefix\": {\
          \"shape\": \"HeaderMatch\",\
          \"documentation\": \"<p>The value sent by the client must begin with the specified characters.</p>\"\
        },\
        \"range\": {\
          \"shape\": \"MatchRange\",\
          \"documentation\": \"<p>An object that represents the range of values to match on.</p>\"\
        },\
        \"regex\": {\
          \"shape\": \"HeaderMatch\",\
          \"documentation\": \"<p>The value sent by the client must include the specified characters.</p>\"\
        },\
        \"suffix\": {\
          \"shape\": \"HeaderMatch\",\
          \"documentation\": \"<p>The value sent by the client must end with the specified characters.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the method and value to match with the header value sent in a\\n         request. Specify one match method.</p>\"\
    },\
    \"DeleteMeshOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"mesh\"\
      ],\
      \"members\": {\
        \"mesh\": {\
          \"shape\": \"MeshData\",\
          \"documentation\": \"<p>The service mesh that was deleted.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"mesh\"\
    },\
    \"EgressFilterType\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"ALLOW_ALL\",\
        \"DROP_ALL\"\
      ]\
    },\
    \"DurationValue\": {\
      \"type\": \"long\",\
      \"box\": true,\
      \"min\": 0\
    },\
    \"Hostname\": {\
      \"type\": \"string\"\
    },\
    \"TagResourceInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"resourceArn\",\
        \"tags\"\
      ],\
      \"members\": {\
        \"resourceArn\": {\
          \"shape\": \"Arn\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the resource to add tags to.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"resourceArn\"\
        },\
        \"tags\": {\
          \"shape\": \"TagList\",\
          \"documentation\": \"<p>The tags to add to the resource. A tag is an array of key-value pairs.\\n         Tag keys can have a maximum character length of 128 characters, and tag values can have\\n            a maximum length of 256 characters.</p>\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"VirtualServiceProvider\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"virtualNode\": {\
          \"shape\": \"VirtualNodeServiceProvider\",\
          \"documentation\": \"<p>The virtual node associated with a virtual service.</p>\"\
        },\
        \"virtualRouter\": {\
          \"shape\": \"VirtualRouterServiceProvider\",\
          \"documentation\": \"<p>The virtual router associated with a virtual service.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the provider for a virtual service.</p>\"\
    },\
    \"GrpcRouteMatch\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"metadata\": {\
          \"shape\": \"GrpcRouteMetadataList\",\
          \"documentation\": \"<p>An object that represents the data to match from the request.</p>\"\
        },\
        \"methodName\": {\
          \"shape\": \"MethodName\",\
          \"documentation\": \"<p>The method name to match from the request. If you specify a name, you must also specify\\n         a <code>serviceName</code>.</p>\"\
        },\
        \"serviceName\": {\
          \"shape\": \"ServiceName\",\
          \"documentation\": \"<p>The fully qualified domain name for the service to match from the request.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the criteria for determining a request match.</p>\"\
    },\
    \"AwsCloudMapServiceDiscovery\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"namespaceName\",\
        \"serviceName\"\
      ],\
      \"members\": {\
        \"attributes\": {\
          \"shape\": \"AwsCloudMapInstanceAttributes\",\
          \"documentation\": \"<p>A string map that contains attributes with values that you can use to filter instances\\n         by any custom attribute that you specified when you registered the instance. Only instances\\n         that match all of the specified key/value pairs will be returned.</p>\"\
        },\
        \"namespaceName\": {\
          \"shape\": \"AwsCloudMapName\",\
          \"documentation\": \"<p>The name of the AWS Cloud Map namespace to use.</p>\"\
        },\
        \"serviceName\": {\
          \"shape\": \"AwsCloudMapName\",\
          \"documentation\": \"<p>The name of the AWS Cloud Map service to use.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the AWS Cloud Map service discovery information for your virtual\\n         node.</p>\"\
    },\
    \"UpdateVirtualServiceOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualService\"\
      ],\
      \"members\": {\
        \"virtualService\": {\
          \"shape\": \"VirtualServiceData\",\
          \"documentation\": \"<p>A full description of the virtual service that was updated.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"virtualService\"\
    },\
    \"MeshStatus\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"status\": {\
          \"shape\": \"MeshStatusCode\",\
          \"documentation\": \"<p>The current mesh status.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the status of a service mesh.</p>\"\
    },\
    \"CreateVirtualNodeInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"spec\",\
        \"virtualNodeName\"\
      ],\
      \"members\": {\
        \"clientToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the\\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>\",\
          \"idempotencyToken\": true\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh to create the virtual node in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then\\n               the account that you specify must share the mesh with your account before you can create \\n             the resource in the service mesh. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"spec\": {\
          \"shape\": \"VirtualNodeSpec\",\
          \"documentation\": \"<p>The virtual node specification to apply.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"TagList\",\
          \"documentation\": \"<p>Optional metadata that you can apply to the virtual node to assist with categorization\\n         and organization. Each tag consists of a key and an optional value, both of which you\\n         define. Tag keys can have a maximum character length of 128 characters, and tag values can have\\n            a maximum length of 256 characters.</p>\",\
          \"tags\": [\
            \"not-preview\"\
          ]\
        },\
        \"virtualNodeName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name to use for the virtual node.</p>\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"NotFoundException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"message\": {\
          \"shape\": \"String\"\
        }\
      },\
      \"documentation\": \"<p>The specified resource doesn't exist. Check your request syntax and try again.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"code\": \"NotFoundException\",\
        \"httpStatusCode\": 404,\
        \"senderFault\": true\
      }\
    },\
    \"RouteSpec\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"grpcRoute\": {\
          \"shape\": \"GrpcRoute\",\
          \"documentation\": \"<p>An object that represents the specification of a gRPC route.</p>\"\
        },\
        \"http2Route\": {\
          \"shape\": \"HttpRoute\",\
          \"documentation\": \"<p>An object that represents the specification of an HTTP/2 route.</p>\"\
        },\
        \"httpRoute\": {\
          \"shape\": \"HttpRoute\",\
          \"documentation\": \"<p>An object that represents the specification of an HTTP route.</p>\"\
        },\
        \"priority\": {\
          \"shape\": \"RoutePriority\",\
          \"documentation\": \"<p>The priority for the route. Routes are matched based on the specified value, where 0 is\\n         the highest priority.</p>\"\
        },\
        \"tcpRoute\": {\
          \"shape\": \"TcpRoute\",\
          \"documentation\": \"<p>An object that represents the specification of a TCP route.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a route specification. Specify one route type.</p>\"\
    },\
    \"CreateVirtualServiceOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualService\"\
      ],\
      \"members\": {\
        \"virtualService\": {\
          \"shape\": \"VirtualServiceData\",\
          \"documentation\": \"<p>The full description of your virtual service following the create call.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"virtualService\"\
    },\
    \"FileAccessLog\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"path\"\
      ],\
      \"members\": {\
        \"path\": {\
          \"shape\": \"FilePath\",\
          \"documentation\": \"<p>The file path to write access logs to. You can use <code>/dev/stdout</code> to send\\n         access logs to standard out and configure your Envoy container to use a log driver, such as\\n            <code>awslogs</code>, to export the access logs to a log storage service such as Amazon\\n         CloudWatch Logs. You can also specify a path in the Envoy container's file system to write\\n         the files to disk.</p>\\n         <note>\\n            <p>The Envoy process must have write permissions to the path that you specify here.\\n            Otherwise, Envoy fails to bootstrap properly.</p>\\n         </note>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents an access log file.</p>\"\
    },\
    \"VirtualRouterServiceProvider\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualRouterName\"\
      ],\
      \"members\": {\
        \"virtualRouterName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual router that is acting as a service provider.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a virtual node service provider.</p>\"\
    },\
    \"HttpTimeout\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"idle\": {\
          \"shape\": \"Duration\"\
        },\
        \"perRequest\": {\
          \"shape\": \"Duration\"\
        }\
      }\
    },\
    \"DeleteVirtualServiceInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"virtualServiceName\"\
      ],\
      \"members\": {\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh to delete the virtual service in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"virtualServiceName\": {\
          \"shape\": \"ServiceName\",\
          \"documentation\": \"<p>The name of the virtual service to delete.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"virtualServiceName\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"TlsValidationContext\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"trust\"\
      ],\
      \"members\": {\
        \"trust\": {\
          \"shape\": \"TlsValidationContextTrust\",\
          \"documentation\": \"<p>A reference to an object that represents a TLS validation context trust.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a Transport Layer Security (TLS) validation context.</p>\"\
    },\
    \"DeleteVirtualRouterOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualRouter\"\
      ],\
      \"members\": {\
        \"virtualRouter\": {\
          \"shape\": \"VirtualRouterData\",\
          \"documentation\": \"<p>The virtual router that was deleted.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"virtualRouter\"\
    },\
    \"TagsLimit\": {\
      \"type\": \"integer\",\
      \"box\": true,\
      \"min\": 1,\
      \"max\": 50\
    },\
    \"DeleteVirtualNodeOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualNode\"\
      ],\
      \"members\": {\
        \"virtualNode\": {\
          \"shape\": \"VirtualNodeData\",\
          \"documentation\": \"<p>The virtual node that was deleted.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"virtualNode\"\
    },\
    \"UpdateVirtualNodeInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"spec\",\
        \"virtualNodeName\"\
      ],\
      \"members\": {\
        \"clientToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the\\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>\",\
          \"idempotencyToken\": true\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh that the virtual node resides in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"spec\": {\
          \"shape\": \"VirtualNodeSpec\",\
          \"documentation\": \"<p>The new virtual node specification to apply. This overwrites the existing data.</p>\"\
        },\
        \"virtualNodeName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual node to update.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"virtualNodeName\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"ListenerTls\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"certificate\",\
        \"mode\"\
      ],\
      \"members\": {\
        \"certificate\": {\
          \"shape\": \"ListenerTlsCertificate\",\
          \"documentation\": \"<p>A reference to an object that represents a listener's TLS certificate.</p>\"\
        },\
        \"mode\": {\
          \"shape\": \"ListenerTlsMode\",\
          \"documentation\": \"<p>Specify one of the following modes.</p>\\n         <ul>\\n            <li>\\n               <p>\\n                  <b/>STRICT â Listener only accepts connections with TLS\\n               enabled. </p>\\n            </li>\\n            <li>\\n               <p>\\n                  <b/>PERMISSIVE â Listener accepts connections with or\\n               without TLS enabled.</p>\\n            </li>\\n            <li>\\n               <p>\\n                  <b/>DISABLED â Listener only accepts connections without\\n               TLS. </p>\\n            </li>\\n         </ul>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the Transport Layer Security (TLS) properties for a listener.</p>\"\
    },\
    \"DeleteMeshInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\"\
      ],\
      \"members\": {\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh to delete.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"TcpRetryPolicyEvents\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"TcpRetryPolicyEvent\"\
      },\
      \"min\": 1,\
      \"max\": 1\
    },\
    \"CreateVirtualServiceInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"spec\",\
        \"virtualServiceName\"\
      ],\
      \"members\": {\
        \"clientToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the\\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>\",\
          \"idempotencyToken\": true\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh to create the virtual service in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then\\n               the account that you specify must share the mesh with your account before you can create \\n             the resource in the service mesh. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"spec\": {\
          \"shape\": \"VirtualServiceSpec\",\
          \"documentation\": \"<p>The virtual service specification to apply.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"TagList\",\
          \"documentation\": \"<p>Optional metadata that you can apply to the virtual service to assist with\\n         categorization and organization. Each tag consists of a key and an optional value, both of\\n         which you define. Tag keys can have a maximum character length of 128 characters, and tag values can have\\n            a maximum length of 256 characters.</p>\",\
          \"tags\": [\
            \"not-preview\"\
          ]\
        },\
        \"virtualServiceName\": {\
          \"shape\": \"ServiceName\",\
          \"documentation\": \"<p>The name to use for the virtual service.</p>\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"UpdateVirtualRouterInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"spec\",\
        \"virtualRouterName\"\
      ],\
      \"members\": {\
        \"clientToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the\\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>\",\
          \"idempotencyToken\": true\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh that the virtual router resides in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"spec\": {\
          \"shape\": \"VirtualRouterSpec\",\
          \"documentation\": \"<p>The new virtual router specification to apply. This overwrites the existing data.</p>\"\
        },\
        \"virtualRouterName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual router to update.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"virtualRouterName\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"ListTagsForResourceInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"resourceArn\"\
      ],\
      \"members\": {\
        \"limit\": {\
          \"shape\": \"TagsLimit\",\
          \"documentation\": \"<p>The maximum number of tag results returned by <code>ListTagsForResource</code> in\\n         paginated output. When this parameter is used, <code>ListTagsForResource</code> returns\\n         only <code>limit</code> results in a single page along with a <code>nextToken</code>\\n         response element. You can see the remaining results of the initial request by sending\\n         another <code>ListTagsForResource</code> request with the returned <code>nextToken</code>\\n         value. This value can be between 1 and 100. If you don't use\\n         this parameter, <code>ListTagsForResource</code> returns up to 100\\n         results and a <code>nextToken</code> value if applicable.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"limit\"\
        },\
        \"nextToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>The <code>nextToken</code> value returned from a previous paginated\\n            <code>ListTagsForResource</code> request where <code>limit</code> was used and the\\n         results exceeded the value of that parameter. Pagination continues from the end of the\\n         previous results that returned the <code>nextToken</code> value.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\"\
        },\
        \"resourceArn\": {\
          \"shape\": \"Arn\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) that identifies the resource to list the tags for.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"resourceArn\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"GrpcRetryPolicyEvents\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"GrpcRetryPolicyEvent\"\
      },\
      \"min\": 1,\
      \"max\": 5\
    },\
    \"ServiceUnavailableException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"message\": {\
          \"shape\": \"String\"\
        }\
      },\
      \"documentation\": \"<p>The request has failed due to a temporary failure of the service.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"code\": \"ServiceUnavailableException\",\
        \"httpStatusCode\": 503,\
        \"fault\": true\
      }\
    },\
    \"DescribeMeshOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"mesh\"\
      ],\
      \"members\": {\
        \"mesh\": {\
          \"shape\": \"MeshData\",\
          \"documentation\": \"<p>The full description of your service mesh.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"mesh\"\
    },\
    \"DeleteVirtualRouterInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"virtualRouterName\"\
      ],\
      \"members\": {\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh to delete the virtual router in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"virtualRouterName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual router to delete.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"virtualRouterName\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"DescribeRouteInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"routeName\",\
        \"virtualRouterName\"\
      ],\
      \"members\": {\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh that the route resides in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"routeName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the route to describe.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"routeName\"\
        },\
        \"virtualRouterName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual router that the route is associated with.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"virtualRouterName\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"DeleteRouteOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"route\"\
      ],\
      \"members\": {\
        \"route\": {\
          \"shape\": \"RouteData\",\
          \"documentation\": \"<p>The route that was deleted.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"route\"\
    },\
    \"Listeners\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"Listener\"\
      },\
      \"min\": 0,\
      \"max\": 1\
    },\
    \"Backends\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"Backend\"\
      }\
    },\
    \"PortProtocol\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"grpc\",\
        \"http\",\
        \"http2\",\
        \"tcp\"\
      ]\
    },\
    \"VirtualNodeStatusCode\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"ACTIVE\",\
        \"DELETED\",\
        \"INACTIVE\"\
      ]\
    },\
    \"ServiceName\": {\
      \"type\": \"string\"\
    },\
    \"UpdateVirtualServiceInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"spec\",\
        \"virtualServiceName\"\
      ],\
      \"members\": {\
        \"clientToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the\\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>\",\
          \"idempotencyToken\": true\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh that the virtual service resides in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"spec\": {\
          \"shape\": \"VirtualServiceSpec\",\
          \"documentation\": \"<p>The new virtual service specification to apply. This overwrites the existing\\n         data.</p>\"\
        },\
        \"virtualServiceName\": {\
          \"shape\": \"ServiceName\",\
          \"documentation\": \"<p>The name of the virtual service to update.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"virtualServiceName\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"HealthCheckThreshold\": {\
      \"type\": \"integer\",\
      \"min\": 2,\
      \"max\": 10\
    },\
    \"UpdateRouteOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"route\"\
      ],\
      \"members\": {\
        \"route\": {\
          \"shape\": \"RouteData\",\
          \"documentation\": \"<p>A full description of the route that was updated.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"route\"\
    },\
    \"PercentInt\": {\
      \"type\": \"integer\",\
      \"min\": 0,\
      \"max\": 100\
    },\
    \"MethodName\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 50\
    },\
    \"TagValue\": {\
      \"type\": \"string\",\
      \"min\": 0,\
      \"max\": 256\
    },\
    \"HttpRouteAction\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"weightedTargets\"\
      ],\
      \"members\": {\
        \"weightedTargets\": {\
          \"shape\": \"WeightedTargets\",\
          \"documentation\": \"<p>An object that represents the targets that traffic is routed to when a request matches the route.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the action to take if a match is determined.</p>\"\
    },\
    \"ListRoutesInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"virtualRouterName\"\
      ],\
      \"members\": {\
        \"limit\": {\
          \"shape\": \"ListRoutesLimit\",\
          \"documentation\": \"<p>The maximum number of results returned by <code>ListRoutes</code> in paginated output.\\n         When you use this parameter, <code>ListRoutes</code> returns only <code>limit</code>\\n         results in a single page along with a <code>nextToken</code> response element. You can see\\n         the remaining results of the initial request by sending another <code>ListRoutes</code>\\n         request with the returned <code>nextToken</code> value. This value can be between\\n         1 and 100. If you don't use this parameter,\\n            <code>ListRoutes</code> returns up to 100 results and a\\n            <code>nextToken</code> value if applicable.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"limit\"\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh to list routes in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"nextToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>The <code>nextToken</code> value returned from a previous paginated\\n            <code>ListRoutes</code> request where <code>limit</code> was used and the results\\n         exceeded the value of that parameter. Pagination continues from the end of the previous\\n         results that returned the <code>nextToken</code> value.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\"\
        },\
        \"virtualRouterName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual router to list routes in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"virtualRouterName\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"VirtualServiceRef\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"arn\",\
        \"createdAt\",\
        \"lastUpdatedAt\",\
        \"meshName\",\
        \"meshOwner\",\
        \"resourceOwner\",\
        \"version\",\
        \"virtualServiceName\"\
      ],\
      \"members\": {\
        \"arn\": {\
          \"shape\": \"Arn\",\
          \"documentation\": \"<p>The full Amazon Resource Name (ARN) for the virtual service.</p>\"\
        },\
        \"createdAt\": {\
          \"shape\": \"Timestamp\",\
          \"documentation\": \"<p>The Unix epoch timestamp in seconds for when the resource was created.</p>\"\
        },\
        \"lastUpdatedAt\": {\
          \"shape\": \"Timestamp\",\
          \"documentation\": \"<p>The Unix epoch timestamp in seconds for when the resource was last updated.</p>\"\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh that the virtual service resides in.</p>\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\"\
        },\
        \"resourceOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the resource owner. If the account ID is not your own, then it's\\n               the ID of the mesh owner or of another account that the mesh is shared with. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\"\
        },\
        \"version\": {\
          \"shape\": \"Long\",\
          \"documentation\": \"<p>The version of the resource. Resources are created at version 1, and this version is incremented each time that they're updated.</p>\"\
        },\
        \"virtualServiceName\": {\
          \"shape\": \"ServiceName\",\
          \"documentation\": \"<p>The name of the virtual service.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a virtual service returned by a list operation.</p>\"\
    },\
    \"GrpcTimeout\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"idle\": {\
          \"shape\": \"Duration\"\
        },\
        \"perRequest\": {\
          \"shape\": \"Duration\"\
        }\
      }\
    },\
    \"VirtualNodeStatus\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"status\"\
      ],\
      \"members\": {\
        \"status\": {\
          \"shape\": \"VirtualNodeStatusCode\",\
          \"documentation\": \"<p>The current status of the virtual node.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the current status of the virtual node.</p>\"\
    },\
    \"VirtualRouterRef\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"arn\",\
        \"createdAt\",\
        \"lastUpdatedAt\",\
        \"meshName\",\
        \"meshOwner\",\
        \"resourceOwner\",\
        \"version\",\
        \"virtualRouterName\"\
      ],\
      \"members\": {\
        \"arn\": {\
          \"shape\": \"Arn\",\
          \"documentation\": \"<p>The full Amazon Resource Name (ARN) for the virtual router.</p>\"\
        },\
        \"createdAt\": {\
          \"shape\": \"Timestamp\",\
          \"documentation\": \"<p>The Unix epoch timestamp in seconds for when the resource was created.</p>\"\
        },\
        \"lastUpdatedAt\": {\
          \"shape\": \"Timestamp\",\
          \"documentation\": \"<p>The Unix epoch timestamp in seconds for when the resource was last updated.</p>\"\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh that the virtual router resides in.</p>\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\"\
        },\
        \"resourceOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the resource owner. If the account ID is not your own, then it's\\n               the ID of the mesh owner or of another account that the mesh is shared with. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\"\
        },\
        \"version\": {\
          \"shape\": \"Long\",\
          \"documentation\": \"<p>The version of the resource. Resources are created at version 1, and this version is incremented each time that they're updated.</p>\"\
        },\
        \"virtualRouterName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual router.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a virtual router returned by a list operation.</p>\"\
    },\
    \"VirtualServiceData\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"metadata\",\
        \"spec\",\
        \"status\",\
        \"virtualServiceName\"\
      ],\
      \"members\": {\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh that the virtual service resides in.</p>\"\
        },\
        \"metadata\": {\
          \"shape\": \"ResourceMetadata\"\
        },\
        \"spec\": {\
          \"shape\": \"VirtualServiceSpec\",\
          \"documentation\": \"<p>The specifications of the virtual service.</p>\"\
        },\
        \"status\": {\
          \"shape\": \"VirtualServiceStatus\",\
          \"documentation\": \"<p>The current status of the virtual service.</p>\"\
        },\
        \"virtualServiceName\": {\
          \"shape\": \"ServiceName\",\
          \"documentation\": \"<p>The name of the virtual service.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a virtual service returned by a describe operation.</p>\"\
    },\
    \"HttpRouteHeader\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"name\"\
      ],\
      \"members\": {\
        \"invert\": {\
          \"shape\": \"Boolean\",\
          \"documentation\": \"<p>Specify <code>True</code> to match anything except the match criteria. The default value is <code>False</code>.</p>\"\
        },\
        \"match\": {\
          \"shape\": \"HeaderMatchMethod\",\
          \"documentation\": \"<p>The <code>HeaderMatchMethod</code> object.</p>\"\
        },\
        \"name\": {\
          \"shape\": \"HeaderName\",\
          \"documentation\": \"<p>A name for the HTTP header in the client request that will be matched on.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the HTTP header in the request.</p>\"\
    },\
    \"FilePath\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 255\
    },\
    \"AwsCloudMapInstanceAttributes\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"AwsCloudMapInstanceAttribute\"\
      }\
    },\
    \"VirtualNodeRef\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"arn\",\
        \"createdAt\",\
        \"lastUpdatedAt\",\
        \"meshName\",\
        \"meshOwner\",\
        \"resourceOwner\",\
        \"version\",\
        \"virtualNodeName\"\
      ],\
      \"members\": {\
        \"arn\": {\
          \"shape\": \"Arn\",\
          \"documentation\": \"<p>The full Amazon Resource Name (ARN) for the virtual node.</p>\"\
        },\
        \"createdAt\": {\
          \"shape\": \"Timestamp\",\
          \"documentation\": \"<p>The Unix epoch timestamp in seconds for when the resource was created.</p>\"\
        },\
        \"lastUpdatedAt\": {\
          \"shape\": \"Timestamp\",\
          \"documentation\": \"<p>The Unix epoch timestamp in seconds for when the resource was last updated.</p>\"\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh that the virtual node resides in.</p>\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\"\
        },\
        \"resourceOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the resource owner. If the account ID is not your own, then it's\\n               the ID of the mesh owner or of another account that the mesh is shared with. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\"\
        },\
        \"version\": {\
          \"shape\": \"Long\",\
          \"documentation\": \"<p>The version of the resource. Resources are created at version 1, and this version is incremented each time that they're updated.</p>\"\
        },\
        \"virtualNodeName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual node.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a virtual node returned by a list operation.</p>\"\
    },\
    \"CreateMeshInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\"\
      ],\
      \"members\": {\
        \"clientToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the\\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>\",\
          \"idempotencyToken\": true\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name to use for the service mesh.</p>\"\
        },\
        \"spec\": {\
          \"shape\": \"MeshSpec\",\
          \"documentation\": \"<p>The service mesh specification to apply.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"TagList\",\
          \"documentation\": \"<p>Optional metadata that you can apply to the service mesh to assist with categorization\\n         and organization. Each tag consists of a key and an optional value, both of which you\\n         define. Tag keys can have a maximum character length of 128 characters, and tag values can have\\n            a maximum length of 256 characters.</p>\",\
          \"tags\": [\
            \"not-preview\"\
          ]\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"GrpcRouteAction\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"weightedTargets\"\
      ],\
      \"members\": {\
        \"weightedTargets\": {\
          \"shape\": \"WeightedTargets\",\
          \"documentation\": \"<p>An object that represents the targets that traffic is routed to when a request matches the route.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the action to take if a match is determined.</p>\"\
    },\
    \"LimitExceededException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"message\": {\
          \"shape\": \"String\"\
        }\
      },\
      \"documentation\": \"<p>You have exceeded a service limit for your account. For more information, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/service-quotas.html\\\">Service\\n            Limits</a> in the <i>AWS App Mesh User Guide</i>.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"code\": \"LimitExceededException\",\
        \"httpStatusCode\": 400,\
        \"senderFault\": true\
      }\
    },\
    \"UpdateMeshOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"mesh\"\
      ],\
      \"members\": {\
        \"mesh\": {\
          \"shape\": \"MeshData\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"mesh\"\
    },\
    \"GrpcRouteMetadataMatchMethod\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"exact\": {\
          \"shape\": \"HeaderMatch\",\
          \"documentation\": \"<p>The value sent by the client must match the specified value exactly.</p>\"\
        },\
        \"prefix\": {\
          \"shape\": \"HeaderMatch\",\
          \"documentation\": \"<p>The value sent by the client must begin with the specified characters.</p>\"\
        },\
        \"range\": {\
          \"shape\": \"MatchRange\",\
          \"documentation\": \"<p>An object that represents the range of values to match on.</p>\"\
        },\
        \"regex\": {\
          \"shape\": \"HeaderMatch\",\
          \"documentation\": \"<p>The value sent by the client must include the specified characters.</p>\"\
        },\
        \"suffix\": {\
          \"shape\": \"HeaderMatch\",\
          \"documentation\": \"<p>The value sent by the client must end with the specified characters.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the match method. Specify one of the match values.</p>\"\
    },\
    \"DescribeVirtualServiceInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"virtualServiceName\"\
      ],\
      \"members\": {\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh that the virtual service resides in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"virtualServiceName\": {\
          \"shape\": \"ServiceName\",\
          \"documentation\": \"<p>The name of the virtual service to describe.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"virtualServiceName\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"ListVirtualServicesLimit\": {\
      \"type\": \"integer\",\
      \"box\": true,\
      \"min\": 1,\
      \"max\": 100\
    },\
    \"AwsCloudMapInstanceAttribute\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"key\",\
        \"value\"\
      ],\
      \"members\": {\
        \"key\": {\
          \"shape\": \"AwsCloudMapInstanceAttributeKey\",\
          \"documentation\": \"<p>The name of an AWS Cloud Map service instance attribute key. Any AWS Cloud Map service\\n         instance that contains the specified key and value is returned.</p>\"\
        },\
        \"value\": {\
          \"shape\": \"AwsCloudMapInstanceAttributeValue\",\
          \"documentation\": \"<p>The value of an AWS Cloud Map service instance attribute key. Any AWS Cloud Map service\\n         instance that contains the specified key and value is returned.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the AWS Cloud Map attribute information for your virtual\\n         node.</p>\"\
    },\
    \"VirtualServiceSpec\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"provider\": {\
          \"shape\": \"VirtualServiceProvider\",\
          \"documentation\": \"<p>The App Mesh object that is acting as the provider for a virtual service. You can specify\\n         a single virtual node or virtual router.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the specification of a virtual service.</p>\"\
    },\
    \"MatchRange\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"end\",\
        \"start\"\
      ],\
      \"members\": {\
        \"end\": {\
          \"shape\": \"Long\",\
          \"documentation\": \"<p>The end of the range.</p>\"\
        },\
        \"start\": {\
          \"shape\": \"Long\",\
          \"documentation\": \"<p>The start of the range.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the range of values to match on. The first character of the range is included in the range, though the last character is not. For example, if the range specified were 1-100, only values 1-99 would be matched.</p>\"\
    },\
    \"ListVirtualRoutersLimit\": {\
      \"type\": \"integer\",\
      \"box\": true,\
      \"min\": 1,\
      \"max\": 100\
    },\
    \"HealthCheckIntervalMillis\": {\
      \"type\": \"long\",\
      \"box\": true,\
      \"min\": 5000,\
      \"max\": 300000\
    },\
    \"VirtualRouterList\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"VirtualRouterRef\"\
      }\
    },\
    \"Arn\": {\
      \"type\": \"string\"\
    },\
    \"TcpRoute\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"action\"\
      ],\
      \"members\": {\
        \"action\": {\
          \"shape\": \"TcpRouteAction\",\
          \"documentation\": \"<p>The action to take if a match is determined.</p>\"\
        },\
        \"timeout\": {\
          \"shape\": \"TcpTimeout\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a TCP route type.</p>\"\
    },\
    \"VirtualNodeList\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"VirtualNodeRef\"\
      }\
    },\
    \"ListVirtualRoutersInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\"\
      ],\
      \"members\": {\
        \"limit\": {\
          \"shape\": \"ListVirtualRoutersLimit\",\
          \"documentation\": \"<p>The maximum number of results returned by <code>ListVirtualRouters</code> in paginated\\n         output. When you use this parameter, <code>ListVirtualRouters</code> returns only\\n            <code>limit</code> results in a single page along with a <code>nextToken</code> response\\n         element. You can see the remaining results of the initial request by sending another\\n            <code>ListVirtualRouters</code> request with the returned <code>nextToken</code> value.\\n         This value can be between 1 and 100. If you don't use this\\n         parameter, <code>ListVirtualRouters</code> returns up to 100 results and\\n         a <code>nextToken</code> value if applicable.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"limit\"\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh to list virtual routers in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"nextToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>The <code>nextToken</code> value returned from a previous paginated\\n            <code>ListVirtualRouters</code> request where <code>limit</code> was used and the\\n         results exceeded the value of that parameter. Pagination continues from the end of the\\n         previous results that returned the <code>nextToken</code> value.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"DurationUnit\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"ms\",\
        \"s\"\
      ]\
    },\
    \"RoutePriority\": {\
      \"type\": \"integer\",\
      \"box\": true,\
      \"min\": 0,\
      \"max\": 1000\
    },\
    \"ListVirtualServicesInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\"\
      ],\
      \"members\": {\
        \"limit\": {\
          \"shape\": \"ListVirtualServicesLimit\",\
          \"documentation\": \"<p>The maximum number of results returned by <code>ListVirtualServices</code> in paginated\\n         output. When you use this parameter, <code>ListVirtualServices</code> returns only\\n            <code>limit</code> results in a single page along with a <code>nextToken</code> response\\n         element. You can see the remaining results of the initial request by sending another\\n            <code>ListVirtualServices</code> request with the returned <code>nextToken</code> value.\\n         This value can be between 1 and 100. If you don't use this\\n         parameter, <code>ListVirtualServices</code> returns up to 100 results and\\n         a <code>nextToken</code> value if applicable.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"limit\"\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh to list virtual services in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"nextToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>The <code>nextToken</code> value returned from a previous paginated\\n            <code>ListVirtualServices</code> request where <code>limit</code> was used and the\\n         results exceeded the value of that parameter. Pagination continues from the end of the\\n         previous results that returned the <code>nextToken</code> value.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"AccessLog\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"file\": {\
          \"shape\": \"FileAccessLog\",\
          \"documentation\": \"<p>The file object to send virtual node access logs to.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the access logging information for a virtual node.</p>\"\
    },\
    \"ListVirtualNodesInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\"\
      ],\
      \"members\": {\
        \"limit\": {\
          \"shape\": \"ListVirtualNodesLimit\",\
          \"documentation\": \"<p>The maximum number of results returned by <code>ListVirtualNodes</code> in paginated\\n         output. When you use this parameter, <code>ListVirtualNodes</code> returns only\\n            <code>limit</code> results in a single page along with a <code>nextToken</code> response\\n         element. You can see the remaining results of the initial request by sending another\\n            <code>ListVirtualNodes</code> request with the returned <code>nextToken</code> value.\\n         This value can be between 1 and 100. If you don't use this\\n         parameter, <code>ListVirtualNodes</code> returns up to 100 results and a\\n            <code>nextToken</code> value if applicable.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"limit\"\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh to list virtual nodes in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"nextToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>The <code>nextToken</code> value returned from a previous paginated\\n            <code>ListVirtualNodes</code> request where <code>limit</code> was used and the results\\n         exceeded the value of that parameter. Pagination continues from the end of the previous\\n         results that returned the <code>nextToken</code> value.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"nextToken\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"ListVirtualNodesLimit\": {\
      \"type\": \"integer\",\
      \"box\": true,\
      \"min\": 1,\
      \"max\": 100\
    },\
    \"HealthCheckTimeoutMillis\": {\
      \"type\": \"long\",\
      \"box\": true,\
      \"min\": 2000,\
      \"max\": 60000\
    },\
    \"ResourceName\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 255\
    },\
    \"TooManyRequestsException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"message\": {\
          \"shape\": \"String\"\
        }\
      },\
      \"documentation\": \"<p>The maximum request rate permitted by the App Mesh APIs has been exceeded for your\\n         account. For best results, use an increasing or variable sleep interval between\\n         requests.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"code\": \"TooManyRequestsException\",\
        \"httpStatusCode\": 429,\
        \"senderFault\": true\
      }\
    },\
    \"Timestamp\": {\
      \"type\": \"timestamp\"\
    },\
    \"HeaderMatch\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 255\
    },\
    \"AccountId\": {\
      \"type\": \"string\",\
      \"min\": 12,\
      \"max\": 12\
    },\
    \"Duration\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"unit\": {\
          \"shape\": \"DurationUnit\",\
          \"documentation\": \"<p>A unit of time.</p>\"\
        },\
        \"value\": {\
          \"shape\": \"DurationValue\",\
          \"documentation\": \"<p>A number of time units.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a duration of time.</p>\"\
    },\
    \"DescribeRouteOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"route\"\
      ],\
      \"members\": {\
        \"route\": {\
          \"shape\": \"RouteData\",\
          \"documentation\": \"<p>The full description of your route.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"route\"\
    },\
    \"HttpRouteMatch\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"prefix\"\
      ],\
      \"members\": {\
        \"headers\": {\
          \"shape\": \"HttpRouteHeaders\",\
          \"documentation\": \"<p>An object that represents the client request headers to match on.</p>\"\
        },\
        \"method\": {\
          \"shape\": \"HttpMethod\",\
          \"documentation\": \"<p>The client request method to match on. Specify only one.</p>\"\
        },\
        \"prefix\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>Specifies the path to match requests with. This parameter must always start with\\n            <code>/</code>, which by itself matches all requests to the virtual service name. You\\n         can also match for path-based routing of requests. For example, if your virtual service\\n         name is <code>my-service.local</code> and you want the route to match requests to\\n            <code>my-service.local/metrics</code>, your prefix should be\\n         <code>/metrics</code>.</p>\"\
        },\
        \"scheme\": {\
          \"shape\": \"HttpScheme\",\
          \"documentation\": \"<p>The client request scheme to match on. Specify only one.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the requirements for a route to match HTTP requests for a\\n         virtual router.</p>\"\
    },\
    \"TagRef\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"key\"\
      ],\
      \"members\": {\
        \"key\": {\
          \"shape\": \"TagKey\",\
          \"documentation\": \"<p>One part of a key-value pair that make up a tag. A <code>key</code> is a general label\\n         that acts like a category for more specific tag values.</p>\"\
        },\
        \"value\": {\
          \"shape\": \"TagValue\",\
          \"documentation\": \"<p>The optional part of a key-value pair that make up a tag. A <code>value</code> acts as a\\n         descriptor within a tag category (key).</p>\"\
        }\
      },\
      \"documentation\": \"<p>Optional metadata that you apply to a resource to assist with categorization and\\n         organization. Each tag consists of a key and an optional value, both of which you define.\\n         Tag keys can have a maximum character length of 128 characters, and tag values can have\\n            a maximum length of 256 characters.</p>\"\
    },\
    \"MeshRef\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"arn\",\
        \"createdAt\",\
        \"lastUpdatedAt\",\
        \"meshName\",\
        \"meshOwner\",\
        \"resourceOwner\",\
        \"version\"\
      ],\
      \"members\": {\
        \"arn\": {\
          \"shape\": \"Arn\",\
          \"documentation\": \"<p>The full Amazon Resource Name (ARN) of the service mesh.</p>\"\
        },\
        \"createdAt\": {\
          \"shape\": \"Timestamp\",\
          \"documentation\": \"<p>The Unix epoch timestamp in seconds for when the resource was created.</p>\"\
        },\
        \"lastUpdatedAt\": {\
          \"shape\": \"Timestamp\",\
          \"documentation\": \"<p>The Unix epoch timestamp in seconds for when the resource was last updated.</p>\"\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh.</p>\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\"\
        },\
        \"resourceOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the resource owner. If the account ID is not your own, then it's\\n               the ID of the mesh owner or of another account that the mesh is shared with. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\"\
        },\
        \"version\": {\
          \"shape\": \"Long\",\
          \"documentation\": \"<p>The version of the resource. Resources are created at version 1, and this version is incremented each time that they're updated.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a service mesh returned by a list operation.</p>\"\
    },\
    \"MeshStatusCode\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"ACTIVE\",\
        \"DELETED\",\
        \"INACTIVE\"\
      ]\
    },\
    \"MeshData\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"metadata\",\
        \"spec\",\
        \"status\"\
      ],\
      \"members\": {\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh.</p>\"\
        },\
        \"metadata\": {\
          \"shape\": \"ResourceMetadata\",\
          \"documentation\": \"<p>The associated metadata for the service mesh.</p>\"\
        },\
        \"spec\": {\
          \"shape\": \"MeshSpec\",\
          \"documentation\": \"<p>The associated specification for the service mesh.</p>\"\
        },\
        \"status\": {\
          \"shape\": \"MeshStatus\",\
          \"documentation\": \"<p>The status of the service mesh.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a service mesh returned by a describe operation.</p>\"\
    },\
    \"VirtualRouterStatus\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"status\"\
      ],\
      \"members\": {\
        \"status\": {\
          \"shape\": \"VirtualRouterStatusCode\",\
          \"documentation\": \"<p>The current status of the virtual router.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the status of a virtual router. </p>\"\
    },\
    \"TcpRouteAction\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"weightedTargets\"\
      ],\
      \"members\": {\
        \"weightedTargets\": {\
          \"shape\": \"WeightedTargets\",\
          \"documentation\": \"<p>An object that represents the targets that traffic is routed to when a request matches the route.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the action to take if a match is determined.</p>\"\
    },\
    \"DescribeVirtualNodeInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"virtualNodeName\"\
      ],\
      \"members\": {\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh that the virtual node resides in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"virtualNodeName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual node to describe.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"virtualNodeName\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"RouteStatus\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"status\"\
      ],\
      \"members\": {\
        \"status\": {\
          \"shape\": \"RouteStatusCode\",\
          \"documentation\": \"<p>The current status for the route.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the current status of a route.</p>\"\
    },\
    \"Listener\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"portMapping\"\
      ],\
      \"members\": {\
        \"healthCheck\": {\
          \"shape\": \"HealthCheckPolicy\",\
          \"documentation\": \"<p>The health check information for the listener.</p>\"\
        },\
        \"portMapping\": {\
          \"shape\": \"PortMapping\",\
          \"documentation\": \"<p>The port mapping information for the listener.</p>\"\
        },\
        \"timeout\": {\
          \"shape\": \"ListenerTimeout\"\
        },\
        \"tls\": {\
          \"shape\": \"ListenerTls\",\
          \"documentation\": \"<p>A reference to an object that represents the Transport Layer Security (TLS) properties for a listener.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a listener for a virtual node.</p>\"\
    },\
    \"GrpcRoute\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"action\",\
        \"match\"\
      ],\
      \"members\": {\
        \"action\": {\
          \"shape\": \"GrpcRouteAction\",\
          \"documentation\": \"<p>An object that represents the action to take if a match is determined.</p>\"\
        },\
        \"match\": {\
          \"shape\": \"GrpcRouteMatch\",\
          \"documentation\": \"<p>An object that represents the criteria for determining a request match.</p>\"\
        },\
        \"retryPolicy\": {\
          \"shape\": \"GrpcRetryPolicy\",\
          \"documentation\": \"<p>An object that represents a retry policy.</p>\"\
        },\
        \"timeout\": {\
          \"shape\": \"GrpcTimeout\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a gRPC route type.</p>\"\
    },\
    \"ListRoutesLimit\": {\
      \"type\": \"integer\",\
      \"box\": true,\
      \"min\": 1,\
      \"max\": 100\
    },\
    \"ClientPolicyTls\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"validation\"\
      ],\
      \"members\": {\
        \"enforce\": {\
          \"shape\": \"Boolean\",\
          \"box\": true,\
          \"documentation\": \"<p>Whether the policy is enforced. The default is <code>True</code>, if a value isn't\\n         specified.</p>\"\
        },\
        \"ports\": {\
          \"shape\": \"PortSet\",\
          \"documentation\": \"<p>One or more ports that the policy is enforced for.</p>\"\
        },\
        \"validation\": {\
          \"shape\": \"TlsValidationContext\",\
          \"documentation\": \"<p>A reference to an object that represents a TLS validation context.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a Transport Layer Security (TLS) client policy.</p>\"\
    },\
    \"DeleteVirtualServiceOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualService\"\
      ],\
      \"members\": {\
        \"virtualService\": {\
          \"shape\": \"VirtualServiceData\",\
          \"documentation\": \"<p>The virtual service that was deleted.</p>\"\
        }\
      },\
      \"documentation\": \"\",\
      \"payload\": \"virtualService\"\
    },\
    \"VirtualNodeServiceProvider\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualNodeName\"\
      ],\
      \"members\": {\
        \"virtualNodeName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual node that is acting as a service provider.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a virtual node service provider.</p>\"\
    },\
    \"BackendDefaults\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"clientPolicy\": {\
          \"shape\": \"ClientPolicy\",\
          \"documentation\": \"<p>A reference to an object that represents a client policy.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the default properties for a backend.</p>\"\
    },\
    \"ListenerTlsFileCertificate\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"certificateChain\",\
        \"privateKey\"\
      ],\
      \"members\": {\
        \"certificateChain\": {\
          \"shape\": \"FilePath\",\
          \"documentation\": \"<p>The certificate chain for the certificate.</p>\"\
        },\
        \"privateKey\": {\
          \"shape\": \"FilePath\",\
          \"documentation\": \"<p>The private key for a certificate stored on the file system of the virtual node that the\\n         proxy is running on.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a local file certificate.\\n         The certificate must meet specific requirements and you must have proxy authorization enabled. For more information, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html#virtual-node-tls-prerequisites\\\">Transport Layer Security (TLS)</a>.</p>\"\
    },\
    \"HttpRetryPolicy\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"maxRetries\",\
        \"perRetryTimeout\"\
      ],\
      \"members\": {\
        \"httpRetryEvents\": {\
          \"shape\": \"HttpRetryPolicyEvents\",\
          \"documentation\": \"<p>Specify at least one of the following values.</p> \\n         <ul>\\n            <li>\\n               <p>\\n                  <b>server-error</b> â HTTP status codes 500, 501,\\n                  502, 503, 504, 505, 506, 507, 508, 510, and 511</p>\\n            </li>\\n            <li>\\n               <p>\\n                  <b>gateway-error</b> â HTTP status codes 502,\\n                  503, and 504</p>\\n            </li>\\n            <li>\\n               <p>\\n                  <b>client-error</b> â HTTP status code 409</p>\\n            </li>\\n            <li>\\n               <p>\\n                  <b>stream-error</b> â Retry on refused\\n                  stream</p>\\n            </li>\\n         </ul>\"\
        },\
        \"maxRetries\": {\
          \"shape\": \"MaxRetries\",\
          \"documentation\": \"<p>The maximum number of retry attempts.</p>\"\
        },\
        \"perRetryTimeout\": {\
          \"shape\": \"Duration\",\
          \"documentation\": \"<p>An object that represents a duration of time.</p>\"\
        },\
        \"tcpRetryEvents\": {\
          \"shape\": \"TcpRetryPolicyEvents\",\
          \"documentation\": \"<p>Specify a valid value.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a retry policy. Specify at least one value for at least one of the types of <code>RetryEvents</code>, a value for <code>maxRetries</code>, and a value for <code>perRetryTimeout</code>.</p>\"\
    },\
    \"DescribeVirtualRouterInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"virtualRouterName\"\
      ],\
      \"members\": {\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh that the virtual router resides in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"virtualRouterName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual router to describe.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"virtualRouterName\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"TagResourceOutput\": {\
      \"type\": \"structure\",\
      \"members\": { },\
      \"documentation\": \"\"\
    },\
    \"RouteList\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"RouteRef\"\
      }\
    },\
    \"TooManyTagsException\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"message\": {\
          \"shape\": \"String\"\
        }\
      },\
      \"documentation\": \"<p>The request exceeds the maximum allowed number of tags allowed per resource. The current\\n         limit is 50 user tags per resource. You must reduce the number of tags in the request. None\\n         of the tags in this request were applied.</p>\",\
      \"exception\": true,\
      \"error\": {\
        \"code\": \"TooManyTagsException\",\
        \"httpStatusCode\": 400,\
        \"senderFault\": true\
      }\
    },\
    \"PortNumber\": {\
      \"type\": \"integer\",\
      \"min\": 1,\
      \"max\": 65535\
    },\
    \"TlsValidationContextFileTrust\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"certificateChain\"\
      ],\
      \"members\": {\
        \"certificateChain\": {\
          \"shape\": \"FilePath\",\
          \"documentation\": \"<p>The certificate trust chain for a certificate stored on the file system of the virtual\\n         node that the proxy is running on.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents a Transport Layer Security (TLS) validation context trust for a local file.</p>\"\
    },\
    \"GrpcRouteMetadata\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"name\"\
      ],\
      \"members\": {\
        \"invert\": {\
          \"shape\": \"Boolean\",\
          \"documentation\": \"<p>Specify <code>True</code> to match anything except the match criteria. The default value is <code>False</code>.</p>\"\
        },\
        \"match\": {\
          \"shape\": \"GrpcRouteMetadataMatchMethod\",\
          \"documentation\": \"<p>An object that represents the data to match from the request.</p>\"\
        },\
        \"name\": {\
          \"shape\": \"HeaderName\",\
          \"documentation\": \"<p>The name of the route.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the match metadata for the route.</p>\"\
    },\
    \"CreateRouteInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"routeName\",\
        \"spec\",\
        \"virtualRouterName\"\
      ],\
      \"members\": {\
        \"clientToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the\\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>\",\
          \"idempotencyToken\": true\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh to create the route in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then\\n               the account that you specify must share the mesh with your account before you can create \\n             the resource in the service mesh. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"routeName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name to use for the route.</p>\"\
        },\
        \"spec\": {\
          \"shape\": \"RouteSpec\",\
          \"documentation\": \"<p>The route specification to apply.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"TagList\",\
          \"documentation\": \"<p>Optional metadata that you can apply to the route to assist with categorization and\\n         organization. Each tag consists of a key and an optional value, both of which you define.\\n         Tag keys can have a maximum character length of 128 characters, and tag values can have\\n            a maximum length of 256 characters.</p>\",\
          \"tags\": [\
            \"not-preview\"\
          ]\
        },\
        \"virtualRouterName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual router in which to create the route. If the virtual router is in\\n         a shared mesh, then you must be the owner of the virtual router resource.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"virtualRouterName\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"WeightedTargets\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"WeightedTarget\"\
      },\
      \"min\": 1,\
      \"max\": 10\
    },\
    \"HttpRouteHeaders\": {\
      \"type\": \"list\",\
      \"member\": {\
        \"shape\": \"HttpRouteHeader\"\
      },\
      \"min\": 1,\
      \"max\": 10\
    },\
    \"String\": {\
      \"type\": \"string\"\
    },\
    \"TcpTimeout\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"idle\": {\
          \"shape\": \"Duration\"\
        }\
      }\
    },\
    \"HttpScheme\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"http\",\
        \"https\"\
      ]\
    },\
    \"UpdateRouteInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\",\
        \"routeName\",\
        \"spec\",\
        \"virtualRouterName\"\
      ],\
      \"members\": {\
        \"clientToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>Unique, case-sensitive identifier that you provide to ensure the idempotency of the\\nrequest. Up to 36 letters, numbers, hyphens, and underscores are allowed.</p>\",\
          \"idempotencyToken\": true\
        },\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh that the route resides in.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        },\
        \"routeName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the route to update.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"routeName\"\
        },\
        \"spec\": {\
          \"shape\": \"RouteSpec\",\
          \"documentation\": \"<p>The new route specification to apply. This overwrites the existing data.</p>\"\
        },\
        \"virtualRouterName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the virtual router that the route is associated with.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"virtualRouterName\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"HttpRoute\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"action\",\
        \"match\"\
      ],\
      \"members\": {\
        \"action\": {\
          \"shape\": \"HttpRouteAction\",\
          \"documentation\": \"<p>An object that represents the action to take if a match is determined.</p>\"\
        },\
        \"match\": {\
          \"shape\": \"HttpRouteMatch\",\
          \"documentation\": \"<p>An object that represents the criteria for determining a request match.</p>\"\
        },\
        \"retryPolicy\": {\
          \"shape\": \"HttpRetryPolicy\",\
          \"documentation\": \"<p>An object that represents a retry policy.</p>\"\
        },\
        \"timeout\": {\
          \"shape\": \"HttpTimeout\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents an HTTP or HTTP/2 route type.</p>\"\
    },\
    \"DescribeMeshInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"meshName\"\
      ],\
      \"members\": {\
        \"meshName\": {\
          \"shape\": \"ResourceName\",\
          \"documentation\": \"<p>The name of the service mesh to describe.</p>\",\
          \"location\": \"uri\",\
          \"locationName\": \"meshName\"\
        },\
        \"meshOwner\": {\
          \"shape\": \"AccountId\",\
          \"documentation\": \"<p>The AWS IAM account ID of the service mesh owner. If the account ID is not your own, then it's\\n               the ID of the account that shared the mesh with your account. For more information about mesh sharing, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html\\\">Working with shared meshes</a>.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"meshOwner\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"MeshSpec\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"egressFilter\": {\
          \"shape\": \"EgressFilter\",\
          \"documentation\": \"<p>The egress filter rules for the service mesh.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the specification of a service mesh.</p>\"\
    },\
    \"ListTagsForResourceOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"tags\"\
      ],\
      \"members\": {\
        \"nextToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>The <code>nextToken</code> value to include in a future <code>ListTagsForResource</code>\\n         request. When the results of a <code>ListTagsForResource</code> request exceed\\n            <code>limit</code>, you can use this value to retrieve the next page of results. This\\n         value is <code>null</code> when there are no more results to return.</p>\"\
        },\
        \"tags\": {\
          \"shape\": \"TagList\",\
          \"documentation\": \"<p>The tags for the resource.</p>\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"ServiceDiscovery\": {\
      \"type\": \"structure\",\
      \"members\": {\
        \"awsCloudMap\": {\
          \"shape\": \"AwsCloudMapServiceDiscovery\",\
          \"documentation\": \"<p>Specifies any AWS Cloud Map information for the virtual node.</p>\"\
        },\
        \"dns\": {\
          \"shape\": \"DnsServiceDiscovery\",\
          \"documentation\": \"<p>Specifies the DNS information for the virtual node.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents the service discovery information for a virtual node.</p>\"\
    },\
    \"ListVirtualNodesOutput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"virtualNodes\"\
      ],\
      \"members\": {\
        \"nextToken\": {\
          \"shape\": \"String\",\
          \"documentation\": \"<p>The <code>nextToken</code> value to include in a future <code>ListVirtualNodes</code>\\n         request. When the results of a <code>ListVirtualNodes</code> request exceed\\n            <code>limit</code>, you can use this value to retrieve the next page of results. This\\n         value is <code>null</code> when there are no more results to return.</p>\"\
        },\
        \"virtualNodes\": {\
          \"shape\": \"VirtualNodeList\",\
          \"documentation\": \"<p>The list of existing virtual nodes for the specified service mesh.</p>\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"UntagResourceInput\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"resourceArn\",\
        \"tagKeys\"\
      ],\
      \"members\": {\
        \"resourceArn\": {\
          \"shape\": \"Arn\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) of the resource to delete tags from.</p>\",\
          \"location\": \"querystring\",\
          \"locationName\": \"resourceArn\"\
        },\
        \"tagKeys\": {\
          \"shape\": \"TagKeyList\",\
          \"documentation\": \"<p>The keys of the tags to be removed.</p>\"\
        }\
      },\
      \"documentation\": \"\"\
    },\
    \"ListenerTlsAcmCertificate\": {\
      \"type\": \"structure\",\
      \"required\": [\
        \"certificateArn\"\
      ],\
      \"members\": {\
        \"certificateArn\": {\
          \"shape\": \"Arn\",\
          \"documentation\": \"<p>The Amazon Resource Name (ARN) for the certificate. The certificate must meet specific requirements and you must have proxy authorization enabled. For more information, see <a href=\\\"https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html#virtual-node-tls-prerequisites\\\">Transport Layer Security (TLS)</a>.</p>\"\
        }\
      },\
      \"documentation\": \"<p>An object that represents an AWS Certicate Manager (ACM) certificate.</p>\"\
    },\
    \"TagKey\": {\
      \"type\": \"string\",\
      \"min\": 1,\
      \"max\": 128\
    },\
    \"VirtualServiceStatusCode\": {\
      \"type\": \"string\",\
      \"enum\": [\
        \"ACTIVE\",\
        \"DELETED\",\
        \"INACTIVE\"\
      ]\
    }\
  }\
}\
";
}

@end
