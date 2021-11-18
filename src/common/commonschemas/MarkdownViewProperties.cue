package commonschemas

MarkdownViewProperties: {
	type: "object"
	required: [
		"type",
		"shape",
		"note",
	]
	properties: {
		type: {
			type: "string"
			enum: ["markdown"]
		}
		shape: {
			type: "string"
			enum: ["chronograf-v2"]
		}
		note: type: "string"
	}
}
