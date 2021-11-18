package commonschemas

DictExpression: {
	description: "Used to create and directly specify the elements of a dictionary"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		elements: {
			description: "Elements of the dictionary"
			type:        "array"
			items: $ref: "./DictItem.yml"
		}
	}
}
