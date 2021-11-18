package commonschemas

LanguageRequest: {
	description: "Flux query to be analyzed."
	type:        "object"
	required: [
		"query",
	]
	properties: query: {
		description: "Flux query script to be analyzed"
		type:        "string"
	}
}
