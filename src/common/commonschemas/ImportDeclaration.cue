package commonschemas

ImportDeclaration: {
	description: "Declares a package import"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		as: $ref: "./Identifier.yml"
		path: $ref: "./StringLiteral.yml"
	}
}
