// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is auto-generated by the Ballerina OpenAPI tool.

// Copyright (c) 2025, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

public type StandardError record {
    record {} subCategory?;
    record {|string[]...;|} context;
    record {|string...;|} links;
    string id?;
    string category;
    string message;
    ErrorDetail[] errors;
    string status;
};

public type LabelsBetweenObjectPair record {
    string fromObjectTypeId;
    string toObjectId;
    string toObjectTypeId;
    string fromObjectId;
    string[] labels;
};

public type ReportCreationResponse record {
    string userEmail;
    int:Signed32 userId;
    DateTime enqueueTime;
};

public type PublicAssociationMultiWithLabel record {
    PublicObjectId 'from;
    Paging paging?;
    MultiAssociatedObjectWithLabel[] to;
};

public type BatchInputPublicDefaultAssociationMultiPost record {
    PublicDefaultAssociationMultiPost[] inputs;
};

public type BatchInputPublicAssociationMultiArchive record {
    PublicAssociationMultiArchive[] inputs;
};

public type MultiAssociatedObjectWithLabel record {
    AssociationSpecWithLabel[] associationTypes;
    string toObjectId;
};

public type DateTime record {
    boolean dateOnly;
    int:Signed32 timeZoneShift;
    int:Signed32 value;
};

public type ErrorDetail record {
    # A specific category that contains more specific detail about the error
    string subCategory?;
    # The status code associated with the error detail
    string code?;
    # The name of the field or parameter in which the error was found.
    string 'in?;
    # Context about the error condition
    record {|string[]...;|} context?;
    # A human readable message describing the error along with remediation steps where appropriate
    string message;
};

public type ForwardPaging record {
    NextPage next?;
};

public type AssociationSpecWithLabel record {
    int:Signed32 typeId;
    string label?;
    "HUBSPOT_DEFINED"|"USER_DEFINED"|"INTEGRATOR_DEFINED" category;
};

public type PublicAssociationMultiPost record {
    AssociationSpec[] types;
    PublicObjectId 'from;
    PublicObjectId to;
};

public type BatchResponseLabelsBetweenObjectPair record {
    string completedAt;
    string requestedAt?;
    string startedAt;
    record {|string...;|} links?;
    LabelsBetweenObjectPair[] results;
    "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE" status;
};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://api.hubapi.com/oauth/v1/token";
|};

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Provides Auth configurations needed when communicating with a remote HTTP endpoint.
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig|ApiKeysConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
    # Enables relaxed data binding on the client side. When enabled, `nil` values are treated as optional, 
    # and absent fields are handled as `nilable` types. Enabled by default.
    boolean laxDataBinding = true;
|};

public type PublicObjectId record {
    string id;
};

public type PublicAssociationMultiArchive record {
    PublicObjectId 'from;
    PublicObjectId[] to;
};

public type BatchResponsePublicAssociationMultiWithLabelWithErrors record {
    string completedAt;
    int:Signed32 numErrors?;
    string requestedAt?;
    string startedAt;
    record {|string...;|} links?;
    PublicAssociationMultiWithLabel[] results;
    StandardError[] errors?;
    "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE" status;
};

public type Paging record {
    NextPage next?;
    PreviousPage prev?;
};

public type PublicDefaultAssociation record {
    AssociationSpec associationSpec;
    PublicObjectId 'from;
    PublicObjectId to;
};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

public type BatchInputPublicAssociationMultiPost record {
    PublicAssociationMultiPost[] inputs;
};

# Represents the Queries record for the operation: get-/crm/v4/objects/{objectType}/{objectId}/associations/{toObjectType}_getPage
public type GetCrmV4ObjectsObjectTypeObjectIdAssociationsToObjectTypeGetPageQueries record {
    # The maximum number of results to display per page.
    int:Signed32 'limit = 500;
    # The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results.
    string after?;
};

public type PublicDefaultAssociationMultiPost record {
    PublicObjectId 'from;
    PublicObjectId to;
};

public type BatchInputPublicFetchAssociationsBatchRequest record {
    PublicFetchAssociationsBatchRequest[] inputs;
};

public type BatchResponsePublicAssociationMultiWithLabel record {
    string completedAt;
    string requestedAt?;
    string startedAt;
    record {|string...;|} links?;
    PublicAssociationMultiWithLabel[] results;
    "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE" status;
};

public type BatchResponsePublicDefaultAssociation record {
    string completedAt;
    int:Signed32 numErrors?;
    string requestedAt?;
    string startedAt;
    record {|string...;|} links?;
    PublicDefaultAssociation[] results;
    StandardError[] errors?;
    "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE" status;
};

public type AssociationSpec record {
    "HUBSPOT_DEFINED"|"USER_DEFINED"|"INTEGRATOR_DEFINED" associationCategory;
    int:Signed32 associationTypeId;
};

public type BatchResponseLabelsBetweenObjectPairWithErrors record {
    string completedAt;
    int:Signed32 numErrors?;
    string requestedAt?;
    string startedAt;
    record {|string...;|} links?;
    LabelsBetweenObjectPair[] results;
    StandardError[] errors?;
    "PENDING"|"PROCESSING"|"CANCELED"|"COMPLETE" status;
};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

public type PreviousPage record {
    string before;
    string link?;
};

public type CollectionResponseMultiAssociatedObjectWithLabelForwardPaging record {
    ForwardPaging paging?;
    MultiAssociatedObjectWithLabel[] results;
};

public type NextPage record {
    string link?;
    string after;
};

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    string private\-app\-legacy;
    string private\-app;
|};

public type PublicFetchAssociationsBatchRequest record {
    string id;
    string after?;
};
