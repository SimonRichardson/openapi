package commonschemas

ASTResponse: {
	description: "Contains the AST for the supplied Flux query"
	type:        "object"
	properties: ast: $ref: "./Package.yml"
}
