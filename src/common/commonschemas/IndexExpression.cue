package commonschemas

IndexExpression: {
	description: "Represents indexing into an array"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		array: $ref: "./Expression.yml"
		index: $ref: "./Expression.yml"
	}
}
