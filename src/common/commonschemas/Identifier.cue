package commonschemas

Identifier: {
	description: "A valid Flux identifier"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		name: type: "string"
	}
}
