package schemas

LogEvent: {
	type: "object"
	properties: {
		time: {
			readOnly:    true
			description: "Time event occurred, RFC3339Nano."
			type:        "string"
			format:      "date-time"
		}
		message: {
			readOnly:    true
			description: "A description of the event that occurred."
			type:        "string"
			example:     "Halt and catch fire"
		}
		runID: {
			readOnly:    true
			description: "the ID of the task that logged"
			type:        "string"
		}
	}
}
