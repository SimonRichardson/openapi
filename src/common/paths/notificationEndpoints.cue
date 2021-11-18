package paths

notificationEndpoints: {
	get: {
		operationId: "GetNotificationEndpoints"
		tags: [
			"NotificationEndpoints",
		]
		summary: "List all notification endpoints"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			$ref: "../parameters/Offset.yml"
		}, {
			$ref: "../parameters/Limit.yml"
		}, {
			in:          "query"
			name:        "orgID"
			required:    true
			description: "Only show notification endpoints that belong to specific organization ID."
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A list of notification endpoints"
				content: "application/json": schema: $ref: "../schemas/NotificationEndpoints.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	post: {
		operationId: "CreateNotificationEndpoint"
		tags: [
			"NotificationEndpoints",
		]
		summary: "Add a notification endpoint"
		requestBody: {
			description: "Notification endpoint to create"
			required:    true
			content: "application/json": schema: $ref: "../schemas/PostNotificationEndpoint.yml"
		}
		responses: {
			"201": {
				description: "Notification endpoint created"
				content: "application/json": schema: $ref: "../schemas/NotificationEndpoint.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
