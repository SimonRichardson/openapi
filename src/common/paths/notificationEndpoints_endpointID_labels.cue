package paths

notificationEndpoints_endpointID_labels: {
	get: {
		operationId: "GetNotificationEndpointsIDLabels"
		tags: [
			"NotificationEndpoints",
		]
		summary: "List all labels for a notification endpoint"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "endpointID"
			schema: type: "string"
			required:    true
			description: "The notification endpoint ID."
		}]
		responses: {
			"200": {
				description: "A list of all labels for a notification endpoint"
				content: "application/json": schema: $ref: "../schemas/LabelsResponse.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	post: {
		operationId: "PostNotificationEndpointIDLabels"
		tags: [
			"NotificationEndpoints",
		]
		summary: "Add a label to a notification endpoint"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "endpointID"
			schema: type: "string"
			required:    true
			description: "The notification endpoint ID."
		}]
		requestBody: {
			description: "Label to add"
			required:    true
			content: "application/json": schema: $ref: "../schemas/LabelMapping.yml"
		}
		responses: {
			"201": {
				description: "The label was added to the notification endpoint"
				content: "application/json": schema: $ref: "../schemas/LabelResponse.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
