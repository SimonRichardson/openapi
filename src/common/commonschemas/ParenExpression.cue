package commonschemas

ParenExpression: {
	description: "Represents an expression wrapped in parenthesis"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		expression: $ref: "./Expression.yml"
	}
}
