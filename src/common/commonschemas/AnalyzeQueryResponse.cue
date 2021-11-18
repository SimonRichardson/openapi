package commonschemas

AnalyzeQueryResponse: {
	type: "object"
	properties: errors: {
		type: "array"
		items: {
			type: "object"
			properties: {
				line: type: "integer"
				column: type: "integer"
				character: type: "integer"
				message: type: "string"
			}
		}
	}
}
