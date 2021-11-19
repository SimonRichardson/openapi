package commonschemas

User: {
	properties: {
		id: {
			readOnly: true
			type:     "string"
		}
		oauthID: type: "string"
		name: type:    "string"
		status: {
			description: "If inactive the user is inactive."
			default:     "active"
			type:        "string"
			enum: [
				"active",
				"inactive",
			]
		}
	}
	required: ["name"]
}
