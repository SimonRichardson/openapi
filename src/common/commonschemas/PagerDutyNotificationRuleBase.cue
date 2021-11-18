package commonschemas

PagerDutyNotificationRuleBase: {
	type: "object"
	required: ["type", "messageTemplate"]
	properties: {
		type: {
			type: "string"
			enum: ["pagerduty"]
		}
		messageTemplate: type: "string"
	}
}
