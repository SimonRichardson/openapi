package commonschemas

HTTPNotificationEndpoint: {
	type: "object"
	allOf: [{
		$ref: "./NotificationEndpointBase.yml"
	}, {
		type: "object"
		required: ["url", "authMethod", "method"]
		properties: {
			url: type: "string"
			username: type: "string"
			password: type: "string"
			token: type: "string"
			method: {
				type: "string"
				enum: ["POST", "GET", "PUT"]
			}
			authMethod: {
				type: "string"
				enum: ["none", "basic", "bearer"]
			}
			contentTemplate: type: "string"
			headers: {
				type:        "object"
				description: "Customized headers."
				additionalProperties: type: "string"
			}
		}
	}]
}
