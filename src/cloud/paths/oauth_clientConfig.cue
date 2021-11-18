package paths

oauth_clientConfig: get: {
	tags: [
		"OAuth",
	]
	summary: "Retrieve required OAuth client variables"
	parameters: [{
		in:   "query"
		name: "redirectTo"
		schema: type: "string"
		description: "optional parameter to redirect the user to after a successful login."
		required:    false
	}]
	responses: {
		"200": {
			description: "Required OAuth client variables"
			content: "application/json": schema: $ref: "../schemas/OAuthClientConfig.yml"
		}
		default: {
			description: "unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
