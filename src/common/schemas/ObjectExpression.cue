package schemas

ObjectExpression: {
	description: "Allows the declaration of an anonymous object within a declaration"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		properties: {
			description: "Object properties"
			type:        "array"
			items: $ref: "./Property.yml"
		}
	}
}
