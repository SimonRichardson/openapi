package schemas

AddResourceMemberRequestBody: {
	type: "object"
	properties: {
		id: type: "string"
		name: type: "string"
	}
	required: ["id"]
}
