package paths

authorizations: {
	get: {
		operationId: "GetAuthorizations"
		tags: [
			"Authorizations",
		]
		summary: "List all authorizations"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
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
		}]
		responses: {
			"200": {
				description: "A list of authorizations"
				content: "application/json": schema: $ref: "../../common/schemas/Authorizations.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
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
			$ref: "../../common/parameters/TraceSpan.yml"
		}]
		requestBody: {
			description: "Authorization to create"
			required:    true
			content: "application/json": schema: $ref: "../../common/schemas/AuthorizationPostRequest.yml"
		}
		responses: {
			"201": {
				description: "Authorization created"
				content: "application/json": schema: $ref: "../../common/schemas/Authorization.yml"
			}
			"400": {
				description: "Invalid request"
				$ref:        "../../common/responses/ServerError.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
