package schemas

File: {
	description: "Represents a source from a single file"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		name: {
			description: "The name of the file."
			type:        "string"
		}
		package: $ref: "./PackageClause.yml"
		imports: {
			description: "A list of package imports"
			type:        "array"
			items: $ref: "./ImportDeclaration.yml"
		}
		body: {
			description: "List of Flux statements"
			type:        "array"
			items: $ref: "./Statement.yml"
		}
	}
}
