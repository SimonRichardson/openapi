package paths

"0slash": get: {
	operationId: "GetRoutes"
	summary:     "List all top level routes"
	tags: [
		"Routes",
	]
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}]
	responses: default: {
		description: "All routes"
		content: "application/json": schema: $ref: "../schemas/Routes.yml"
	}
}
