package commonschemas

ReturnStatement: {
	description: "Defines an expression to return"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		argument: $ref: "./Expression.yml"
	}
}
