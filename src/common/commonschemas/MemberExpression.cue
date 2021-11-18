package commonschemas

MemberExpression: {
	description: "Represents accessing a property of an object"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		object: $ref: "./Expression.yml"
		property: $ref: "./PropertyKey.yml"
	}
}
