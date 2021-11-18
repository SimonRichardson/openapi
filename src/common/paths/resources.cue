package paths

resources: get: {
	operationId: "GetResources"
	tags: [
		"Resources",
	]
	summary: "List all known resources"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}]
	responses: {
		"200": {
			description: "All resources targets"
			content: "application/json": schema: $ref: "../schemas/Resources.yml"
		}
		default: {
			description: "Internal server error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
