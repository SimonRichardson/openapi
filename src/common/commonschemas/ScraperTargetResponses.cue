package commonschemas

ScraperTargetResponses: {
	type: "object"
	properties: configurations: {
		type: "array"
		items: $ref: "./ScraperTargetResponse.yml"
	}
}
