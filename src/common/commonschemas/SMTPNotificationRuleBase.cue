package commonschemas

SMTPNotificationRuleBase: {
	type: "object"
	required: ["type", "subjectTemplate", "to"]
	properties: {
		type: {
			type: "string"
			enum: ["smtp"]
		}
		subjectTemplate: type: "string"
		bodyTemplate: type: "string"
		to: type: "string"
	}
}
