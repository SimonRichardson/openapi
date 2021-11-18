package commonschemas

UnaryExpression: {
	description: "Uses operators to act on a single operand in an expression"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		operator: type: "string"
		argument: $ref: "./Expression.yml"
	}
}
