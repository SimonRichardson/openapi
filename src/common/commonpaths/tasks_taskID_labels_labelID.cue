package commonpaths

tasks_taskID_labels_labelID: delete: {
	operationId: "DeleteTasksIDLabelsID"
	tags: [
		"Tasks",
	]
	summary: "Delete a label from a task"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "taskID"
		schema: type: "string"
		required:    true
		description: "The task ID."
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
			description: "Task not found"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
