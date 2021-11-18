package contracts

import "github.com/influxdata/openapi/src/common"

cloud: {
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
		$ref:         "./common/_quick-start.yml"
		"x-traitTag": true
	}, {
		name:         "Response codes"
		$ref:         "./common/_response-codes.yml"
		"x-traitTag": true
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
		common.#Paths
		"/users": $ref: "./cloud/paths/users.yml"
		"/users/{userID}": $ref: "./cloud/paths/users_userID.yml"
		"/setup": $ref: "./cloud/paths/setup.yml"
		"/setup/user": $ref: "./cloud/paths/setup_user.yml"
		"/authorizations": $ref: "./cloud/paths/authorizations.yml"
		"/experimental/sampledata/buckets": $ref: "./cloud/paths/experimental_sampledata_buckets.yml"
		"/experimental/sampledata/buckets/{bucketID}/members": $ref: "./cloud/paths/experimental_sampledata_buckets_members.yml"
		"/authorizations/{authID}": $ref: "./cloud/paths/authorizations_authID.yml"
		"/variables": $ref: "./cloud/paths/variables.yml"
		"/variables/{variableID}": $ref: "./cloud/paths/variables_variableID.yml"
		"/buckets/{bucketID}/schema/measurements": $ref: "./cloud/paths/measurements.yml"
		"/buckets/{bucketID}/schema/measurements/{measurementID}": $ref: "./cloud/paths/measurements_measurementID.yml"
		"/orgs/{orgID}/limits": $ref: "./cloud/paths/orgs_orgID_limits_get.yml"
		"/orgs/{orgID}/usage": $ref: "./cloud/paths/orgs_orgID_usage.yml"
		"/dashboards": $ref: "./cloud/paths/dashboards.yml"
		"/tasks": $ref: "./cloud/paths/tasks.yml"
		"/write": $ref: "./cloud/paths/write.yml"
	}
	components: {
		parameters: common.#Parameters
		schemas: {
			common.#Schemas
			DemoDataBucket: $ref: "./cloud/schemas/DemoDataBucket.yml"
			DemoDataBuckets: $ref: "./cloud/schemas/DemoDataBuckets.yml"
			Resource: $ref: "./cloud/schemas/Resource.yml"
			Permission: $ref: "./cloud/schemas/Permission.yml"
			Authorization: $ref: "./cloud/schemas/Authorization.yml"
			Authorizations: $ref: "./cloud/schemas/Authorizations.yml"
			User: $ref: "./cloud/schemas/User.yml"
			Users: $ref: "./cloud/schemas/Users.yml"
			OnboardingRequest: $ref: "./cloud/schemas/OnboardingRequest.yml"
			OnboardingResponse: $ref: "./cloud/schemas/OnboardingResponse.yml"
			Limit: $ref: "./cloud/schemas/Limit.yml"
			Variable: $ref: "./cloud/schemas/Variable.yml"
			Variables: $ref: "./cloud/schemas/Variables.yml"
			ColumnDataType: $ref: "./cloud/schemas/ColumnDataType.yml"
			ColumnSemanticType: $ref: "./cloud/schemas/ColumnSemanticType.yml"
			MeasurementSchema: $ref: "./cloud/schemas/MeasurementSchema.yml"
			MeasurementSchemaColumn: $ref: "./cloud/schemas/MeasurementSchemaColumn.yml"
			MeasurementSchemaCreateRequest: $ref: "./cloud/schemas/MeasurementSchemaCreateRequest.yml"
			MeasurementSchemaList: $ref: "./cloud/schemas/MeasurementSchemaList.yml"
			MeasurementSchemaUpdateRequest: $ref: "./cloud/schemas/MeasurementSchemaUpdateRequest.yml"
		}
		responses: ServerError: $ref: "./common/responses/ServerError.yml"
		securitySchemes: {
			TokenAuthentication: {
				type:         "http"
				scheme:       "token"
				bearerFormat: "InfluxDB token string"
				description: """
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
				type:   "http"
				scheme: "basic"
				description: """
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
				type: "apiKey"
				in:   "query"
				name: "u=&p="
				description: """
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
