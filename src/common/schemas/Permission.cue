package schemas

Permission: {
	required: ["action", "resource"]
	properties: {
		action: {
			type: "string"
			enum: [
				"read",
				"write",
			]
		}
		resource: $ref: "./Resource.yml"
	}
}
