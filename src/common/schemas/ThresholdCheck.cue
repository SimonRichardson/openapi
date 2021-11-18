package schemas

ThresholdCheck: allOf: [{
	$ref: "./CheckBase.yml"
}, {
	type: "object"
	required: ["type"]
	properties: {
		type: {
			type: "string"
			enum: ["threshold"]
		}
		thresholds: {
			type: "array"
			items: $ref: "./Threshold.yml"
		}
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
					key: type: "string"
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
