package commonschemas

BuiltinStatement: {
	description: "Declares a builtin identifier and its type"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		id: $ref: "./Identifier.yml"
	}
}
