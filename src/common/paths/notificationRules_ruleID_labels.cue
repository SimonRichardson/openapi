package paths

notificationRules_ruleID_labels: {
	get: {
		operationId: "GetNotificationRulesIDLabels"
		tags: [
			"NotificationRules",
		]
		summary: "List all labels for a notification rule"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "ruleID"
			schema: type: "string"
			required:    true
			description: "The notification rule ID."
		}]
		responses: {
			"200": {
				description: "A list of all labels for a notification rule"
				content: "application/json": schema: $ref: "../schemas/LabelsResponse.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	post: {
		operationId: "PostNotificationRuleIDLabels"
		tags: [
			"NotificationRules",
		]
		summary: "Add a label to a notification rule"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "ruleID"
			schema: type: "string"
			required:    true
			description: "The notification rule ID."
		}]
		requestBody: {
			description: "Label to add"
			required:    true
			content: "application/json": schema: $ref: "../schemas/LabelMapping.yml"
		}
		responses: {
			"201": {
				description: "The label was added to the notification rule"
				content: "application/json": schema: $ref: "../schemas/LabelResponse.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
