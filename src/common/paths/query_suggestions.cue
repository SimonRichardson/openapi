package paths

query_suggestions: get: {
	operationId: "GetQuerySuggestions"
	tags: [
		"Query",
	]
	summary: "Retrieve query suggestions"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}]
	responses: {
		"200": {
			description: "Suggestions for next functions in call chain"
			content: "application/json": schema: $ref: "../schemas/FluxSuggestions.yml"
		}
		default: {
			description: "Any response other than 200 is an internal server error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
