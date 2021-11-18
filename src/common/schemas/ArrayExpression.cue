package schemas

ArrayExpression: {
	description: "Used to create and directly specify the elements of an array object"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		elements: {
			description: "Elements of the array"
			type:        "array"
			items: $ref: "./Expression.yml"
		}
	}
}
