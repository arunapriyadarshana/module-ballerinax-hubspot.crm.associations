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

public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig? apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.hubapi.com/crm/v4") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        if config.auth is ApiKeysConfig {
            self.apiKeyConfig = (<ApiKeysConfig>config.auth).cloneReadOnly();
        } else {
            httpClientConfig.auth = <http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig>config.auth;
            self.apiKeyConfig = ();
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }

    # Deletes all associations between two records
    #
    # + headers - Headers to be sent with the request 
    # + return - Returns `http:Response` with status **204 No Content** on success, indicating successful deletion. 
    resource isolated function delete objects/[string objectType]/[string objectId]/associations/[string toObjectType]/[string toObjectId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/objects/${getEncodedUri(objectType)}/${getEncodedUri(objectId)}/associations/${getEncodedUri(toObjectType)}/${getEncodedUri(toObjectId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app"] = self.apiKeyConfig?.private\-app;
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        return self.clientEp->delete(resourcePath, headers = httpHeaders);
    }

    # List Associations of an Object by Type
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - successful operation 
    resource isolated function get objects/[string objectType]/[string objectId]/associations/[string toObjectType](map<string|string[]> headers = {}, *GetObjectsObjectTypeObjectIdAssociationsToObjectTypeGetPageQueries queries) returns CollectionResponseMultiAssociatedObjectWithLabelForwardPaging|error {
        string resourcePath = string `/objects/${getEncodedUri(objectType)}/${getEncodedUri(objectId)}/associations/${getEncodedUri(toObjectType)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app"] = self.apiKeyConfig?.private\-app;
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Removes Links Between Objects
    #
    # + headers - Headers to be sent with the request 
    # + return - Returns `http:Response` with status **204 No Content** on success, indicating successful deletion. 
    resource isolated function post associations/[string fromObjectType]/[string toObjectType]/batch/archive(BatchInputPublicAssociationMultiArchive payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/associations/${getEncodedUri(fromObjectType)}/${getEncodedUri(toObjectType)}/batch/archive`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app"] = self.apiKeyConfig?.private\-app;
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Creates a Default HubSpot-Defined Association
    #
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function post associations/[string fromObjectType]/[string toObjectType]/batch/associate/default(BatchInputPublicDefaultAssociationMultiPost payload, map<string|string[]> headers = {}) returns BatchResponsePublicDefaultAssociation|error {
        string resourcePath = string `/associations/${getEncodedUri(fromObjectType)}/${getEncodedUri(toObjectType)}/batch/associate/default`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app"] = self.apiKeyConfig?.private\-app;
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Creates Custom Associations
    #
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function post associations/[string fromObjectType]/[string toObjectType]/batch/create(BatchInputPublicAssociationMultiPost payload, map<string|string[]> headers = {}) returns BatchResponseLabelsBetweenObjectPair|BatchResponseLabelsBetweenObjectPairWithErrors|error {
        string resourcePath = string `/associations/${getEncodedUri(fromObjectType)}/${getEncodedUri(toObjectType)}/batch/create`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app"] = self.apiKeyConfig?.private\-app;
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Delete Specific Labels
    #
    # + headers - Headers to be sent with the request 
    # + return - Returns `http:Response` with status **204 No Content** on success, indicating successful deletion. 
    resource isolated function post associations/[string fromObjectType]/[string toObjectType]/batch/labels/archive(BatchInputPublicAssociationMultiPost payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/associations/${getEncodedUri(fromObjectType)}/${getEncodedUri(toObjectType)}/batch/labels/archive`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app"] = self.apiKeyConfig?.private\-app;
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Read Associations
    #
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function post associations/[string fromObjectType]/[string toObjectType]/batch/read(BatchInputPublicFetchAssociationsBatchRequest payload, map<string|string[]> headers = {}) returns BatchResponsePublicAssociationMultiWithLabel|BatchResponsePublicAssociationMultiWithLabelWithErrors|error {
        string resourcePath = string `/associations/${getEncodedUri(fromObjectType)}/${getEncodedUri(toObjectType)}/batch/read`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app"] = self.apiKeyConfig?.private\-app;
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Report
    #
    # + userId -
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function post associations/usage/high\-usage\-report/[int:Signed32 userId](map<string|string[]> headers = {}) returns ReportCreationResponse|error {
        string resourcePath = string `/associations/usage/high-usage-report/${getEncodedUri(userId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app"] = self.apiKeyConfig?.private\-app;
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Create Default Association Between Two Object Types
    #
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function put objects/[string fromObjectType]/[string fromObjectId]/associations/default/[string toObjectType]/[string toObjectId](map<string|string[]> headers = {}) returns BatchResponsePublicDefaultAssociation|error {
        string resourcePath = string `/objects/${getEncodedUri(fromObjectType)}/${getEncodedUri(fromObjectId)}/associations/default/${getEncodedUri(toObjectType)}/${getEncodedUri(toObjectId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app"] = self.apiKeyConfig?.private\-app;
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, httpHeaders);
    }

    # Create Association Labels Between Two Records
    #
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function put objects/[string objectType]/[string objectId]/associations/[string toObjectType]/[string toObjectId](AssociationSpec[] payload, map<string|string[]> headers = {}) returns LabelsBetweenObjectPair|error {
        string resourcePath = string `/objects/${getEncodedUri(objectType)}/${getEncodedUri(objectId)}/associations/${getEncodedUri(toObjectType)}/${getEncodedUri(toObjectId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app"] = self.apiKeyConfig?.private\-app;
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = http:getHeaderMap(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, httpHeaders);
    }
}
