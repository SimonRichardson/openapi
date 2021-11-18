package schemas

FunctionExpression: {
	description: "Function expression"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		params: {
			description: "Function parameters"
			type:        "array"
			items: $ref: "./Property.yml"
		}
		body: $ref: "./Node.yml"
	}
}
