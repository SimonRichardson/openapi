package schemas

LogicalExpression: {
	description: "Represents the rule conditions that collectively evaluate to either true or false"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		operator: type: "string"
		left: $ref: "./Expression.yml"
		right: $ref: "./Expression.yml"
	}
}
