package commonschemas

FluxSuggestion: {
	type: "object"
	properties: {
		name: type: "string"
		params: {
			type: "object"
			additionalProperties: type: "string"
		}
	}
}
