package schemas

StringLiteral: {
	description: "Expressions begin and end with double quote marks"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		value: type: "string"
	}
}
