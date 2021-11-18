package paths

tasks_taskID_runs_runID_retry: post: {
	operationId: "PostTasksIDRunsIDRetry"
	tags: [
		"Tasks",
	]
	summary: "Retry a task run"
	requestBody: content: "application/json; charset=utf-8": schema: type: "object"
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
		name: "runID"
		schema: type: "string"
		required:    true
		description: "The run ID."
	}]
	responses: {
		"200": {
			description: "Run that has been queued"
			content: "application/json": schema: $ref: "../schemas/Run.yml"
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
