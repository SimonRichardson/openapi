package schemas

CreateDashboardRequest: {
	properties: {
		orgID: {
			type:        "string"
			description: "The ID of the organization that owns the dashboard."
		}
		name: {
			type:        "string"
			description: "The user-facing name of the dashboard."
		}
		description: {
			type:        "string"
			description: "The user-facing description of the dashboard."
		}
	}
	required: [
		"orgID",
		"name",
	]
}
