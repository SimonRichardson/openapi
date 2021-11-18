package schemas

CallExpression: {
	description: "Represents a function call"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		callee: $ref: "./Expression.yml"
		arguments: {
			description: "Function arguments"
			type:        "array"
			items: $ref: "./Expression.yml"
		}
	}
}
