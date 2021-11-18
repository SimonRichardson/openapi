package schemas

HTTPNotificationRuleBase: {
	type: "object"
	required: ["type"]
	properties: {
		type: {
			type: "string"
			enum: ["http"]
		}
		url: type: "string"
	}
}
