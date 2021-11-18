package schemas

Role: {
	type:        "string"
	description: "Role of the User"
	enum: [
		"owner",
		"member",
	]
}
