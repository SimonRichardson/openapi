package schemas

SlackNotificationRuleBase: {
	type: "object"
	required: ["type", "messageTemplate"]
	properties: {
		type: {
			type: "string"
			enum: ["slack"]
		}
		channel: type: "string"
		messageTemplate: type: "string"
	}
}
