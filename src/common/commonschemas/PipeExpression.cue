package commonschemas

PipeExpression: {
	description: "Call expression with pipe argument"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		argument: $ref: "./Expression.yml"
		call: $ref: "./CallExpression.yml"
	}
}
