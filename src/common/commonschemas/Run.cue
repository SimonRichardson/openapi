package commonschemas

Run: properties: {
	id: {
		readOnly: true
		type:     "string"
	}
	taskID: {
		readOnly: true
		type:     "string"
	}
	status: {
		readOnly: true
		type:     "string"
		enum: [
			"scheduled",
			"started",
			"failed",
			"success",
			"canceled",
		]
	}
	scheduledFor: {
		description: "Time used for run's \"now\" option, RFC3339."
		type:        "string"
		format:      "date-time"
	}
	log: {
		description: "An array of logs associated with the run."
		type:        "array"
		readOnly:    true
		items:       LogEvent.#Ref
	}
	startedAt: {
		readOnly:    true
		description: "Time run started executing, RFC3339Nano."
		type:        "string"
		format:      "date-time"
	}
	finishedAt: {
		readOnly:    true
		description: "Time run finished executing, RFC3339Nano."
		type:        "string"
		format:      "date-time"
	}
	requestedAt: {
		readOnly:    true
		description: "Time run was manually requested, RFC3339Nano."
		type:        "string"
		format:      "date-time"
	}
	links: {
		type:     "object"
		readOnly: true
		example: {
			self:  "/api/v2/tasks/1/runs/1"
			task:  "/api/v2/tasks/1"
			retry: "/api/v2/tasks/1/runs/1/retry"
		}
		properties: {
			self: {
				type:   "string"
				format: "uri"
			}
			task: {
				type:   "string"
				format: "uri"
			}
			retry: {
				type:   "string"
				format: "uri"
			}
		}
	}
}
