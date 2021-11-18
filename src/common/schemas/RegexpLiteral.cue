package schemas

RegexpLiteral: {
	description: "Expressions begin and end with `/` and are regular expressions with syntax accepted by RE2"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		value: type: "string"
	}
}
