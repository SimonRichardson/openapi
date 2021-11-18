package commonschemas

SlackNotificationEndpoint: {
	type: "object"
	allOf: [{
		$ref: "./NotificationEndpointBase.yml"
	}, {
		type: "object"
		properties: {
			url: {
				description: "Specifies the URL of the Slack endpoint. Specify either `URL` or `Token`."
				type:        "string"
			}
			token: {
				description: "Specifies the API token string. Specify either `URL` or `Token`."
				type:        "string"
			}
		}
	}]
}
