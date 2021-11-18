package commonschemas

NotificationEndpointUpdate: {
	type: "object"
	properties: {
		name: type: "string"
		description: type: "string"
		status: {
			type: "string"
			enum: [
				"active",
				"inactive",
			]
		}
	}
}
