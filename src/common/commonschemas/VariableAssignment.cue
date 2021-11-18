package commonschemas

VariableAssignment: {
	description: "Represents the declaration of a variable"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		id: $ref: "./Identifier.yml"
		init: $ref: "./Expression.yml"
	}
}
