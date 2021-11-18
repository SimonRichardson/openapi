package schemas

TemplateKind: {
	type: "string"
	enum: [
		"Bucket",
		"Check",
		"CheckDeadman",
		"CheckThreshold",
		"Dashboard",
		"Label",
		"NotificationEndpoint",
		"NotificationEndpointHTTP",
		"NotificationEndpointPagerDuty",
		"NotificationEndpointSlack",
		"NotificationRule",
		"Task",
		"Telegraf",
		"Variable",
	]
}
