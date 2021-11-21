package old

"cloud-diff": {
	openapi: "3.0.0"
	info: {
		title:   "Influx Cloud API Service"
		version: "2.0.1"
		description: """
			The InfluxDB v2 API provides a programmatic interface for all interactions with InfluxDB. Access the InfluxDB API using the `/api/v2/` endpoint.

			"""
	}

	servers: [{
		url: "/api/v2"
	}]
	tags: [{
		name: "Authentication"
		description: """
			Use one of the following schemes to authenticate to the InfluxDB API:
			- [Token authentication](#section/Authentication/TokenAuthentication)
			- [Basic authentication](#section/Authentication/BasicAuthentication)
			- [Querystring authentication](#section/Authentication/QuerystringAuthentication)
			<!-- ReDoc-Inject: <security-definitions> -->

			"""

		"x-traitTag": true
	}, {
		name:         "Quick start"
		"x-traitTag": true
		description: """
			See the [**API Quick Start**]({{% INFLUXDB_DOCS_URL %}}/api-guide/api_intro/) to get up and running authenticating with tokens, writing to buckets, and querying data.

			[**InfluxDB API client libraries**]({{% INFLUXDB_DOCS_URL %}}/api-guide/client-libraries/) are available for popular languages and ready to import into your application.

			"""
	}, {
		name:         "Response codes"
		"x-traitTag": true
		description: """
			The InfluxDB API uses standard HTTP status codes for success and failure responses.
			The response body may include additional details. For details about a specific operation's response, see **Responses** and **Response Samples** for that operation.

			API operations may return the following HTTP status codes:

			| &nbsp;Code&nbsp; | Status                   | Description      |
			|:-----------:|:------------------------ |:--------------------- |
			| `200`       | Success                  |                       |
			| `204`       | No content               | For a `POST` request, `204` indicates that InfluxDB accepted the request and request data is valid. Asynchronous operations, such as `write`, might not have completed yet. |
			| `400`       | Bad request              | `Authorization` header is missing or malformed or the API token does not have permission for the operation. |
			| `401`       | Unauthorized             | May indicate one of the following: <li>`Authorization: Token` header is missing or malformed</li><li>API token value is missing from the header</li><li>API token does not have permission. For more information about token types and permissions, see [Manage API tokens]({{% INFLUXDB_DOCS_URL %}}/security/tokens/)</li> |
			| `404`       | Not found                | Requested resource was not found. `message` in the response body provides details about the requested resource. |
			| `413`       | Request entity too large | Request payload exceeds the size limit. |
			| `422`       | Unprocessible entity     | Request data is invalid. `code` and `message` in the response body provide details about the problem. |
			| `429`       | Too many requests        | API token is temporarily over the request quota. The `Retry-After` header describes when to try the request again. |
			| `500`       | Internal server error    |                       |
			| `503`       | Service unavailable      | Server is temporarily unavailable to process the request. The `Retry-After` header describes when to try the request again. |

			"""
	}, {
		name: "Query"
		description: """
			Retrieve data, analyze queries, and get query suggestions.

			"""
	}, {
		name: "Write"
		description: """
			Write time series data to buckets.

			"""
	}, {
		name: "Authorizations"
		description: """
			Create and manage API tokens. An **authorization** associates a list of permissions to an **organization** and provides a token for API access. Optionally, you can restrict an authorization and its token to a specific user.

			For more information and examples, see the following:
			  - [Authorize API requests]({{% INFLUXDB_DOCS_URL %}}/api-guide/api_intro/#authentication).
			  - [Manage API tokens]({{% INFLUXDB_DOCS_URL %}}/security/tokens).
			  - [Assign a token to a specific user]({{% INFLUXDB_DOCS_URL %}}/security/tokens/create-token).

			"""
	}]

	"x-tagGroups": [{
		name: "Overview"
		tags: [
			"Quick start",
			"Authentication",
			"Response codes",
		]
	}, {
		name: "Data I/O endpoints"
		tags: [
			"Write",
			"Query",
		]
	}, {
		name: "Resource endpoints"
		tags: [
			"Buckets",
			"Dashboards",
			"Tasks",
			"Resources",
		]
	}, {
		name: "Security and access endpoints"
		tags: [
			"Authorizations",
			"Organizations",
			"Users",
		]
	}, {
		name: "System information endpoints"
		tags: [
			"Ping",
			"Routes",
		]
	}, {
		name: "All endpoints"
		tags: [
			"Annotations",
			"Authorizations",
			"Buckets",
			"Cells",
			"Checks",
			"DBRPs",
			"Dashboards",
			"Delete",
			"DemoDataBuckets",
			"Invocable Scripts",
			"Labels",
			"Limits",
			"NotificationEndpoints",
			"NotificationRules",
			"OAuth",
			"Organizations",
			"Ping",
			"Public Flags",
			"Query",
			"Resources",
			"Routes",
			"Rules",
			"Secrets",
			"Setup",
			"Signin",
			"Signout",
			"Streams",
			"Tasks",
			"Telegraf Plugins",
			"Telegrafs",
			"Templates",
			"Usage",
			"Users",
			"Variables",
			"Write",
		]
	}]
	paths: {
		"/users": {
			get: {
				operationId: "GetUsers"
				tags: [
					"Users",
				]
				summary: "List all users"
				parameters: [{
					in:          "header"
					name:        "Zap-Trace-Span"
					description: "OpenTracing span context"
					example: {
						trace_id: "1"
						span_id:  "1"
						baggage: key: "value"
					}
					required: false
					schema: type: "string"
				}]
				responses: {
					"200": {
						description: "A list of users"
						content: "application/json": schema: $ref: "#/components/schemas/Users"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			post: {
				operationId: "PostUsers"
				tags: [
					"Users",
				]
				summary: "Create a user"
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}]
				requestBody: {
					description: "User to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/User"
				}
				responses: {
					"201": {
						description: "User created"
						content: "application/json": schema: $ref: "#/components/schemas/OnboardingResponse/properties/user"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/users/{userID}": {
			get: {
				operationId: "GetUsersID"
				tags: [
					"Users",
				]
				summary: "Retrieve a user"
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}, {
					in:   "path"
					name: "userID"
					schema: type: "string"
					required:    true
					description: "The user ID."
				}]
				responses: {
					"200": {
						description: "User details"
						content: "application/json": schema: $ref: "#/components/schemas/OnboardingResponse/properties/user"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			patch: {
				operationId: "PatchUsersID"
				tags: [
					"Users",
				]
				summary: "Update a user"
				requestBody: {
					description: "User update to apply"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/User"
				}
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}, {
					in:   "path"
					name: "userID"
					schema: type: "string"
					required:    true
					description: "The ID of the user to update."
				}]
				responses: {
					"200": {
						description: "User updated"
						content: "application/json": schema: $ref: "#/components/schemas/OnboardingResponse/properties/user"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			delete: {
				operationId: "DeleteUsersID"
				tags: [
					"Users",
				]
				summary: "Delete a user"
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}, {
					in:   "path"
					name: "userID"
					schema: type: "string"
					required:    true
					description: "The ID of the user to delete."
				}]
				responses: {
					"204": description: "User deleted"
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/setup": {
			get: {
				operationId: "GetSetup"
				tags: [
					"Setup",
				]
				summary:     "Retrieve setup status"
				description: "Check if setup is allowed. Returns `true` if no default user, organization, or bucket have been created."
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}]
				responses: "200": {
					description: "Setup is allowed, true or false"
					content: "application/json": schema: {
						type: "object"
						properties: allowed: {
							description: "True means that the influxdb instance has NOT had initial setup; false means that the database has been setup."
							type:        "boolean"
						}
					}
				}
			}
			post: {
				operationId: "PostSetup"
				tags: [
					"Setup",
				]
				summary:     "Create an initial user, organization, and bucket"
				description: "Post an onboarding request to create an initial user, organization, and bucket."
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}]
				requestBody: {
					description: "Source to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/OnboardingRequest"
				}
				responses: {
					"201": {
						description: "The created default user, bucket, and organization"
						content: "application/json": schema: $ref: "#/components/schemas/OnboardingResponse"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/setup/user": post: {
			operationId: "PostSetupUser"
			tags: [
				"Setup",
			]
			summary:     "Create a new user, organization, and bucket"
			description: "Post an onboarding request to create a new user, organization, and bucket."
			requestBody: {
				description: "Source to create"
				required:    true
				content: "application/json": schema: $ref: "#/components/schemas/OnboardingRequest"
			}
			responses: {
				"201": {
					description: "The created default user, bucket, and organization."
					content: "application/json": schema: $ref: "#/components/schemas/OnboardingResponse"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/authorizations": {
			get: {
				operationId: "GetAuthorizations"
				tags: [
					"Authorizations",
				]
				summary: "List all authorizations"
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}, {
					in:   "query"
					name: "userID"
					schema: type: "string"
					description: "Only show authorizations that belong to a user ID."
				}, {
					in:   "query"
					name: "user"
					schema: type: "string"
					description: "Only show authorizations that belong to a user name."
				}, {
					in:   "query"
					name: "orgID"
					schema: type: "string"
					description: "Only show authorizations that belong to an organization ID."
				}, {
					in:   "query"
					name: "org"
					schema: type: "string"
					description: "Only show authorizations that belong to a organization name."
				}, {
					in:   "query"
					name: "token"
					schema: type: "string"
					description: "Find a token by value."
				}]
				responses: {
					"200": {
						description: "A list of authorizations"
						content: "application/json": schema: $ref: "#/components/schemas/Authorizations"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			post: {
				operationId: "PostAuthorizations"
				tags: [
					"Authorizations",
				]
				summary: "Create an authorization"
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}]
				requestBody: {
					description: "Authorization to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/Authorization"
				}
				responses: {
					"201": {
						description: "Authorization created"
						content: "application/json": schema: $ref: "#/components/schemas/Authorization"
					}
					"400": {
						description: "Invalid request"
						$ref:        "#/components/responses/ServerError"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/experimental/sampledata/buckets": get: {
			operationId: "GetDemoDataBuckets"
			tags: [
				"DemoDataBuckets",
			]
			summary: "List of Demo Data Buckets"
			responses: {
				"200": {
					description: "A list of demo data buckets"
					content: "application/json": schema: $ref: "#/components/schemas/DemoDataBuckets"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/experimental/sampledata/buckets/{bucketID}/members": {
			post: {
				operationId: "GetDemoDataBucketMembers"
				tags: [
					"DemoDataBuckets",
				]
				summary: "List of Demo Data Buckets"
				parameters: [{
					in:       "path"
					name:     "bucketID"
					required: true
					schema: type: "string"
					description: "bucket id"
				}]
				responses: {
					"200": description: "if sampledata route is not available gateway responds with 200"
					"204": description: "A list of demo data buckets"
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/responses/ServerError/content/application~1json/schema"
					}
				}
			}
			delete: {
				operationId: "DeleteDemoDataBucketMembers"
				tags: [
					"DemoDataBuckets",
				]
				summary: "List of Demo Data Buckets"
				parameters: [{
					in:       "path"
					name:     "bucketID"
					required: true
					schema: type: "string"
					description: "bucket id"
				}]
				responses: {
					"200": description: "if sampledata route is not available gateway responds with 200"
					"204": description: "A list of demo data buckets"
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/responses/ServerError/content/application~1json/schema"
					}
				}
			}
		}
		"/authorizations/{authID}": {
			get: {
				operationId: "GetAuthorizationsID"
				tags: [
					"Authorizations",
				]
				summary: "Retrieve an authorization"
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}, {
					in:   "path"
					name: "authID"
					schema: type: "string"
					required:    true
					description: "The identifier of the authorization to get."
				}]
				responses: {
					"200": {
						description: "Authorization details"
						content: "application/json": schema: $ref: "#/components/schemas/Authorization"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			patch: {
				operationId: "PatchAuthorizationsID"
				tags: [
					"Authorizations",
				]
				summary:     "Update authorization status"
				description: "Update an authorization's status to `active` or `inactive`."
				requestBody: {
					description: "The updated Authorization object."
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/Authorization/allOf/0"
				}
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}, {
					in:   "path"
					name: "authID"
					schema: type: "string"
					required:    true
					description: "The identifier of the authorization to update."
				}]
				responses: {
					"200": {
						description: "The updated authorization."
						content: "application/json": schema: $ref: "#/components/schemas/Authorization"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			delete: {
				operationId: "DeleteAuthorizationsID"
				tags: [
					"Authorizations",
				]
				summary: "Delete an authorization"
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}, {
					in:   "path"
					name: "authID"
					schema: type: "string"
					required:    true
					description: "The identifier of the authorization to delete."
				}]
				responses: {
					"204": description: "Authorization deleted"
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/variables": {
			get: {
				operationId: "GetVariables"
				tags: [
					"Variables",
				]
				summary: "List all variables"
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}, {
					in:          "query"
					name:        "org"
					description: "The name of the organization."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "orgID"
					description: "The organization ID."
					schema: type: "string"
				}]
				responses: {
					"200": {
						description: "A list of variables for an organization."
						content: "application/json": schema: $ref: "#/components/schemas/Variables"
					}
					"400": {
						description: "Invalid request"
						$ref:        "#/components/responses/ServerError"
					}
					default: {
						description: "Internal server error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			post: {
				operationId: "PostVariables"
				summary:     "Create a variable"
				tags: [
					"Variables",
				]
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}]
				requestBody: {
					description: "Variable to create"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/Variable"
				}
				responses: {
					"201": {
						description: "Variable created"
						content: "application/json": schema: $ref: "#/components/schemas/Variable"
					}
					default: {
						description: "Internal server error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/variables/{variableID}": {
			get: {
				operationId: "GetVariablesID"
				tags: [
					"Variables",
				]
				summary: "Retrieve a variable"
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}, {
					in:       "path"
					name:     "variableID"
					required: true
					schema: type: "string"
					description: "The variable ID."
				}]
				responses: {
					"200": {
						description: "Variable found"
						content: "application/json": schema: $ref: "#/components/schemas/Variable"
					}
					"404": {
						description: "Variable not found"
						$ref:        "#/components/responses/ServerError"
					}
					default: {
						description: "Internal server error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			delete: {
				operationId: "DeleteVariablesID"
				tags: [
					"Variables",
				]
				summary: "Delete a variable"
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}, {
					in:       "path"
					name:     "variableID"
					required: true
					schema: type: "string"
					description: "The variable ID."
				}]
				responses: {
					"204": description: "Variable deleted"
					default: {
						description: "Internal server error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			patch: {
				operationId: "PatchVariablesID"
				summary:     "Update a variable"
				tags: [
					"Variables",
				]
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}, {
					in:       "path"
					name:     "variableID"
					required: true
					schema: type: "string"
					description: "The variable ID."
				}]
				requestBody: {
					description: "Variable update to apply"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/Variable"
				}
				responses: {
					"200": {
						description: "Variable updated"
						content: "application/json": schema: $ref: "#/components/schemas/Variable"
					}
					default: {
						description: "Internal server error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			put: {
				operationId: "PutVariablesID"
				summary:     "Replace a variable"
				tags: [
					"Variables",
				]
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}, {
					in:       "path"
					name:     "variableID"
					required: true
					schema: type: "string"
					description: "The variable ID."
				}]
				requestBody: {
					description: "Variable to replace"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/Variable"
				}
				responses: {
					"200": {
						description: "Variable updated"
						content: "application/json": schema: $ref: "#/components/schemas/Variable"
					}
					default: {
						description: "Internal server error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/buckets/{bucketID}/schema/measurements": {
			summary: "Bucket schemas"
			get: {
				summary:     "List all measurement schemas of a bucket"
				operationId: "getMeasurementSchemas"
				parameters: [{
					in:          "query"
					name:        "org"
					description: "The name of the organization."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "orgID"
					description: "The identifier of the organization."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "name"
					description: "The name of the measurement to return schemas for."
					schema: type: "string"
				}, {
					in:          "path"
					name:        "bucketID"
					description: "The identifier of the bucket."
					schema: type: "string"
					required: true
				}]
				tags: [
					"Bucket Schemas",
				]
				responses: {
					"200": {
						description: "A list of measurement schemas returning summary information."
						headers: ETag: {
							description: "The current version of the bucket schema"
							schema: type: "string"
						}
						content: "application/json": schema: $ref: "#/components/schemas/MeasurementSchemaList"
					}
					"404": {
						description: "Bucket not found"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			post: {
				summary:     "Create a measurement schema for a bucket"
				operationId: "createMeasurementSchema"
				parameters: [{
					in:          "query"
					name:        "org"
					description: "The name of the organization."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "orgID"
					description: "The identifier of the organization."
					schema: type: "string"
				}, {
					in:          "path"
					name:        "bucketID"
					description: "The identifier of the bucket."
					schema: type: "string"
					required: true
				}]
				tags: [
					"Bucket Schemas",
				]
				requestBody: content: "application/json": schema: $ref: "#/components/schemas/MeasurementSchemaCreateRequest"
				responses: {
					"201": {
						description: "The created measurement schema."
						headers: ETag: {
							description: "The current version of the measurement schema"
							schema: type: "string"
						}
						content: "application/json": schema: $ref: "#/components/schemas/MeasurementSchema"
					}
					"400": {
						description: "Client error with create request"
						content: "application/json": {
							examples: {
								badNameExample: {
									summary:     "Invalid name"
									description: "The error returned when the name is invalid, such as too few or too many characters or the name contains non-printable ASCII or is not valid UTF-8."
									value: {
										code:    "invalid"
										message: "name is invalid"
									}
								}
								missingColumnsExample: {
									summary:     "Missing columns"
									description: "The error returned when the request body is missing the columns property."
									value: {
										code:    "invalid"
										message: "columns is required"
									}
								}
								missingTimestampExample: {
									summary:     "Missing timestamp"
									description: "The error returned when the request body is missing a timestamp type column."
									value: {
										code:    "invalid"
										message: "Timestamp column is required"
									}
								}
								duplicateColumnNamesExample: {
									summary:     "Duplicate column names"
									description: "The error returned when the request body contains duplicate column names."
									value: {
										code:    "invalid"
										message: "Duplicate column names"
									}
								}
								missingFieldExample: {
									summary:     "Missing field"
									description: "The error returned when the request body is missing at least one field type column."
									value: {
										code:    "invalid"
										message: "At least one field column is required"
									}
								}
							}
							schema: $ref: "#/components/responses/ServerError/content/application~1json/schema"
						}
					}
				}
			}
		}
		"/buckets/{bucketID}/schema/measurements/{measurementID}": {
			summary: "Bucket Schema"
			get: {
				summary:     "Retrieve measurement schema information"
				operationId: "getMeasurementSchema"
				parameters: [{
					in:          "query"
					name:        "org"
					description: "The name of the organization."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "orgID"
					description: "The identifier of the organization."
					schema: type: "string"
				}, {
					in:          "path"
					name:        "bucketID"
					description: "The identifier of the bucket."
					schema: type: "string"
					required: true
				}, {
					in:          "path"
					name:        "measurementID"
					description: "The identifier of the measurement."
					schema: type: "string"
					required: true
				}]
				tags: [
					"Bucket Schemas",
				]
				responses: "200": {
					description: "Schema definition for a single measurement"
					headers: ETag: {
						description: "The current version of the measurement schema"
						schema: type: "string"
					}
					content: "application/json": schema: $ref: "#/components/schemas/MeasurementSchema"
				}
			}
			patch: {
				summary:     "Update a measurement schema"
				operationId: "updateMeasurementSchema"
				parameters: [{
					in:          "query"
					name:        "org"
					description: "The name of the organization."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "orgID"
					description: "The identifier of the organization."
					schema: type: "string"
				}, {
					in:          "path"
					name:        "bucketID"
					description: "The identifier of the bucket."
					schema: type: "string"
					required: true
				}, {
					in:          "path"
					name:        "measurementID"
					description: "The identifier of the measurement."
					schema: type: "string"
					required: true
				}]
				tags: [
					"Bucket Schemas",
				]
				requestBody: content: "application/json": schema: $ref: "#/components/schemas/MeasurementSchemaUpdateRequest"
				responses: {
					"200": {
						description: "The updated measurement schema"
						content: "application/json": schema: $ref: "#/components/schemas/MeasurementSchema"
					}
					"400": {
						description: "Client error updating measurement schema"
						content: "application/json": {
							examples: missingColumnsExample: {
								summary:     "Deleted columns"
								description: "The error returned when the request body does not contain all the columns from the source."
								value: {
									code:    "invalid"
									message: "Unable to delete columns from schema"
								}
							}
							schema: $ref: "#/components/responses/ServerError/content/application~1json/schema"
						}
					}
				}
			}
		}
		"/orgs/{orgID}/limits": get: {
			tags: [
				"Limits",
			]
			summary: "Retrieve limits for an organization"
			parameters: [{
				in:          "path"
				name:        "orgID"
				description: "The identifier of the organization."
				required:    true
				schema: type: "string"
			}]
			responses: {
				"200": {
					description: "The Limits defined for the organization."
					content: "application/json": schema: {
						type:        "object"
						description: "These are org limits similar to those configured in/by quartz."
						properties: {
							links: $ref: "#/paths/~1dashboards/get/responses/200/content/application~1json/schema/properties/links"
							limits: $ref: "#/components/schemas/Limit"
						}
					}
				}
				default: {
					description: "unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/orgs/{orgID}/usage": get: {
			tags: [
				"Usage",
			]
			summary: "Retrieve usage for an organization"
			parameters: [{
				in:          "path"
				name:        "orgID"
				description: "The identifier of the organization."
				required:    true
				schema: type: "string"
			}, {
				in:          "query"
				name:        "start"
				description: "start time"
				required:    true
				schema: type: "timestamp"
			}, {
				in:          "query"
				name:        "stop"
				description: "stop time"
				required:    false
				schema: type: "timestamp"
			}, {
				in:          "query"
				name:        "raw"
				description: "return raw usage data"
				required:    false
				schema: {
					type:    "boolean"
					default: false
				}
			}]
			responses: {
				"200": {
					description: "Usage data"
					headers: "Content-Encoding": {
						description: "Lists any encodings (usually compression algorithms) that have been applied to the response payload."
						schema: {
							type:        "string"
							description: "The content coding. `gzip` for compressed data or `identity` for unmodified, uncompressed data."
							default:     "identity"
							enum: [
								"gzip",
								"identity",
							]
						}
					}
					content: "text/csv": schema: {
						type: "string"
						example: """
		#group,false,false,true,true,false,false,true,true,true,true #datatype,string,long,dateTime:RFC3339,dateTime:RFC3339,dateTime:RFC3339,double,string,string,string,string #default,_result,,,,,,,,, ,result,table,_start,_stop,_time,_value,_field,_measurement,bucket_id,org_id ,,0,2021-05-10T14:25:10.865702397Z,2021-05-10T15:25:10.865702397Z,2021-05-10T15:00:00Z,5434066,gauge,storage_usage_bucket_bytes,2f6ba0cf9a2fdcbb,cec6fc1d2176dc11 ,,1,2021-05-10T14:25:10.865702397Z,2021-05-10T15:25:10.865702397Z,2021-05-10T15:00:00Z,9924053.966666665,gauge,storage_usage_bucket_bytes,8af67bcaf69d9daf,cec6fc1d2176dc11

		"""
					}
				}

				default: {
					description: "unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/dashboards": {
			post: {
				operationId: "PostDashboards"
				tags: [
					"Dashboards",
				]
				summary: "Create a dashboard"
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}]
				requestBody: {
					description: "Dashboard to create"
					required:    true
					content: "application/json": schema: {
						properties: {
							orgID: {
								type:        "string"
								description: "The ID of the organization that owns the dashboard."
							}
							name: {
								type:        "string"
								description: "The user-facing name of the dashboard."
							}
							description: {
								type:        "string"
								description: "The user-facing description of the dashboard."
							}
						}
						required: [
							"orgID",
							"name",
						]
					}
				}
				responses: {
					"201": {
						description: "Added dashboard"
						content: "application/json": schema: oneOf: [{
							type: "object"
							allOf: [{
								$ref: "#/paths/~1dashboards/post/requestBody/content/application~1json/schema"
							}, {
								type: "object"
								properties: {
									links: {
										type: "object"
										example: {
											self:    "/api/v2/dashboards/1"
											cells:   "/api/v2/dashboards/1/cells"
											owners:  "/api/v2/dashboards/1/owners"
											members: "/api/v2/dashboards/1/members"
											labels:  "/api/v2/dashboards/1/labels"
											org:     "/api/v2/labels/1"
										}
										properties: {
											self: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
											cells: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
											members: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
											owners: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
											labels: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
											org: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
										}
									}
									id: {
										readOnly: true
										type:     "string"
									}
									meta: {
										type: "object"
										properties: {
											createdAt: {
												type:   "string"
												format: "date-time"
											}
											updatedAt: {
												type:   "string"
												format: "date-time"
											}
										}
									}
									cells: {
										type: "array"
										items: {
											type: "object"
											properties: {
												id: type: "string"
												links: {
													type: "object"
													properties: {
														self: type: "string"
														view: type: "string"
													}
												}
												x: {
													type:   "integer"
													format: "int32"
												}
												y: {
													type:   "integer"
													format: "int32"
												}
												w: {
													type:   "integer"
													format: "int32"
												}
												h: {
													type:   "integer"
													format: "int32"
												}
												viewID: {
													type:        "string"
													description: "The reference to a view from the views API."
												}
											}
										}
									}
									labels: $ref: "#/components/schemas/Variable/properties/labels"
								}
							}]
						}, {
							type: "object"
							allOf: [{
								$ref: "#/paths/~1dashboards/post/requestBody/content/application~1json/schema"
							}, {
								type: "object"
								properties: {
									links: {
										type: "object"
										example: {
											self:    "/api/v2/dashboards/1"
											cells:   "/api/v2/dashboards/1/cells"
											owners:  "/api/v2/dashboards/1/owners"
											members: "/api/v2/dashboards/1/members"
											labels:  "/api/v2/dashboards/1/labels"
											org:     "/api/v2/labels/1"
										}
										properties: {
											self: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
											cells: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
											members: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
											owners: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
											labels: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
											org: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
										}
									}
									id: {
										readOnly: true
										type:     "string"
									}
									meta: {
										type: "object"
										properties: {
											createdAt: {
												type:   "string"
												format: "date-time"
											}
											updatedAt: {
												type:   "string"
												format: "date-time"
											}
										}
									}
									cells: {
										type: "array"
										items: {
											type: "object"
											allOf: [{
												$ref: "#/paths/~1dashboards/get/responses/200/content/application~1json/schema/properties/dashboards/items/allOf/1/properties/cells/items"
											}, {
												type: "object"
												properties: {
													name: type: "string"
													properties: oneOf: [{
														type: "object"
														required: [
															"type",
															"queries",
															"shape",
															"axes",
															"colors",
															"note",
															"showNoteWhenEmpty",
															"prefix",
															"suffix",
															"decimalPlaces",
															"position",
														]
														properties: {
															timeFormat: type: "string"
															type: {
																type: "string"
																enum: [
																	"line-plus-single-stat",
																]
															}
															queries: {
																type: "array"
																items: {
																	type: "object"
																	properties: {
																		text: {
																			type:        "string"
																			description: "The text of the Flux query."
																		}
																		editMode: {
																			type: "string"
																			enum: [
																				"builder",
																				"advanced",
																			]
																		}
																		name: type: "string"
																		builderConfig: {
																			type: "object"
																			properties: {
																				buckets: {
																					type: "array"
																					items: type: "string"
																				}
																				tags: {
																					type: "array"
																					items: {
																						type: "object"
																						properties: {
																							key: type: "string"
																							values: {
																								type: "array"
																								items: type: "string"
																							}
																							aggregateFunctionType: {
																								type: "string"
																								enum: [
																									"filter",
																									"group",
																								]
																							}
																						}
																					}
																				}
																				functions: {
																					type: "array"
																					items: {
																						type: "object"
																						properties: name: type: "string"
																					}
																				}
																				aggregateWindow: {
																					type: "object"
																					properties: {
																						period: type: "string"
																						fillValues: type: "boolean"
																					}
																				}
																			}
																		}
																	}
																}
															}
															colors: {
																description: "Colors define color encoding of data into a visualization"
																type:        "array"
																items: {
																	type:        "object"
																	description: "Defines an encoding of data value into color space."
																	required: [
																		"id",
																		"type",
																		"hex",
																		"name",
																		"value",
																	]
																	properties: {
																		id: {
																			description: "The unique ID of the view color."
																			type:        "string"
																		}
																		type: {
																			description: "Type is how the color is used."
																			type:        "string"
																			enum: [
																				"min",
																				"max",
																				"threshold",
																				"scale",
																				"text",
																				"background",
																			]
																		}
																		hex: {
																			description: "The hex number of the color"
																			type:        "string"
																			maxLength:   7
																			minLength:   7
																		}
																		name: {
																			description: "The user-facing name of the hex color."
																			type:        "string"
																		}
																		value: {
																			description: "The data value mapped to this color."
																			type:        "number"
																			format:      "float"
																		}
																	}
																}
															}
															shape: {
																type: "string"
																enum: [
																	"chronograf-v2",
																]
															}
															note: type: "string"
															showNoteWhenEmpty: {
																description: "If true, will display note when empty"
																type:        "boolean"
															}
															axes: {
																description: "The viewport for a View's visualizations"
																type:        "object"
																required: [
																	"x",
																	"y",
																]
																properties: {
																	x: {
																		type:        "object"
																		description: "The description of a particular axis for a visualization."
																		properties: {
																			bounds: {
																				type:        "array"
																				minItems:    0
																				maxItems:    2
																				description: "The extents of an axis in the form [lower, upper]. Clients determine whether bounds are to be inclusive or exclusive of their limits"
																				items: type: "string"
																			}
																			label: {
																				description: "Label is a description of this Axis"
																				type:        "string"
																			}
																			prefix: {
																				description: "Prefix represents a label prefix for formatting axis values."
																				type:        "string"
																			}
																			suffix: {
																				description: "Suffix represents a label suffix for formatting axis values."
																				type:        "string"
																			}
																			base: {
																				description: "Base represents the radix for formatting axis values."
																				type:        "string"
																				enum: [
																					"",
																					"2",
																					"10",
																				]
																			}
																			scale: {
																				description: "Scale is the axis formatting scale. Supported: \"log\", \"linear\""
																				type:        "string"
																				enum: [
																					"log",
																					"linear",
																				]
																			}
																		}
																	}
																	y: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/axes/properties/x"
																}
															}
															staticLegend: {
																description: "StaticLegend represents the options specific to the static legend"
																type:        "object"
																properties: {
																	colorizeRows: type: "boolean"
																	heightRatio: {
																		type:   "number"
																		format: "float"
																	}
																	show: type: "boolean"
																	opacity: {
																		type:   "number"
																		format: "float"
																	}
																	orientationThreshold: type: "integer"
																	valueAxis: type: "string"
																	widthRatio: {
																		type:   "number"
																		format: "float"
																	}
																}
															}
															xColumn: type: "string"
															generateXAxisTicks: {
																type: "array"
																items: type: "string"
															}
															xTotalTicks: type: "integer"
															xTickStart: {
																type:   "number"
																format: "float"
															}
															xTickStep: {
																type:   "number"
																format: "float"
															}
															yColumn: type: "string"
															generateYAxisTicks: {
																type: "array"
																items: type: "string"
															}
															yTotalTicks: type: "integer"
															yTickStart: {
																type:   "number"
																format: "float"
															}
															yTickStep: {
																type:   "number"
																format: "float"
															}
															shadeBelow: type: "boolean"
															hoverDimension: {
																type: "string"
																enum: [
																	"auto",
																	"x",
																	"y",
																	"xy",
																]
															}
															position: {
																type: "string"
																enum: [
																	"overlaid",
																	"stacked",
																]
															}
															prefix: type: "string"
															suffix: type: "string"
															decimalPlaces: {
																description: "Indicates whether decimal places should be enforced, and how many digits it should show."
																type:        "object"
																properties: {
																	isEnforced: {
																		description: "Indicates whether decimal point setting should be enforced"
																		type:        "boolean"
																	}
																	digits: {
																		description: "The number of digits after decimal to display"
																		type:        "integer"
																		format:      "int32"
																	}
																}
															}
															legendColorizeRows: type: "boolean"
															legendHide: type: "boolean"
															legendOpacity: {
																type:   "number"
																format: "float"
															}
															legendOrientationThreshold: type: "integer"
														}
													}, {
														type: "object"
														required: [
															"type",
															"geom",
															"queries",
															"shape",
															"axes",
															"colors",
															"note",
															"showNoteWhenEmpty",
															"position",
														]
														properties: {
															timeFormat: type: "string"
															type: {
																type: "string"
																enum: [
																	"xy",
																]
															}
															queries: {
																type: "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/queries/items"
															}
															colors: {
																description: "Colors define color encoding of data into a visualization"
																type:        "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/colors/items"
															}
															shape: {
																type: "string"
																enum: [
																	"chronograf-v2",
																]
															}
															note: type: "string"
															showNoteWhenEmpty: {
																description: "If true, will display note when empty"
																type:        "boolean"
															}
															axes: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/axes"
															staticLegend: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/staticLegend"
															xColumn: type: "string"
															generateXAxisTicks: {
																type: "array"
																items: type: "string"
															}
															xTotalTicks: type: "integer"
															xTickStart: {
																type:   "number"
																format: "float"
															}
															xTickStep: {
																type:   "number"
																format: "float"
															}
															yColumn: type: "string"
															generateYAxisTicks: {
																type: "array"
																items: type: "string"
															}
															yTotalTicks: type: "integer"
															yTickStart: {
																type:   "number"
																format: "float"
															}
															yTickStep: {
																type:   "number"
																format: "float"
															}
															shadeBelow: type: "boolean"
															hoverDimension: {
																type: "string"
																enum: [
																	"auto",
																	"x",
																	"y",
																	"xy",
																]
															}
															position: {
																type: "string"
																enum: [
																	"overlaid",
																	"stacked",
																]
															}
															geom: {
																type: "string"
																enum: [
																	"line",
																	"step",
																	"stacked",
																	"bar",
																	"monotoneX",
																]
															}
															legendColorizeRows: type: "boolean"
															legendHide: type: "boolean"
															legendOpacity: {
																type:   "number"
																format: "float"
															}
															legendOrientationThreshold: type: "integer"
														}
													}, {
														type: "object"
														required: [
															"type",
															"queries",
															"colors",
															"shape",
															"note",
															"showNoteWhenEmpty",
															"prefix",
															"tickPrefix",
															"suffix",
															"tickSuffix",
															"decimalPlaces",
														]
														properties: {
															type: {
																type: "string"
																enum: [
																	"single-stat",
																]
															}
															queries: {
																type: "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/queries/items"
															}
															colors: {
																description: "Colors define color encoding of data into a visualization"
																type:        "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/colors/items"
															}
															shape: {
																type: "string"
																enum: [
																	"chronograf-v2",
																]
															}
															note: type: "string"
															showNoteWhenEmpty: {
																description: "If true, will display note when empty"
																type:        "boolean"
															}
															prefix: type: "string"
															tickPrefix: type: "string"
															suffix: type: "string"
															tickSuffix: type: "string"
															staticLegend: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/staticLegend"
															decimalPlaces: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/decimalPlaces"
														}
													}, {
														type: "object"
														required: [
															"type",
															"queries",
															"colors",
															"shape",
															"note",
															"showNoteWhenEmpty",
															"xColumn",
															"fillColumns",
															"xDomain",
															"xAxisLabel",
															"position",
															"binCount",
														]
														properties: {
															type: {
																type: "string"
																enum: [
																	"histogram",
																]
															}
															queries: {
																type: "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/queries/items"
															}
															colors: {
																description: "Colors define color encoding of data into a visualization"
																type:        "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/colors/items"
															}
															shape: {
																type: "string"
																enum: [
																	"chronograf-v2",
																]
															}
															note: type: "string"
															showNoteWhenEmpty: {
																description: "If true, will display note when empty"
																type:        "boolean"
															}
															xColumn: type: "string"
															fillColumns: {
																type: "array"
																items: type: "string"
															}
															xDomain: {
																type: "array"
																items: {
																	type:   "number"
																	format: "float"
																}
															}
															xAxisLabel: type: "string"
															position: {
																type: "string"
																enum: [
																	"overlaid",
																	"stacked",
																]
															}
															binCount: type: "integer"
															legendColorizeRows: type: "boolean"
															legendHide: type: "boolean"
															legendOpacity: {
																type:   "number"
																format: "float"
															}
															legendOrientationThreshold: type: "integer"
														}
													}, {
														type: "object"
														required: [
															"type",
															"queries",
															"colors",
															"shape",
															"note",
															"showNoteWhenEmpty",
															"prefix",
															"tickPrefix",
															"suffix",
															"tickSuffix",
															"decimalPlaces",
														]
														properties: {
															type: {
																type: "string"
																enum: [
																	"gauge",
																]
															}
															queries: {
																type: "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/queries/items"
															}
															colors: {
																description: "Colors define color encoding of data into a visualization"
																type:        "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/colors/items"
															}
															shape: {
																type: "string"
																enum: [
																	"chronograf-v2",
																]
															}
															note: type: "string"
															showNoteWhenEmpty: {
																description: "If true, will display note when empty"
																type:        "boolean"
															}
															prefix: type: "string"
															tickPrefix: type: "string"
															suffix: type: "string"
															tickSuffix: type: "string"
															decimalPlaces: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/decimalPlaces"
														}
													}, {
														type: "object"
														required: [
															"type",
															"queries",
															"colors",
															"shape",
															"note",
															"showNoteWhenEmpty",
															"tableOptions",
															"fieldOptions",
															"timeFormat",
															"decimalPlaces",
														]
														properties: {
															type: {
																type: "string"
																enum: [
																	"table",
																]
															}
															queries: {
																type: "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/queries/items"
															}
															colors: {
																description: "Colors define color encoding of data into a visualization"
																type:        "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/colors/items"
															}
															shape: {
																type: "string"
																enum: [
																	"chronograf-v2",
																]
															}
															note: type: "string"
															showNoteWhenEmpty: {
																description: "If true, will display note when empty"
																type:        "boolean"
															}
															tableOptions: {
																type: "object"
																properties: {
																	verticalTimeAxis: {
																		description: "verticalTimeAxis describes the orientation of the table by indicating whether the time axis will be displayed vertically"
																		type:        "boolean"
																	}
																	sortBy: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/5/properties/fieldOptions/items"
																	wrapping: {
																		description: "Wrapping describes the text wrapping style to be used in table views"
																		type:        "string"
																		enum: [
																			"truncate",
																			"wrap",
																			"single-line",
																		]
																	}
																	fixFirstColumn: {
																		description: "fixFirstColumn indicates whether the first column of the table should be locked"
																		type:        "boolean"
																	}
																}
															}
															fieldOptions: {
																description: "fieldOptions represent the fields retrieved by the query with customization options"
																type:        "array"
																items: {
																	description: "Describes a field that can be renamed and made visible or invisible."
																	type:        "object"
																	properties: {
																		internalName: {
																			description: "The calculated name of a field."
																			readOnly:    true
																			type:        "string"
																		}
																		displayName: {
																			description: "The name that a field is renamed to by the user."
																			type:        "string"
																		}
																		visible: {
																			description: "Indicates whether this field should be visible on the table."
																			type:        "boolean"
																		}
																	}
																}
															}
															timeFormat: {
																description: "timeFormat describes the display format for time values according to moment.js date formatting"
																type:        "string"
															}
															decimalPlaces: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/decimalPlaces"
														}
													}, {
														type: "object"
														required: [
															"type",
															"showAll",
															"queries",
															"shape",
															"note",
															"showNoteWhenEmpty",
														]
														properties: {
															type: {
																type: "string"
																enum: [
																	"simple-table",
																]
															}
															showAll: type: "boolean"
															queries: {
																type: "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/queries/items"
															}
															shape: {
																type: "string"
																enum: [
																	"chronograf-v2",
																]
															}
															note: type: "string"
															showNoteWhenEmpty: {
																description: "If true, will display note when empty"
																type:        "boolean"
															}
														}
													}, {
														type: "object"
														required: [
															"type",
															"shape",
															"note",
														]
														properties: {
															type: {
																type: "string"
																enum: [
																	"markdown",
																]
															}
															shape: {
																type: "string"
																enum: [
																	"chronograf-v2",
																]
															}
															note: type: "string"
														}
													}, {
														type: "object"
														required: [
															"type",
															"shape",
															"checkID",
															"queries",
															"colors",
														]
														properties: {
															type: {
																type: "string"
																enum: [
																	"check",
																]
															}
															shape: {
																type: "string"
																enum: [
																	"chronograf-v2",
																]
															}
															checkID: type: "string"
															check: allOf: [{
																oneOf: [{
																	allOf: [{
																		properties: {
																			id: {
																				readOnly: true
																				type:     "string"
																			}
																			name: type: "string"
																			orgID: {
																				description: "The ID of the organization that owns this check."
																				type:        "string"
																			}
																			taskID: {
																				description: "The ID of the task associated with this check."
																				type:        "string"
																			}
																			ownerID: {
																				description: "The ID of creator used to create this check."
																				type:        "string"
																				readOnly:    true
																			}
																			createdAt: {
																				type:     "string"
																				format:   "date-time"
																				readOnly: true
																			}
																			updatedAt: {
																				type:     "string"
																				format:   "date-time"
																				readOnly: true
																			}
																			query: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/queries/items"
																			status: $ref: "#/paths/~1tasks/post/requestBody/content/application~1json/schema/properties/status"
																			description: {
																				description: "An optional description of the check."
																				type:        "string"
																			}
																			latestCompleted: {
																				description: "Timestamp of latest scheduled, completed run, RFC3339."
																				type:        "string"
																				format:      "date-time"
																				readOnly:    true
																			}
																			lastRunStatus: {
																				readOnly: true
																				type:     "string"
																				enum: [
																					"failed",
																					"success",
																					"canceled",
																				]
																			}
																			lastRunError: {
																				readOnly: true
																				type:     "string"
																			}
																			labels: $ref: "#/components/schemas/Variable/properties/labels"
																			links: {
																				type:     "object"
																				readOnly: true
																				example: {
																					self:    "/api/v2/checks/1"
																					labels:  "/api/v2/checks/1/labels"
																					members: "/api/v2/checks/1/members"
																					owners:  "/api/v2/checks/1/owners"
																					query:   "/api/v2/checks/1/query"
																				}
																				properties: {
																					self: {
																						description: "URL for this check"
																						$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
																					}
																					labels: {
																						description: "URL to retrieve labels for this check"
																						$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
																					}
																					members: {
																						description: "URL to retrieve members for this check"
																						$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
																					}
																					owners: {
																						description: "URL to retrieve owners for this check"
																						$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
																					}
																					query: {
																						description: "URL to retrieve flux script for this check"
																						$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
																					}
																				}
																			}
																		}
																		required: [
																			"name",
																			"orgID",
																			"query",
																		]
																	}, {
																		type: "object"
																		required: [
																			"type",
																		]
																		properties: {
																			type: {
																				type: "string"
																				enum: [
																					"deadman",
																				]
																			}
																			timeSince: {
																				description: "String duration before deadman triggers."
																				type:        "string"
																			}
																			staleTime: {
																				description: "String duration for time that a series is considered stale and should not trigger deadman."
																				type:        "string"
																			}
																			reportZero: {
																				description: "If only zero values reported since time, trigger an alert"
																				type:        "boolean"
																			}
																			level: {
																				description: "The state to record if check matches a criteria."
																				type:        "string"
																				enum: [
																					"UNKNOWN",
																					"OK",
																					"INFO",
																					"CRIT",
																					"WARN",
																				]
																			}
																			every: {
																				description: "Check repetition interval."
																				type:        "string"
																			}
																			offset: {
																				description: "Duration to delay after the schedule, before executing check."
																				type:        "string"
																			}
																			tags: {
																				description: "List of tags to write to each status."
																				type:        "array"
																				items: {
																					type: "object"
																					properties: {
																						key: type: "string"
																						value: type: "string"
																					}
																				}
																			}
																			statusMessageTemplate: {
																				description: "The template used to generate and write a status message."
																				type:        "string"
																			}
																		}
																	}]
																}, {
																	allOf: [{
																		$ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/8/properties/check/allOf/0/oneOf/0/allOf/0"
																	}, {
																		type: "object"
																		required: [
																			"type",
																		]
																		properties: {
																			type: {
																				type: "string"
																				enum: [
																					"threshold",
																				]
																			}
																			thresholds: {
																				type: "array"
																				items: {
																					oneOf: [{
																						allOf: [{
																							properties: {
																								level: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/8/properties/check/allOf/0/oneOf/0/allOf/1/properties/level"
																								allValues: {
																									description: "If true, only alert if all values meet threshold."
																									type:        "boolean"
																								}
																							}
																						}, {
																							type: "object"
																							required: [
																								"type",
																								"value",
																							]
																							properties: {
																								type: {
																									type: "string"
																									enum: [
																										"greater",
																									]
																								}
																								value: {
																									type:   "number"
																									format: "float"
																								}
																							}
																						}]
																					}, {
																						allOf: [{
																							$ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/8/properties/check/allOf/0/oneOf/1/allOf/1/properties/thresholds/items/oneOf/0/allOf/0"
																						}, {
																							type: "object"
																							required: [
																								"type",
																								"value",
																							]
																							properties: {
																								type: {
																									type: "string"
																									enum: [
																										"lesser",
																									]
																								}
																								value: {
																									type:   "number"
																									format: "float"
																								}
																							}
																						}]
																					}, {
																						allOf: [{
																							$ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/8/properties/check/allOf/0/oneOf/1/allOf/1/properties/thresholds/items/oneOf/0/allOf/0"
																						}, {
																							type: "object"
																							required: [
																								"type",
																								"min",
																								"max",
																								"within",
																							]
																							properties: {
																								type: {
																									type: "string"
																									enum: [
																										"range",
																									]
																								}
																								min: {
																									type:   "number"
																									format: "float"
																								}
																								max: {
																									type:   "number"
																									format: "float"
																								}
																								within: type: "boolean"
																							}
																						}]
																					}]
																					discriminator: {
																						propertyName: "type"
																						mapping: {
																							greater: "#/components/schemas/GreaterThreshold"
																							lesser:  "#/components/schemas/LesserThreshold"
																							range:   "#/components/schemas/RangeThreshold"
																						}
																					}
																				}
																			}
																			every: {
																				description: "Check repetition interval."
																				type:        "string"
																			}
																			offset: {
																				description: "Duration to delay after the schedule, before executing check."
																				type:        "string"
																			}
																			tags: {
																				description: "List of tags to write to each status."
																				type:        "array"
																				items: {
																					type: "object"
																					properties: {
																						key: type: "string"
																						value: type: "string"
																					}
																				}
																			}
																			statusMessageTemplate: {
																				description: "The template used to generate and write a status message."
																				type:        "string"
																			}
																		}
																	}]
																}, {
																	allOf: [{
																		$ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/8/properties/check/allOf/0/oneOf/0/allOf/0"
																	}, {
																		type: "object"
																		properties: type: {
																			type: "string"
																			enum: [
																				"custom",
																			]
																		}
																		required: [
																			"type",
																		]
																	}]
																}]
																discriminator: {
																	propertyName: "type"
																	mapping: {
																		deadman:   "#/components/schemas/DeadmanCheck"
																		threshold: "#/components/schemas/ThresholdCheck"
																		custom:    "#/components/schemas/CustomCheck"
																	}
																}
															}]
															queries: {
																type: "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/queries/items"
															}
															colors: {
																description: "Colors define color encoding of data into a visualization"
																type:        "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/colors/items"
															}
															legendColorizeRows: type: "boolean"
															legendHide: type: "boolean"
															legendOpacity: {
																type:   "number"
																format: "float"
															}
															legendOrientationThreshold: type: "integer"
														}
													}, {
														type: "object"
														required: [
															"type",
															"queries",
															"colors",
															"shape",
															"note",
															"showNoteWhenEmpty",
															"xColumn",
															"yColumn",
															"fillColumns",
															"symbolColumns",
															"xDomain",
															"yDomain",
															"xAxisLabel",
															"yAxisLabel",
															"xPrefix",
															"yPrefix",
															"xSuffix",
															"ySuffix",
														]
														properties: {
															timeFormat: type: "string"
															type: {
																type: "string"
																enum: [
																	"scatter",
																]
															}
															queries: {
																type: "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/queries/items"
															}
															colors: {
																description: "Colors define color encoding of data into a visualization"
																type:        "array"
																items: type: "string"
															}
															shape: {
																type: "string"
																enum: [
																	"chronograf-v2",
																]
															}
															note: type: "string"
															showNoteWhenEmpty: {
																description: "If true, will display note when empty"
																type:        "boolean"
															}
															xColumn: type: "string"
															generateXAxisTicks: {
																type: "array"
																items: type: "string"
															}
															xTotalTicks: type: "integer"
															xTickStart: {
																type:   "number"
																format: "float"
															}
															xTickStep: {
																type:   "number"
																format: "float"
															}
															yColumn: type: "string"
															generateYAxisTicks: {
																type: "array"
																items: type: "string"
															}
															yTotalTicks: type: "integer"
															yTickStart: {
																type:   "number"
																format: "float"
															}
															yTickStep: {
																type:   "number"
																format: "float"
															}
															fillColumns: {
																type: "array"
																items: type: "string"
															}
															symbolColumns: {
																type: "array"
																items: type: "string"
															}
															xDomain: {
																type: "array"
																items: type: "number"
																maxItems: 2
															}
															yDomain: {
																type: "array"
																items: type: "number"
																maxItems: 2
															}
															xAxisLabel: type: "string"
															yAxisLabel: type: "string"
															xPrefix: type: "string"
															xSuffix: type: "string"
															yPrefix: type: "string"
															ySuffix: type: "string"
															legendColorizeRows: type: "boolean"
															legendHide: type: "boolean"
															legendOpacity: {
																type:   "number"
																format: "float"
															}
															legendOrientationThreshold: type: "integer"
														}
													}, {
														type: "object"
														required: [
															"type",
															"queries",
															"colors",
															"shape",
															"note",
															"showNoteWhenEmpty",
															"xColumn",
															"yColumn",
															"xDomain",
															"yDomain",
															"xAxisLabel",
															"yAxisLabel",
															"xPrefix",
															"yPrefix",
															"xSuffix",
															"ySuffix",
															"binSize",
														]
														properties: {
															timeFormat: type: "string"
															type: {
																type: "string"
																enum: [
																	"heatmap",
																]
															}
															queries: {
																type: "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/queries/items"
															}
															colors: {
																description: "Colors define color encoding of data into a visualization"
																type:        "array"
																items: type: "string"
															}
															shape: {
																type: "string"
																enum: [
																	"chronograf-v2",
																]
															}
															note: type: "string"
															showNoteWhenEmpty: {
																description: "If true, will display note when empty"
																type:        "boolean"
															}
															xColumn: type: "string"
															generateXAxisTicks: {
																type: "array"
																items: type: "string"
															}
															xTotalTicks: type: "integer"
															xTickStart: {
																type:   "number"
																format: "float"
															}
															xTickStep: {
																type:   "number"
																format: "float"
															}
															yColumn: type: "string"
															generateYAxisTicks: {
																type: "array"
																items: type: "string"
															}
															yTotalTicks: type: "integer"
															yTickStart: {
																type:   "number"
																format: "float"
															}
															yTickStep: {
																type:   "number"
																format: "float"
															}
															xDomain: {
																type: "array"
																items: type: "number"
																maxItems: 2
															}
															yDomain: {
																type: "array"
																items: type: "number"
																maxItems: 2
															}
															xAxisLabel: type: "string"
															yAxisLabel: type: "string"
															xPrefix: type: "string"
															xSuffix: type: "string"
															yPrefix: type: "string"
															ySuffix: type: "string"
															binSize: type: "number"
															legendColorizeRows: type: "boolean"
															legendHide: type: "boolean"
															legendOpacity: {
																type:   "number"
																format: "float"
															}
															legendOrientationThreshold: type: "integer"
														}
													}, {
														type: "object"
														required: [
															"type",
															"queries",
															"colors",
															"shape",
															"note",
															"showNoteWhenEmpty",
															"xColumn",
															"ySeriesColumns",
															"fillColumns",
															"xDomain",
															"yDomain",
															"xAxisLabel",
															"yAxisLabel",
															"xPrefix",
															"yPrefix",
															"xSuffix",
															"ySuffix",
														]
														properties: {
															timeFormat: type: "string"
															type: {
																type: "string"
																enum: [
																	"mosaic",
																]
															}
															queries: {
																type: "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/queries/items"
															}
															colors: {
																description: "Colors define color encoding of data into a visualization"
																type:        "array"
																items: type: "string"
															}
															shape: {
																type: "string"
																enum: [
																	"chronograf-v2",
																]
															}
															note: type: "string"
															showNoteWhenEmpty: {
																description: "If true, will display note when empty"
																type:        "boolean"
															}
															xColumn: type: "string"
															generateXAxisTicks: {
																type: "array"
																items: type: "string"
															}
															xTotalTicks: type: "integer"
															xTickStart: {
																type:   "number"
																format: "float"
															}
															xTickStep: {
																type:   "number"
																format: "float"
															}
															yLabelColumnSeparator: type: "string"
															yLabelColumns: {
																type: "array"
																items: type: "string"
															}
															ySeriesColumns: {
																type: "array"
																items: type: "string"
															}
															fillColumns: {
																type: "array"
																items: type: "string"
															}
															xDomain: {
																type: "array"
																items: type: "number"
																maxItems: 2
															}
															yDomain: {
																type: "array"
																items: type: "number"
																maxItems: 2
															}
															xAxisLabel: type: "string"
															yAxisLabel: type: "string"
															xPrefix: type: "string"
															xSuffix: type: "string"
															yPrefix: type: "string"
															ySuffix: type: "string"
															hoverDimension: {
																type: "string"
																enum: [
																	"auto",
																	"x",
																	"y",
																	"xy",
																]
															}
															legendColorizeRows: type: "boolean"
															legendHide: type: "boolean"
															legendOpacity: {
																type:   "number"
																format: "float"
															}
															legendOrientationThreshold: type: "integer"
														}
													}, {
														type: "object"
														required: [
															"type",
															"geom",
															"queries",
															"shape",
															"axes",
															"colors",
															"note",
															"showNoteWhenEmpty",
														]
														properties: {
															timeFormat: type: "string"
															type: {
																type: "string"
																enum: [
																	"band",
																]
															}
															queries: {
																type: "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/queries/items"
															}
															colors: {
																description: "Colors define color encoding of data into a visualization"
																type:        "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/colors/items"
															}
															shape: {
																type: "string"
																enum: [
																	"chronograf-v2",
																]
															}
															note: type: "string"
															showNoteWhenEmpty: {
																description: "If true, will display note when empty"
																type:        "boolean"
															}
															axes: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/axes"
															staticLegend: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/staticLegend"
															xColumn: type: "string"
															generateXAxisTicks: {
																type: "array"
																items: type: "string"
															}
															xTotalTicks: type: "integer"
															xTickStart: {
																type:   "number"
																format: "float"
															}
															xTickStep: {
																type:   "number"
																format: "float"
															}
															yColumn: type: "string"
															generateYAxisTicks: {
																type: "array"
																items: type: "string"
															}
															yTotalTicks: type: "integer"
															yTickStart: {
																type:   "number"
																format: "float"
															}
															yTickStep: {
																type:   "number"
																format: "float"
															}
															upperColumn: type: "string"
															mainColumn: type: "string"
															lowerColumn: type: "string"
															hoverDimension: {
																type: "string"
																enum: [
																	"auto",
																	"x",
																	"y",
																	"xy",
																]
															}
															geom: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/1/properties/geom"
															legendColorizeRows: type: "boolean"
															legendHide: type: "boolean"
															legendOpacity: {
																type:   "number"
																format: "float"
															}
															legendOrientationThreshold: type: "integer"
														}
													}, {
														type: "object"
														required: [
															"type",
															"shape",
															"queries",
															"note",
															"showNoteWhenEmpty",
															"center",
															"zoom",
															"allowPanAndZoom",
															"detectCoordinateFields",
															"layers",
														]
														properties: {
															type: {
																type: "string"
																enum: [
																	"geo",
																]
															}
															queries: {
																type: "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/queries/items"
															}
															shape: {
																type: "string"
																enum: [
																	"chronograf-v2",
																]
															}
															center: {
																description: "Coordinates of the center of the map"
																type:        "object"
																required: [
																	"lat",
																	"lon",
																]
																properties: {
																	lat: {
																		description: "Latitude of the center of the map"
																		type:        "number"
																		format:      "double"
																	}
																	lon: {
																		description: "Longitude of the center of the map"
																		type:        "number"
																		format:      "double"
																	}
																}
															}
															zoom: {
																description: "Zoom level used for initial display of the map"
																type:        "number"
																format:      "double"
																minimum:     1
																maximum:     28
															}
															allowPanAndZoom: {
																description: "If true, map zoom and pan controls are enabled on the dashboard view"
																type:        "boolean"
																default:     true
															}
															detectCoordinateFields: {
																description: "If true, search results get automatically regroupped so that lon,lat and value are treated as columns"
																type:        "boolean"
																default:     true
															}
															useS2CellID: {
																description: "If true, S2 column is used to calculate lat/lon"
																type:        "boolean"
															}
															s2Column: {
																description: "String to define the column"
																type:        "string"
															}
															latLonColumns: {
																description: "Object type to define lat/lon columns"
																type:        "object"
																required: [
																	"lat",
																	"lon",
																]
																properties: {
																	lat: {
																		description: "Object type for key and column definitions"
																		type:        "object"
																		required: [
																			"key",
																			"column",
																		]
																		properties: {
																			key: {
																				description: "Key to determine whether the column is tag/field"
																				type:        "string"
																			}
																			column: {
																				description: "Column to look up Lat/Lon"
																				type:        "string"
																			}
																		}
																	}
																	lon: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/13/properties/latLonColumns/properties/lat"
																}
															}
															mapStyle: {
																description: "Define map type - regular, satellite etc."
																type:        "string"
															}
															note: type: "string"
															showNoteWhenEmpty: {
																description: "If true, will display note when empty"
																type:        "boolean"
															}
															colors: {
																description: "Colors define color encoding of data into a visualization"
																type:        "array"
																items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/colors/items"
															}
															layers: {
																description: "List of individual layers shown in the map"
																type:        "array"
																items: {
																	type: "object"
																	oneOf: [{
																		allOf: [{
																			type: "object"
																			required: [
																				"type",
																			]
																			properties: type: {
																				type: "string"
																				enum: [
																					"heatmap",
																					"circleMap",
																					"pointMap",
																					"trackMap",
																				]
																			}
																		}, {
																			type: "object"
																			required: [
																				"radiusField",
																				"radiusDimension",
																				"colorField",
																				"colorDimension",
																				"colors",
																			]
																			properties: {
																				radiusField: {
																					type:        "string"
																					description: "Radius field"
																				}
																				radiusDimension: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/axes/properties/x"
																				colorField: {
																					type:        "string"
																					description: "Circle color field"
																				}
																				colorDimension: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/axes/properties/x"
																				colors: {
																					description: "Colors define color encoding of data into a visualization"
																					type:        "array"
																					items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/colors/items"
																				}
																				radius: {
																					description: "Maximum radius size in pixels"
																					type:        "integer"
																				}
																				interpolateColors: {
																					description: "Interpolate circle color based on displayed value"
																					type:        "boolean"
																				}
																			}
																		}]
																	}, {
																		allOf: [{
																			$ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/13/properties/layers/items/oneOf/0/allOf/0"
																		}, {
																			type: "object"
																			required: [
																				"intensityField",
																				"intensityDimension",
																				"radius",
																				"blur",
																				"colors",
																			]
																			properties: {
																				intensityField: {
																					type:        "string"
																					description: "Intensity field"
																				}
																				intensityDimension: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/axes/properties/x"
																				radius: {
																					description: "Radius size in pixels"
																					type:        "integer"
																				}
																				blur: {
																					description: "Blur for heatmap points"
																					type:        "integer"
																				}
																				colors: {
																					description: "Colors define color encoding of data into a visualization"
																					type:        "array"
																					items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/colors/items"
																				}
																			}
																		}]
																	}, {
																		allOf: [{
																			$ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/13/properties/layers/items/oneOf/0/allOf/0"
																		}, {
																			type: "object"
																			required: [
																				"colorField",
																				"colorDimension",
																				"colors",
																			]
																			properties: {
																				colorField: {
																					type:        "string"
																					description: "Marker color field"
																				}
																				colorDimension: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/axes/properties/x"
																				colors: {
																					description: "Colors define color encoding of data into a visualization"
																					type:        "array"
																					items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/colors/items"
																				}
																				isClustered: {
																					description: "Cluster close markers together"
																					type:        "boolean"
																				}
																				tooltipColumns: {
																					description: "An array for which columns to display in tooltip"
																					type:        "array"
																					items: type: "string"
																				}
																			}
																		}]
																	}, {
																		allOf: [{
																			$ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/13/properties/layers/items/oneOf/0/allOf/0"
																		}, {
																			type: "object"
																			required: [
																				"trackWidth",
																				"speed",
																				"randomColors",
																				"trackPointVisualization",
																			]
																		}]
																		properties: {
																			trackWidth: {
																				description: "Width of the track"
																				type:        "integer"
																			}
																			speed: {
																				description: "Speed of the track animation"
																				type:        "integer"
																			}
																			randomColors: {
																				description: "Assign different colors to different tracks"
																				type:        "boolean"
																			}
																			colors: {
																				description: "Colors define color encoding of data into a visualization"
																				type:        "array"
																				items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/1/allOf/1/properties/cells/items/allOf/1/properties/properties/oneOf/0/properties/colors/items"
																			}
																		}
																	}]
																}
															}
														}
													}]
												}
											}]
										}
									}
									labels: $ref: "#/components/schemas/Variable/properties/labels"
								}
							}]
						}]
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/responses/ServerError/content/application~1json/schema"
					}
				}
			}
			get: {
				operationId: "GetDashboards"
				tags: [
					"Dashboards",
				]
				summary: "List all dashboards"
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}, {
					in:       "query"
					name:     "offset"
					required: false
					schema: {
						type:    "integer"
						minimum: 0
					}
				}, {
					in:       "query"
					name:     "descending"
					required: false
					schema: {
						type:    "boolean"
						default: false
					}
				}, {
					in:   "query"
					name: "limit"
					schema: {
						type:    "integer"
						minimum: -1
						maximum: 100
						default: 20
					}
					description: "The non-zero number of dashboards to return"
				}, {
					in:          "query"
					name:        "owner"
					description: "A user identifier. Returns only dashboards where this user has the `owner` role."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "sortBy"
					description: "The column to sort by."
					schema: {
						type: "string"
						enum: [
							"ID",
							"CreatedAt",
							"UpdatedAt",
						]
					}
				}, {
					in:          "query"
					name:        "id"
					description: "A list of dashboard identifiers. Returns only the listed dashboards. If both `id` and `owner` are specified, only `id` is used."
					schema: {
						type: "array"
						items: type: "string"
					}
				}, {
					in:          "query"
					name:        "orgID"
					description: "The identifier of the organization."
					schema: type: "string"
				}, {
					in:          "query"
					name:        "org"
					description: "The name of the organization."
					schema: type: "string"
				}]
				responses: {
					"200": {
						description: "All dashboards"
						content: "application/json": schema: {
							type: "object"
							properties: {
								links: {
									type: "object"
									properties: {
										next: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
										self: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
										prev: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
									}
									required: [
										"self",
									]
								}
								dashboards: {
									type: "array"
									items: $ref: "#/paths/~1dashboards/post/responses/201/content/application~1json/schema/oneOf/0"
								}
							}
						}
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/responses/ServerError/content/application~1json/schema"
					}
				}
			}
		}
		"/tasks": {
			get: {
				operationId: "GetTasks"
				tags: [
					"Tasks",
				]
				summary: "List all tasks"
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}, {
					in:          "query"
					name:        "name"
					description: "Returns task with a specific name."
					schema: type: "string"
				}, {
					in:   "query"
					name: "after"
					schema: type: "string"
					description: "Return tasks after a specified ID."
				}, {
					in:   "query"
					name: "user"
					schema: type: "string"
					description: "Filter tasks to a specific user ID."
				}, {
					in:   "query"
					name: "org"
					schema: type: "string"
					description: "Filter tasks to a specific organization name."
				}, {
					in:   "query"
					name: "orgID"
					schema: type: "string"
					description: "Filter tasks to a specific organization ID."
				}, {
					in:   "query"
					name: "status"
					schema: {
						type: "string"
						enum: [
							"active",
							"inactive",
						]
					}
					description: "Filter tasks by a status--\"inactive\" or \"active\"."
				}, {
					in:   "query"
					name: "limit"
					schema: {
						type:    "integer"
						minimum: -1
						maximum: 500
						default: 100
					}
					description: "The non-zero number of tasks to return"
				}, {
					in:          "query"
					name:        "type"
					description: "Type of task, unset by default."
					required:    false
					schema: {
						default: ""
						type:    "string"
						enum: [
							"basic",
							"system",
						]
					}
				}]
				responses: {
					"200": {
						description: "A list of tasks"
						content: "application/json": schema: {
							type: "object"
							properties: {
								links: {
									readOnly: true
									$ref:     "#/paths/~1dashboards/get/responses/200/content/application~1json/schema/properties/links"
								}
								tasks: {
									type: "array"
									items: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema"
								}
							}
						}
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/responses/ServerError/content/application~1json/schema"
					}
				}
			}
			post: {
				operationId: "PostTasks"
				tags: [
					"Tasks",
				]
				summary: "Create a new task"
				parameters: [{
					$ref: "#/paths/~1users/get/parameters/0"
				}]
				requestBody: {
					description: "Task to create"
					required:    true
					content: "application/json": schema: {
						type: "object"
						properties: {
							orgID: {
								description: "The ID of the organization that owns this Task."
								type:        "string"
							}
							org: {
								description: "The name of the organization that owns this Task."
								type:        "string"
							}
							status: {
								type: "string"
								enum: [
									"active",
									"inactive",
								]
							}
							flux: {
								description: "The Flux script to run for this task."
								type:        "string"
							}
							description: {
								description: "An optional description of the task."
								type:        "string"
							}
						}
						required: [
							"flux",
						]
					}
				}
				responses: {
					"201": {
						description: "Task created"
						content: "application/json": schema: {
							type: "object"
							properties: {
								id: {
									readOnly: true
									type:     "string"
								}
								type: {
									description: "The type of task, this can be used for filtering tasks on list actions."
									type:        "string"
								}
								orgID: {
									description: "The ID of the organization that owns this Task."
									type:        "string"
								}
								org: {
									description: "The name of the organization that owns this Task."
									type:        "string"
								}
								name: {
									description: "The name of the task."
									type:        "string"
								}
								ownerID: {
									description: "The ID of the user who owns this Task."
									type:        "string"
								}
								description: {
									description: "An optional description of the task."
									type:        "string"
								}
								status: $ref: "#/paths/~1tasks/post/requestBody/content/application~1json/schema/properties/status"
								labels: $ref: "#/components/schemas/Variable/properties/labels"
								authorizationID: {
									description: "The ID of the authorization used when this task communicates with the query engine."
									type:        "string"
								}
								flux: {
									description: "The Flux script to run for this task."
									type:        "string"
								}
								every: {
									description: "A simple task repetition schedule; parsed from Flux."
									type:        "string"
								}
								cron: {
									description: "A task repetition schedule in the form '* * * * * *'; parsed from Flux."
									type:        "string"
								}
								offset: {
									description: "Duration to delay after the schedule, before executing the task; parsed from flux, if set to zero it will remove this option and use 0 as the default."
									type:        "string"
								}
								latestCompleted: {
									description: "Timestamp of latest scheduled, completed run, RFC3339."
									type:        "string"
									format:      "date-time"
									readOnly:    true
								}
								lastRunStatus: {
									readOnly: true
									type:     "string"
									enum: [
										"failed",
										"success",
										"canceled",
									]
								}
								lastRunError: {
									readOnly: true
									type:     "string"
								}
								createdAt: {
									type:     "string"
									format:   "date-time"
									readOnly: true
								}
								updatedAt: {
									type:     "string"
									format:   "date-time"
									readOnly: true
								}
								links: {
									type:     "object"
									readOnly: true
									example: {
										self:    "/api/v2/tasks/1"
										owners:  "/api/v2/tasks/1/owners"
										members: "/api/v2/tasks/1/members"
										labels:  "/api/v2/tasks/1/labels"
										runs:    "/api/v2/tasks/1/runs"
										logs:    "/api/v2/tasks/1/logs"
									}
									properties: {
										self: {
											type:        "string"
											format:      "uri"
											readOnly:    true
											description: "URI of resource."
										}
										owners: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
										members: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
										runs: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
										logs: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
										labels: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
									}
								}
							}
							required: [
								"id",
								"name",
								"orgID",
								"flux",
							]
						}
					}
					default: {
						description: "Unexpected error"
						content: "application/json": schema: $ref: "#/components/responses/ServerError/content/application~1json/schema"
					}
				}
			}
		}
		"/write": post: {
			operationId: "PostWrite"
			tags: [
				"Write",
			]
			summary: "Write data"
			description: """
				Writes data to a bucket.

				To write data into InfluxDB, you need the following:

				- **organization name or ID** – _See [View organizations]({{% INFLUXDB_DOCS_URL %}}/organizations/view-orgs/#view-your-organization-id) for instructions on viewing your organization ID._
				- **bucket** – _See [View buckets]({{% INFLUXDB_DOCS_URL %}}/organizations/buckets/view-buckets/) for
				 instructions on viewing your bucket ID._
				- **API token** – _See [View tokens]({{% INFLUXDB_DOCS_URL %}}/security/tokens/view-tokens/)
				 for instructions on viewing your API token._
				- **InfluxDB URL** – _See [InfluxDB URLs]({{% INFLUXDB_DOCS_URL %}}/reference/urls/)_.
				- data in [line protocol]({{% INFLUXDB_DOCS_URL %}}/reference/syntax/line-protocol) format.

				For more information and examples, see the following:
				- [Write data with the InfluxDB API]({{% INFLUXDB_DOCS_URL %}}/write-data/developer-tools/api).
				- [Optimize writes to InfluxDB]({{% INFLUXDB_DOCS_URL %}}/write-data/best-practices/optimize-writes/).

				"""

			requestBody: {

				description: "Data in line protocol format."
				required:    true
				content: "text/plain": schema: {
					type:   "string"
					format: "byte"
				}
			}, parameters: [{
				$ref: "#/paths/~1users/get/parameters/0"
			}, {
				in:   "header"
				name: "Content-Encoding"
				description: """
					The value tells InfluxDB what compression is applied to the line protocol in the request payload.
					To make an API request with a GZIP payload, send `Content-Encoding: gzip` as a request header.

					"""

				schema: {
					type:        "string"
					description: "The content coding. Use `gzip` for compressed data or `identity` for unmodified, uncompressed data."
					default:     "identity"
					enum: [
						"gzip",
						"identity",
					]
				}
			}, {
				in:          "header"
				name:        "Content-Type"
				description: "The header value indicates the format of the data in the request body."
				schema: {
					type: "string"
					description: """
						`text/plain` specifies line protocol. `UTF-8` is the default character set.

						"""

					default: "text/plain; charset=utf-8"
					enum: [
						"text/plain",
						"text/plain; charset=utf-8",
						"application/vnd.influx.arrow",
					]
				}
			}, {
				in:          "header"
				name:        "Content-Length"
				description: "The header value indicates the size of the entity-body, in bytes, sent to the database. If the length is greater than the database's `max body` configuration option, the server responds with status code `413`."
				schema: {
					type:        "integer"
					description: "The length in decimal number of octets."
				}
			}, {
				in:          "header"
				name:        "Accept"
				description: "The header value specifies the response format."
				schema: {
					type:        "string"
					description: "The response format for errors."
					default:     "application/json"
					enum: ["application/json"]
				}
			}, {
				in:          "query"
				name:        "org"
				description: "The parameter value specifies the destination organization for writes. The database writes all points in the batch to this organization. If you provide both `orgID` and `org` parameters, `org` takes precedence."
				required:    true
				schema: {
					type:        "string"
					description: "Organization name or ID."
				}
			}, {
				in:          "query"
				name:        "orgID"
				description: "The parameter value specifies the ID of the destination organization for writes. If both `orgID` and `org` are specified, `org` takes precedence."
				schema: type: "string"
			}, {
				in:          "query"
				name:        "bucket"
				description: "The destination bucket for writes."
				required:    true
				schema: {
					type:        "string"
					description: "All points within batch are written to this bucket."
				}
			}, {
				in:          "query"
				name:        "precision"
				description: "The precision for the unix timestamps within the body line-protocol."
				schema: {
					type: "string"
					enum: [
						"ms",
						"s",
						"us",
						"ns",
					]
				}
			}], responses: {

				"204": description: "InfluxDB validated the request data format and accepted the data for writing to the bucket. `204` doesn't indicate a successful write operation since writes are asynchronous. See [how to check for write errors]({{% INFLUXDB_DOCS_URL %}}/write-data/troubleshoot)."
				"400": {
					description: "Bad request. The line protocol data in the request is malformed. The response body contains the first malformed line in the data. InfluxDB rejected the batch and did not write any data."
					content: "application/json": {
						schema: {
							properties: {
								code: {
									description: "Code is the machine-readable error code."
									readOnly:    true
									type:        "string"
									enum: [
										"internal error",
										"not found",
										"conflict",
										"invalid",
										"empty value",
										"unavailable",
									]
								}
								message: {
									readOnly:    true
									description: "Message is a human-readable message."
									type:        "string"
								}
								op: {
									readOnly:    true
									description: "Op describes the logical code operation during error. Useful for debugging."
									type:        "string"
								}
								err: {
									readOnly:    true
									description: "Err is a stack of errors that occurred during processing of the request. Useful for debugging."
									type:        "string"
								}
								line: {
									readOnly:    true
									description: "First line within sent body containing malformed data"
									type:        "integer"
									format:      "int32"
								}
							}
							required: [
								"code",
								"message",
								"op",
								"err",
							]
						}
						examples: measurementSchemaFieldTypeConflict: {
							summary: "Field type conflict thrown by an explicit bucket schema"
							value: {
								code:    "invalid"
								message: "partial write error (2 written): unable to parse 'air_sensor,service=S1,sensor=L1 temperature=\"90.5\",humidity=70.0 1632850122': schema: field type for field \"temperature\" not permitted by schema; got String but expected Float"
							}
						}
					}
				}
				"401": {
					description: """
						Unauthorized. The error may indicate one of the following:
						  * The `Authorization: Token` header is missing or malformed.
						  * The API token value is missing from the header.
						  * The token does not have sufficient permissions to write to this organization and bucket.

						"""

					content: "application/json": {
						schema: $ref: "#/components/responses/ServerError/content/application~1json/schema"
						examples: tokenNotAuthorized: {
							summary: "Token is not authorized to access the organization or resource"
							value: {
								code:    "unauthorized"
								message: "unauthorized access"
							}
						}
					}
				}
				"404": {
					description: "Not found. A requested resource was not found. The response body contains the requested resource type, e.g. `organization name` or `bucket`, and name."
					content: "application/json": {
						schema: $ref: "#/components/responses/ServerError/content/application~1json/schema"
						examples: "resource-not-found": {
							summary: "Not found error"
							value: {
								code:    "not found"
								message: "bucket \"air_sensor\" not found"
							}
						}
					}
				}
				"413": {
					description: "Request entity too large. The payload exceeded the 50MB size limit. InfluxDB rejected the batch and did not write any data."
					content: "text/html": {
						schema: type: "string"
						examples: dataExceedsSizeLimit: {
							summary: "Cloud response"
							value: """
		<html>
		  <head><title>413 Request Entity Too Large</title></head>
		  <body>
		    <center><h1>413 Request Entity Too Large</h1></center>
		    <hr>
		    <center>nginx</center>
		  </body>
		</html>

		"""
						}
					}
				}

				"429": {
					description: "The token is temporarily over quota. The Retry-After header describes when to try the write again."
					headers: "Retry-After": {
						description: "A non-negative decimal integer indicating the seconds to delay after the response is received."
						schema: {
							type:   "integer"
							format: "int32"
						}
					}
				}
				"500": {
					description: "Internal server error."
					content: "application/json": {
						schema: $ref: "#/components/responses/ServerError/content/application~1json/schema"
						examples: internalError: {
							summary: "Internal error example"
							value: code: "internal error"
						}
					}
				}
				"503": {
					description: "The server is temporarily unavailable to accept writes.  The `Retry-After` header describes when to try the write again."
					headers: "Retry-After": {
						description: "A non-negative decimal integer indicating the seconds to delay after the response is received."
						schema: {
							type:   "integer"
							format: "int32"
						}
					}
				}
				default: $ref: "#/components/responses/ServerError"
			}
		}
	}, components: {
		parameters: null, schemas: {
			DemoDataBucket: {
				properties: {

					links: {
						type:     "object"
						readOnly: true
						example: {
							labels:  "/api/v2/buckets/1/labels"
							members: "/api/v2/buckets/1/members"
							org:     "/api/v2/orgs/2"
							owners:  "/api/v2/buckets/1/owners"
							self:    "/api/v2/buckets/1"
							write:   "/api/v2/write?org=2&bucket=1"
						}
						properties: {
							labels: {
								description: "URL to retrieve labels for this bucket"
								$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
							}
							members: {
								description: "URL to retrieve members that can read this bucket"
								$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
							}
							org: {
								description: "URL to retrieve parent organization for this bucket"
								$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
							}
							owners: {
								description: "URL to retrieve owners that can read and write to this bucket."
								$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
							}
							self: {
								description: "URL for this bucket"
								$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
							}
							write: {
								description: "URL to write line protocol for this bucket"
								$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
							}
						}
					}
					id: {
						readOnly: true
						type:     "string"
					}
					type: {
						readOnly: true
						type:     "string"
						default:  "demodata"
					}
					name: type: "string"
					description: type: "string"
					orgID: type: "string"
					rp: type: "string"
					schemaType: {
						default: "implicit"
						type:    "string"
						enum: [
							"implicit",
							"explicit",
						]
					}
					createdAt: {
						type:     "string"
						format:   "date-time"
						readOnly: true
					}
					updatedAt: {
						type:     "string"
						format:   "date-time"
						readOnly: true
					}
					retentionRules: {
						type:        "array"
						description: "Rules to expire or retain data.  No rules means data never expires."
						items: {
							type: "object"
							properties: {
								type: {
									type:    "string"
									default: "expire"
									enum: ["expire"]
								}
								everySeconds: {
									type:        "integer"
									format:      "int64"
									description: "Duration in seconds for how long data will be kept in the database. 0 means infinite."
									example:     86400
									minimum:     0
								}
								shardGroupDurationSeconds: {
									type:        "integer"
									format:      "int64"
									description: "Shard duration measured in seconds."
								}
							}
							required: [
								"type",
								"everySeconds",
							]
						}
					}
					labels: $ref: "#/components/schemas/Variable/properties/labels"
				}, required: [
					"name",
					"retentionRules",
				]
			}, DemoDataBuckets: {
				type:
					"object", properties: {

					links: {
						readOnly: true
						$ref:     "#/paths/~1dashboards/get/responses/200/content/application~1json/schema/properties/links"
					}
					buckets: {
						type: "array"
						items: $ref: "#/components/schemas/DemoDataBucket"
					}
				}
			}, Resource: {
				type:
					"object", required: ["type"], properties: {

					type: {
						type: "string"
						enum: [
							"authorizations",
							"buckets",
							"dashboards",
							"orgs",
							"tasks",
							"telegrafs",
							"users",
							"variables",
							"secrets",
							"labels",
							"views",
							"documents",
							"notificationRules",
							"notificationEndpoints",
							"checks",
							"dbrp",
							"flows",
							"annotations",
							"functions",
						]
					}
					id: {
						type:        "string"
						nullable:    true
						description: "If ID is set that is a permission for a specific resource. if it is not set it is a permission for all resources of that resource type."
					}
					name: {
						type:        "string"
						nullable:    true
						description: "Optional name of the resource if the resource has a name field."
					}
					orgID: {
						type:        "string"
						nullable:    true
						description: "If orgID is set that is a permission for all resources owned my that org. if it is not set it is a permission for all resources of that resource type."
					}
					org: {
						type:        "string"
						nullable:    true
						description: "Optional name of the organization of the organization with orgID."
					}
				}
			}, Permission: {
				required: [
					"action",
					"resource",
				], properties: {

					action: {
						type: "string"
						enum: [
							"read",
							"write",
						]
					}
					resource: $ref: "#/components/schemas/Resource"
				}
			}, Authorization: {
				required: [
					"orgID",
					"permissions",
				], allOf: [{
					properties: {
						status: {
							description: "If inactive the token is inactive and requests using the token will be rejected."
							default:     "active"
							type:        "string"
							enum: [
								"active",
								"inactive",
							]
						}
						description: {
							type:        "string"
							description: "A description of the token."
						}
					}
				}, {
					type: "object"
					properties: {
						createdAt: {
							type:     "string"
							format:   "date-time"
							readOnly: true
						}
						updatedAt: {
							type:     "string"
							format:   "date-time"
							readOnly: true
						}
						orgID: {
							type:        "string"
							description: "ID of org that authorization is scoped to."
						}
						permissions: {
							type:        "array"
							minItems:    1
							description: "List of permissions for an auth.  An auth must have at least one Permission."
							items: $ref: "#/components/schemas/Permission"
						}
						id: {
							readOnly: true
							type:     "string"
						}
						token: {
							readOnly:    true
							type:        "string"
							description: "Passed via the Authorization Header and Token Authentication type."
						}
						userID: {
							readOnly:    true
							type:        "string"
							description: "ID of user that created and owns the token."
						}
						user: {
							readOnly:    true
							type:        "string"
							description: "Name of user that created and owns the token."
						}
						org: {
							readOnly:    true
							type:        "string"
							description: "Name of the org token is scoped to."
						}
						links: {
							type:     "object"
							readOnly: true
							example: {
								self: "/api/v2/authorizations/1"
								user: "/api/v2/users/12"
							}
							properties: {
								self: {
									readOnly: true
									$ref:     "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
								}
								user: {
									readOnly: true
									$ref:     "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
								}
							}
						}
					}
				}]
			}, Authorizations: {
				type:
					"object", properties: {

					links: {
						readOnly: true
						$ref:     "#/paths/~1dashboards/get/responses/200/content/application~1json/schema/properties/links"
					}
					authorizations: {
						type: "array"
						items: $ref: "#/components/schemas/Authorization"
					}
				}
			}, User: {
				properties: {

					id: {
						readOnly: true
						type:     "string"
					}
					oauthID: type: "string"
					name: type: "string"
					status: {
						description: "If inactive the user is inactive."
						default:     "active"
						type:        "string"
						enum: [
							"active",
							"inactive",
						]
					}
					role: {
						type: "string"
						enum: [
							"owner",
							"member",
						]
					}
					org_id: type: "string"
				}, required: ["name"]
			}, Users: {
				type:
					"object", properties: {

					links: {
						type: "object"
						properties: self: {
							type:   "string"
							format: "uri"
						}
					}
					users: {
						type: "array"
						items: $ref: "#/components/schemas/OnboardingResponse/properties/user"
					}
				}
			}, OnboardingRequest: {
				type:
					"object", properties: {

					username: type: "string"
					password: type: "string"
					org: type: "string"
					bucket: type: "string"
					retentionPeriodHrs: {
						type:       "integer"
						deprecated: true
					}
					retentionPeriodSeconds: type: "integer"
					limit: $ref: "#/components/schemas/Limit"
				}, required: [
					"username",
					"org",
					"bucket",
				]
			}, OnboardingResponse: {
				type:
					"object", properties: {

					user: {
						properties: {
							id: {
								readOnly: true
								type:     "string"
							}
							oauthID: type: "string"
							name: type: "string"
							status: {
								description: "If inactive the user is inactive."
								default:     "active"
								type:        "string"
								enum: [
									"active",
									"inactive",
								]
							}
							links: {
								type:     "object"
								readOnly: true
								example: self: "/api/v2/users/1"
								properties: self: {
									type:   "string"
									format: "uri"
								}
							}
						}
						required: ["name"]
					}
					org: {
						properties: {
							links: {
								type:     "object"
								readOnly: true
								example: {
									self:       "/api/v2/orgs/1"
									members:    "/api/v2/orgs/1/members"
									owners:     "/api/v2/orgs/1/owners"
									labels:     "/api/v2/orgs/1/labels"
									secrets:    "/api/v2/orgs/1/secrets"
									buckets:    "/api/v2/buckets?org=myorg"
									tasks:      "/api/v2/tasks?org=myorg"
									dashboards: "/api/v2/dashboards?org=myorg"
								}
								properties: {
									self: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
									members: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
									owners: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
									labels: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
									secrets: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
									buckets: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
									tasks: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
									dashboards: $ref: "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
								}
							}
							id: {
								readOnly: true
								type:     "string"
							}
							name: type: "string"
							description: type: "string"
							createdAt: {
								type:     "string"
								format:   "date-time"
								readOnly: true
							}
							updatedAt: {
								type:     "string"
								format:   "date-time"
								readOnly: true
							}
							status: {
								description: "If inactive the organization is inactive."
								default:     "active"
								type:        "string"
								enum: [
									"active",
									"inactive",
								]
							}
						}
						required: ["name"]
					}
					bucket: {
						properties: {
							links: {
								type:     "object"
								readOnly: true
								example: {
									labels:  "/api/v2/buckets/1/labels"
									members: "/api/v2/buckets/1/members"
									org:     "/api/v2/orgs/2"
									owners:  "/api/v2/buckets/1/owners"
									self:    "/api/v2/buckets/1"
									write:   "/api/v2/write?org=2&bucket=1"
								}
								properties: {
									labels: {
										description: "URL to retrieve labels for this bucket"
										$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
									}
									members: {
										description: "URL to retrieve members that can read this bucket"
										$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
									}
									org: {
										description: "URL to retrieve parent organization for this bucket"
										$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
									}
									owners: {
										description: "URL to retrieve owners that can read and write to this bucket."
										$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
									}
									self: {
										description: "URL for this bucket"
										$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
									}
									write: {
										description: "URL to write line protocol for this bucket"
										$ref:        "#/paths/~1tasks/post/responses/201/content/application~1json/schema/properties/links/properties/self"
									}
								}
							}
							id: {
								readOnly: true
								type:     "string"
							}
							type: {
								readOnly: true
								type:     "string"
								default:  "user"
								enum: [
									"user",
									"system",
								]
							}
							name: type: "string"
							description: type: "string"
							orgID: type: "string"
							rp: type: "string"
							schemaType: {
								$ref:    "#/components/schemas/DemoDataBucket/properties/schemaType"
								default: "implicit"
							}
							createdAt: {
								type:     "string"
								format:   "date-time"
								readOnly: true
							}
							updatedAt: {
								type:     "string"
								format:   "date-time"
								readOnly: true
							}
							retentionRules: $ref: "#/components/schemas/DemoDataBucket/properties/retentionRules"
							labels: $ref: "#/components/schemas/Variable/properties/labels"
						}
						required: [
							"name",
							"retentionRules",
						]
					}
					auth: $ref: "#/components/schemas/Authorization"
				}
			}, Limit: {
				type:
					"object", description:
					"These are org limits similar to those configured in/by quartz.", properties: {

					orgID: type: "string"
					rate: {
						type: "object"
						properties: {
							readKBs: {
								type:        "integer"
								description: "Query limit in kb/sec. 0 is unlimited."
							}
							concurrentReadRequests: {
								type:        "integer"
								description: "Allowed concurrent queries. 0 is unlimited."
							}
							writeKBs: {
								type:        "integer"
								description: "Write limit in kb/sec. 0 is unlimited."
							}
							concurrentWriteRequests: {
								type:        "integer"
								description: "Allowed concurrent writes. 0 is unlimited."
							}
							cardinality: {
								type:        "integer"
								description: "Allowed organization total cardinality. 0 is unlimited."
							}
							concurrentDeleteRequests: {
								type:        "integer"
								description: "Allowed organization concurrent outstanding delete requests."
							}
							deleteRequestsPerSecond: {
								type:        "integer"
								description: "Allowed organization delete request rate."
							}
						}
						required: [
							"readKBs",
							"concurrentReadRequests",
							"writeKBs",
							"concurrentWriteRequests",
							"cardinality",
						]
					}
					bucket: {
						type: "object"
						properties: {
							maxBuckets: type: "integer"
							maxRetentionDuration: {
								type:        "integer"
								description: "Max bucket retention duration in nanoseconds. 0 is unlimited."
							}
						}
						required: [
							"maxBuckets",
							"maxRetentionDuration",
						]
					}
					task: {
						type: "object"
						properties: maxTasks: type: "integer"
						required: ["maxTasks"]
					}
					dashboard: {
						type: "object"
						properties: maxDashboards: type: "integer"
						required: ["maxDashboards"]
					}
					check: {
						type: "object"
						properties: maxChecks: type: "integer"
						required: ["maxChecks"]
					}
					notificationRule: {
						type: "object"
						properties: {
							maxNotifications: type: "integer"
							blockedNotificationRules: {
								type:        "string"
								description: "comma separated list of notification rules"
								example:     "http,pagerduty"
							}
						}
						required: [
							"maxNotifications",
							"blockNotificationRules",
						]
					}
					notificationEndpoint: {
						type: "object"
						properties: blockedNotificationEndpoints: {
							type:        "string"
							description: "comma separated list of notification endpoints"
							example:     "http,pagerduty"
						}
						required: ["blockNotificationEndpoints"]
					}
					features: {
						type: "object"
						properties: allowDelete: {
							type:        "boolean"
							description: "allow delete predicate endpoint"
						}
					}
				}, required: [
					"rate",
					"bucket",
					"task",
					"dashboard",
					"check",
					"notificationRule",
					"notificationEndpoint",
				]
			}, Variable: {
				type:
					"object", required: [
					"name",
					"orgID",
					"arguments",
				], properties: {

					links: {
						type:     "object"
						readOnly: true
						properties: {
							self: {
								type:   "string"
								format: "uri"
							}
							org: {
								type:   "string"
								format: "uri"
							}
							labels: {
								type:   "string"
								format: "uri"
							}
						}
					}
					id: {
						readOnly: true
						type:     "string"
					}
					orgID: type: "string"
					name: type: "string"
					description: type: "string"
					selected: {
						type: "array"
						items: type: "string"
					}
					sort_order: type: "integer"
					labels: {
						type: "array"
						items: {
							type: "object"
							properties: {
								id: {
									readOnly: true
									type:     "string"
								}
								orgID: {
									readOnly: true
									type:     "string"
								}
								name: type: "string"
								properties: {
									type: "object"
									additionalProperties: type: "string"
									description: "Key/Value pairs associated with this label. Keys can be removed by sending an update with an empty value."
									example: {
										color:       "ffb3b3"
										description: "this is a description"
									}
								}
							}
						}
					}
					arguments: {
						type: "object"
						oneOf: [{
							properties: {
								type: {
									type: "string"
									enum: ["query"]
								}
								values: {
									type: "object"
									properties: {
										query: type: "string"
										language: type: "string"
									}
								}
							}
						}, {
							properties: {
								type: {
									type: "string"
									enum: ["constant"]
								}
								values: {
									type: "array"
									items: type: "string"
								}
							}
						}, {
							properties: {
								type: {
									type: "string"
									enum: ["map"]
								}
								values: {
									type: "object"
									additionalProperties: type: "string"
								}
							}
						}]
					}
					createdAt: {
						type:   "string"
						format: "date-time"
					}
					updatedAt: {
						type:   "string"
						format: "date-time"
					}
				}
			}, Variables: {
				type:
					"object", example: variables: [{
					id:   "1221432"
					name: ":ok:"
					selected: ["hello"]
					arguments: {
						type: "constant"
						values: [
							"howdy",
							"hello",
							"hi",
							"yo",
							"oy",
						]
					}
				}, {
					id:   "1221432"
					name: ":ok:"
					selected: ["c"]
					arguments: {
						type: "map"
						values: {
							a: "fdjaklfdjkldsfjlkjdsa"
							b: "dfaksjfkljekfajekdljfas"
							c: "fdjksajfdkfeawfeea"
						}
					}
				}, {
					id:   "1221432"
					name: ":ok:"
					selected: ["host"]
					arguments: {
						type:     "query"
						query:    "from(bucket: \"foo\") |> showMeasurements()"
						language: "flux"
					}
				}], properties: variables: {
					type: "array"
					items: $ref: "#/components/schemas/Variable"
				}
			}, ColumnDataType: {
				type:
					"string", enum: [
					"integer",
					"float",
					"boolean",
					"string",
					"unsigned",
				]
			}, ColumnSemanticType: {
				type:
					"string", nullable:
					false, enum: [
					"timestamp",
					"tag",
					"field",
				]
			}, MeasurementSchema: {
				description:
					"The schema definition for a single measurement", type:
					"object", example: {

					id:       "1a3c5e7f9b0a8642"
					orgID:    "0a3c5e7f9b0a0001"
					bucketID: "ba3c5e7f9b0a0010"
					name:     "cpu"
					columns: [{
						name: "time"
						type: "timestamp"
					}, {
						name: "host"
						type: "tag"
					}, {
						name: "region"
						type: "tag"
					}, {
						name:     "usage_user"
						type:     "field"
						dataType: "float"
					}, {
						name:     "usage_user"
						type:     "field"
						dataType: "float"
					}]
					createdAt: "2021-01-21T00:48:40.993Z"
					updatedAt: "2021-01-21T00:48:40.993Z"
				}, required: [
					"id",
					"name",
					"columns",
					"createdAt",
					"updatedAt",
				], properties: {

					id: {
						type:     "string"
						readOnly: true
					}
					orgID: {
						type:        "string"
						description: "ID of organization that the measurement schema is associated with."
					}
					bucketID: {
						type:        "string"
						description: "ID of the bucket that the measurement schema is associated with."
					}
					name: {
						type:     "string"
						nullable: false
					}
					columns: {
						description: "An ordered collection of column definitions"
						type:        "array"
						items: $ref: "#/components/schemas/MeasurementSchemaColumn"
					}
					createdAt: {
						type:     "string"
						format:   "date-time"
						readOnly: true
					}
					updatedAt: {
						type:     "string"
						format:   "date-time"
						readOnly: true
					}
				}
			}, MeasurementSchemaColumn: {
				description:
					"Definition of a measurement column", example: {

					name: "time"
					type: "timestamp"
				}, type:
					"object", required: [
					"name",
					"type",
				], properties: {

					name: type: "string"
					type: $ref: "#/components/schemas/ColumnSemanticType"
					dataType: $ref: "#/components/schemas/ColumnDataType"
				}
			}, MeasurementSchemaCreateRequest: {
				description:
					"Create a new measurement schema", type:
					"object", example: {

					name: "cpu"
					columns: [{
						name: "time"
						type: "timestamp"
					}, {
						name: "host"
						type: "tag"
					}, {
						name: "region"
						type: "tag"
					}, {
						name:     "usage_user"
						type:     "field"
						dataType: "float"
					}, {
						name:     "usage_user"
						type:     "field"
						dataType: "float"
					}]
				}, required: [
					"name",
					"columns",
				], properties: {

					name: type: "string"
					columns: {
						description: "An ordered collection of column definitions"
						type:        "array"
						items: $ref: "#/components/schemas/MeasurementSchemaColumn"
					}
				}
			}, MeasurementSchemaList: {
				description:
					"A list of measurement schemas returning summary information", example: measurementSchemas: [{
					id:        "1a3c5e7f9b0a8642"
					orgID:     "0a3c5e7f9b0a0001"
					bucketID:  "ba3c5e7f9b0a0010"
					name:      "cpu"
					createdAt: "2021-01-21T00:48:40.993Z"
					updatedAt: "2021-01-21T00:48:40.993Z"
				}, {
					id:        "1a3c5e7f9b0a8643"
					orgID:     "0a3c5e7f9b0a0001"
					bucketID:  "ba3c5e7f9b0a0010"
					name:      "memory"
					createdAt: "2021-01-21T00:48:40.993Z"
					updatedAt: "2021-01-21T00:48:40.993Z"
				}, {
					id:        "1a3c5e7f9b0a8644"
					orgID:     "0a3c5e7f9b0a0001"
					bucketID:  "ba3c5e7f9b0a0010"
					name:      "disk"
					createdAt: "2021-01-21T00:48:40.993Z"
					updatedAt: "2021-01-21T00:48:40.993Z"
				}], type:
					"object", required: ["measurementSchemas"], properties: measurementSchemas: {
					type: "array"
					items: $ref: "#/components/schemas/MeasurementSchema"
				}
			}, MeasurementSchemaUpdateRequest: {
				description:
					"Update an existing measurement schema", type:
					"object", example: columns: [{
					name: "time"
					type: "timestamp"
				}, {
					name: "host"
					type: "tag"
				}, {
					name: "region"
					type: "tag"
				}, {
					name:     "usage_user"
					type:     "field"
					dataType: "float"
				}, {
					name:     "usage_user"
					type:     "field"
					dataType: "float"
				}], required: ["columns"], properties: columns: {
					description: "An ordered collection of column definitions"
					type:        "array"
					items: $ref: "#/components/schemas/MeasurementSchemaColumn"
				}
			}
		}, responses: ServerError: {
			description:
				"Non 2XX error response from server.", content: "application/json": schema: {
				properties: {
					code: {
						description: "code is the machine-readable error code."
						readOnly:    true
						type:        "string"
						enum: [
							"internal error",
							"not found",
							"conflict",
							"invalid",
							"unprocessable entity",
							"empty value",
							"unavailable",
							"forbidden",
							"too many requests",
							"unauthorized",
							"method not allowed",
							"request too large",
							"unsupported media type",
						]
					}
					message: {
						readOnly:    true
						description: "message is a human-readable message."
						type:        "string"
					}
					op: {
						readOnly:    true
						description: "op describes the logical code operation during error. Useful for debugging."
						type:        "string"
					}
					err: {
						readOnly:    true
						description: "err is a stack of errors that occurred during processing of the request. Useful for debugging."
						type:        "string"
					}
				}
				required: [
					"code",
					"message",
				]
			}
		}, securitySchemes: {
			TokenAuthentication: {
				type:
					"http", scheme:
					"token", bearerFormat:
					"InfluxDB token string", description:
					"""
						### Token authentication scheme

						InfluxDB API tokens ensure secure interaction between users and data. A token belongs to an organization and identifies InfluxDB permissions within the organization.

						Include your API token in an `Authorization: Token INFLUX_TOKEN` HTTP header with each request.

						#### Example

						`curl https://us-east-1-1.aws.cloud2.influxdata.com/
						   --header \"Authorization: Token INFLUX_API_TOKEN\"`

						Replace *`INFLUX_API_TOKEN`* with your [InfluxDB API token]({{% INFLUXDB_DOCS_URL %}}/reference/glossary/#token).

						For more information and examples, see the following:
						  - [`/authorizations`](#tag/Authorizations) endpoint.
						  - [Authorize API requests]({{% INFLUXDB_DOCS_URL %}}/api-guide/api_intro/#authentication).
						  - [Manage API tokens]({{% INFLUXDB_DOCS_URL %}}/security/tokens).
						  - [Assign a token to a specific user]({{% INFLUXDB_DOCS_URL %}}/security/tokens/create-token).

						"""
			}

			BasicAuthentication: {
				type:
					"http", scheme:
					"basic", description:
					"""
						### Basic authentication scheme

						Use the HTTP Basic authentication scheme with clients that support the InfluxDB 1.x convention of username and password (that don't support the `Authorization: Token` scheme):
						  - **username**: InfluxDB Cloud username
						  - **password**: InfluxDB Cloud API token

						#### Example

						`curl --get \"https://europe-west1-1.gcp.cloud2.influxdata.com/query\"
						      --user \"exampleuser@influxdata.com\":\"INFLUX_API_TOKEN\"`

						Replace the following:
						- *`exampleuser@influxdata.com`*: the email address that you signed up with
						- *`INFLUX_API_TOKEN`*: your [InfluxDB API token]({{% INFLUXDB_DOCS_URL %}}/reference/glossary/#token)

						For more information and examples, see how to [authenticate with a username and password]({{% INFLUXDB_DOCS_URL %}}/reference/api/influxdb-1x/).

						"""
			}

			QuerystringAuthentication: {
				type:
					"apiKey", in:
					"query", name:
					"u=&p=", description:
					"""
						### Querystring authentication scheme

						Use InfluxDB 1.x API parameters to provide credentials through the query string.

						Username and password schemes require the following credentials:
						- **username**: InfluxDB Cloud username
						- **password**: InfluxDB Cloud API token

						#### Example

						`curl --get \"https://europe-west1-1.gcp.cloud2.influxdata.com/query\"
						      --data-urlencode \"u=exampleuser@influxdata.com\"
						      --data-urlencode \"p=INFLUX_API_TOKEN\"`

						Replace the following:
						- *`exampleuser@influxdata.com`*: the email address that you signed up with
						- *`INFLUX_API_TOKEN`*: your [InfluxDB API token]({{% INFLUXDB_DOCS_URL %}}/reference/glossary/#token)

						For more information and examples, see how to [authenticate with a username and password scheme]({{% INFLUXDB_DOCS_URL %}}/reference/api/influxdb-1x/).

						"""
			}
		}
	}

	security: [{
		TokenAuthentication: []
	}, {
		BasicAuthentication: []
	}, {
		QuerystringAuthentication: []
	}]
}
