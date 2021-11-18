package paths

tasks_taskID: {
	get: {
		operationId: "GetTasksID"
		tags: [
			"Tasks",
		]
		summary: "Retrieve a task"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "taskID"
			schema: type: "string"
			required:    true
			description: "The task ID."
		}]
		responses: {
			"200": {
				description: "Task details"
				content: "application/json": schema: $ref: "../schemas/Task.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	patch: {
		operationId: "PatchTasksID"
		tags: [
			"Tasks",
		]
		summary:     "Update a task"
		description: "Update a task. This will cancel all queued runs."
		requestBody: {
			description: "Task update to apply"
			required:    true
			content: "application/json": schema: $ref: "../schemas/TaskUpdateRequest.yml"
		}
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "taskID"
			schema: type: "string"
			required:    true
			description: "The task ID."
		}]
		responses: {
			"200": {
				description: "Task updated"
				content: "application/json": schema: $ref: "../schemas/Task.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	delete: {
		operationId: "DeleteTasksID"
		tags: [
			"Tasks",
		]
		summary:     "Delete a task"
		description: "Deletes a task and all associated records"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "taskID"
			schema: type: "string"
			required:    true
			description: "The ID of the task to delete."
		}]
		responses: {
			"204": description: "Task deleted"
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
