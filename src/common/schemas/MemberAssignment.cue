package schemas

MemberAssignment: {
	description: "Object property assignment"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		member: $ref: "./MemberExpression.yml"
		init: $ref: "./Expression.yml"
	}
}
