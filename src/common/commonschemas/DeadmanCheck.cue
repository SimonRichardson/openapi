package commonschemas

DeadmanCheck: allOf: [{
	CheckBase.#Ref
}, {
	type: "object"
	required: ["type"]
	properties: {
		type: {
			type: "string"
			enum: ["deadman"]
		}
		timeSince: {
			description: "String duration before deadman triggers."
			type:        "string"
		}
		staleTime: {
			description: "String duration for time that a series is considered stale and should not trigger deadman."
			type:        "string"
		}
		reportZero: {
			description: "If only zero values reported since time, trigger an alert"
			type:        "boolean"
		}
		level: CheckStatusLevel.#Ref
		every: {
			description: "Check repetition interval."
			type:        "string"
		}
		offset: {
			description: "Duration to delay after the schedule, before executing check."
			type:        "string"
		}
		tags: {
			description: "List of tags to write to each status."
			type:        "array"
			items: {
				type: "object"
				properties: {
					key: type:   "string"
					value: type: "string"
				}
			}
		}
		statusMessageTemplate: {
			description: "The template used to generate and write a status message."
			type:        "string"
		}
	}
}]
