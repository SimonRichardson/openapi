package paths

notificationRules_ruleID_query: get: {
	operationId: "GetNotificationRulesIDQuery"
	tags: [
		"Rules",
	]
	summary: "Retrieve a notification rule query"
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
			description: "The notification rule query requested"
			content: "application/json": schema: $ref: "../schemas/FluxResponse.yml"
		}
		"400": {
			description: "Invalid request"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
		"404": {
			description: "Notification rule not found"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
