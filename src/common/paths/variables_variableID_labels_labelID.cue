package paths

variables_variableID_labels_labelID: delete: {
	operationId: "DeleteVariablesIDLabelsID"
	tags: [
		"Variables",
	]
	summary: "Delete a label from a variable"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "variableID"
		schema: type: "string"
		required:    true
		description: "The variable ID."
	}, {
		in:   "path"
		name: "labelID"
		schema: type: "string"
		required:    true
		description: "The label ID to delete."
	}]
	responses: {
		"204": description: "Delete has been accepted"
		"404": {
			description: "Variable not found"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
