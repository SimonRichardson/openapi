package paths

checks_checkID_labels_labelID: delete: {
	operationId: "DeleteChecksIDLabelsID"
	tags: [
		"Checks",
	]
	summary: "Delete label from a check"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "checkID"
		schema: type: "string"
		required:    true
		description: "The check ID."
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
			description: "Check or label not found"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
