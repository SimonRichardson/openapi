package paths

flags: get: {
	operationId: "GetFlags"
	tags: [
		"Users",
	]
	summary: "Return the feature flags for the currently authenticated user"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}]
	responses: {
		"200": {
			description: "Feature flags for the currently authenticated user"
			content: "application/json": schema: $ref: "../schemas/Flags.yml"
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
