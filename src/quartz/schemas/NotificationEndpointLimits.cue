package schemas

NotificationEndpointLimits: {
	description: "Notification endpoint limits"
	type:        "object"
	properties: blockedNotificationEndpoints: {
		description: "Notification endpoints not allowed CSV"
		example:     "http,pagerduty"
		type:        "string"
	}
}
