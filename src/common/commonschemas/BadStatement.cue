package commonschemas

BadStatement: {
	description: "A placeholder for statements for which no correct statement nodes can be created"
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		text: {
			description: "Raw source text"
			type:        "string"
		}
	}
}
