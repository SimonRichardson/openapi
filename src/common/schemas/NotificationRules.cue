package schemas

NotificationRules: properties: {
	notificationRules: {
		type: "array"
		items: $ref: "./NotificationRule.yml"
	}
	links: $ref: "./Links.yml"
}
