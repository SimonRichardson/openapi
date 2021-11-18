package schemas

Property: {
	description: "The value associated with a key"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		key: $ref: "./PropertyKey.yml"
		value: $ref: "./Expression.yml"
	}
}
