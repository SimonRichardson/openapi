package paths

checks_checkID_labels: {
	get: {
		operationId: "GetChecksIDLabels"
		tags: [
			"Checks",
		]
		summary: "List all labels for a check"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "checkID"
			schema: type: "string"
			required:    true
			description: "The check ID."
		}]
		responses: {
			"200": {
				description: "A list of all labels for a check"
				content: "application/json": schema: $ref: "../schemas/LabelsResponse.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	post: {
		operationId: "PostChecksIDLabels"
		tags: [
			"Checks",
		]
		summary: "Add a label to a check"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "checkID"
			schema: type: "string"
			required:    true
			description: "The check ID."
		}]
		requestBody: {
			description: "Label to add"
			required:    true
			content: "application/json": schema: $ref: "../schemas/LabelMapping.yml"
		}
		responses: {
			"201": {
				description: "The label was added to the check"
				content: "application/json": schema: $ref: "../schemas/LabelResponse.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
