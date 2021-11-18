package paths

notificationRules_ruleID_labels_labelID: delete: {
	operationId: "DeleteNotificationRulesIDLabelsID"
	tags: [
		"NotificationRules",
	]
	summary: "Delete label from a notification rule"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "ruleID"
		schema: type: "string"
		required:    true
		description: "The notification rule ID."
	}, {
		in:   "path"
		name: "labelID"
		schema: type: "string"
		required:    true
		description: "The ID of the label to delete."
	}]
	responses: {
		"204": description: "Delete has been accepted"
		"404": {
			description: "Rule or label not found"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
