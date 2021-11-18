package paths

sso: get: {
	operationId: "GetConnection"
	tags: [
		"Connection",
	]
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
	}, {
		in:   "query"
		name: "email"
		schema: {
			type:   "string"
			format: "email"
		}
		required:    true
		description: "The email to get connection for."
	}]
	responses: {
		"200": {
			content: "application/json": schema: {
				type:    "string"
				example: "connection"
			}
			description: "Connection name as string"
		}
		"204": description: "No connection for the specified email"
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
	summary: "Get connection  for the specified email"
}
