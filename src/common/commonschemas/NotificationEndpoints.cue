package commonschemas

NotificationEndpoints: properties: {
	notificationEndpoints: {
		type: "array"
		items: $ref: "./NotificationEndpoint.yml"
	}
	links: $ref: "./Links.yml"
}
