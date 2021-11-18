package paths

query_analyze: post: {
	operationId: "PostQueryAnalyze"
	tags: [
		"Query",
	]
	summary: "Analyze a Flux query"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}, {
		in:   "header"
		name: "Content-Type"
		schema: {
			type: "string"
			enum: [
				"application/json",
			]
		}
	}]
	requestBody: {
		description: "Flux query to analyze"
		content: "application/json": schema: $ref: "../schemas/Query.yml"
	}
	responses: {
		"200": {
			description: "Query analyze results. Errors will be empty if the query is valid."
			content: "application/json": schema: $ref: "../schemas/AnalyzeQueryResponse.yml"
		}
		default: {
			description: "Internal server error"
			headers: {
				"X-Influx-Error": {
					description: "Error string describing the problem"
					schema: type: "string"
				}
				"X-Influx-Reference": {
					description: "Reference code unique to the error type"
					schema: type: "integer"
				}
			}
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
