package schemas

Block: {
	description: "A set of statements"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		body: {
			description: "Block body"
			type:        "array"
			items: $ref: "./Statement.yml"
		}
	}
}
