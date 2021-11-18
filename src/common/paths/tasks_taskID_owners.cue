package paths

tasks_taskID_owners: {
	get: {
		operationId: "GetTasksIDOwners"
		tags: [
			"Tasks",
		]
		summary: "List all owners of a task"
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
				description: "A list of users who have owner privileges for a task"
				content: "application/json": schema: $ref: "../schemas/ResourceOwners.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	post: {
		operationId: "PostTasksIDOwners"
		tags: [
			"Tasks",
		]
		summary: "Add an owner to a task"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "taskID"
			schema: type: "string"
			required:    true
			description: "The task ID."
		}]
		requestBody: {
			description: "User to add as owner"
			required:    true
			content: "application/json": schema: $ref: "../schemas/AddResourceMemberRequestBody.yml"
		}
		responses: {
			"201": {
				description: "Added to task owners"
				content: "application/json": schema: $ref: "../schemas/ResourceOwner.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
