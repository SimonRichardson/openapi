package commonschemas

BooleanLiteral: {
	description: "Represents boolean values"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		value: type: "boolean"
	}
}
