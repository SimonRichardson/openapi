package schemas

PagerDutyNotificationEndpoint: {
	type: "object"
	allOf: [{
		$ref: "./NotificationEndpointBase.yml"
	}, {
		type: "object"
		required: ["routingKey"]
		properties: {
			clientURL: type: "string"
			routingKey: type: "string"
		}
	}]
}
