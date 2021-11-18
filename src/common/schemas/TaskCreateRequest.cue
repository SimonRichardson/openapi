package schemas

TaskCreateRequest: {
	type: "object"
	properties: {
		orgID: {
			description: "The ID of the organization that owns this Task."
			type:        "string"
		}
		org: {
			description: "The name of the organization that owns this Task."
			type:        "string"
		}
		status: $ref: "./TaskStatusType.yml"
		flux: {
			description: "The Flux script to run for this task."
			type:        "string"
		}
		description: {
			description: "An optional description of the task."
			type:        "string"
		}
	}
	required: ["flux"]
}
