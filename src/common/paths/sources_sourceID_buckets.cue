package paths

sources_sourceID_buckets: get: {
	operationId: "GetSourcesIDBuckets"
	tags: [
		"Sources",
		"Buckets",
	]
	summary: "Get buckets in a source"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "sourceID"
		schema: type: "string"
		required:    true
		description: "The source ID."
	}, {
		in:          "query"
		name:        "org"
		description: "The name of the organization."
		schema: type: "string"
	}]
	responses: {
		"200": {
			description: "A source"
			content: "application/json": schema: $ref: "../schemas/Buckets.yml"
		}
		"404": {
			description: "Source not found"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
