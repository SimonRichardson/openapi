package schemas

PostOrganizationRequest: {
	type: "object"
	properties: {
		name: type: "string"
		description: type: "string"
	}
	required: ["name"]
}
