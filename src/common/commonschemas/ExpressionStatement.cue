package commonschemas

ExpressionStatement: {
	description: "May consist of an expression that does not return a value and is executed solely for its side-effects"
	type:        "object"
	properties: {
		type:       NodeType.#Ref
		expression: Expression.#Ref
	}
}
