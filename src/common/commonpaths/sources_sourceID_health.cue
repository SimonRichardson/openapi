package commonpaths

sources_sourceID_health: get: {
	operationId: "GetSourcesIDHealth"
	tags: [
		"Sources",
	]
	summary: "Get the health of a source"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "sourceID"
		schema: type: "string"
		required:    true
		description: "The source ID."
	}]
	responses: {
		"200": {
			description: "The source is healthy"
			content: "application/json": schema: $ref: "../schemas/HealthCheck.yml"
		}
		"503": {
			description: "The source is not healthy"
			content: "application/json": schema: $ref: "../schemas/HealthCheck.yml"
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
