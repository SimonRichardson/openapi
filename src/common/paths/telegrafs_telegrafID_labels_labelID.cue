package paths

telegrafs_telegrafID_labels_labelID: delete: {
	operationId: "DeleteTelegrafsIDLabelsID"
	tags: [
		"Telegrafs",
	]
	summary: "Delete a label from a Telegraf config"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "telegrafID"
		schema: type: "string"
		required:    true
		description: "The Telegraf config ID."
	}, {
		in:   "path"
		name: "labelID"
		schema: type: "string"
		required:    true
		description: "The label ID."
	}]
	responses: {
		"204": description: "Delete has been accepted"
		"404": {
			description: "Telegraf config not found"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
