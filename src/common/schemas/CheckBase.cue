package schemas

CheckBase: {
	properties: {
		id: {
			readOnly: true
			type:     "string"
		}
		name: type: "string"
		orgID: {
			description: "The ID of the organization that owns this check."
			type:        "string"
		}
		taskID: {
			description: "The ID of the task associated with this check."
			type:        "string"
		}
		ownerID: {
			description: "The ID of creator used to create this check."
			type:        "string"
			readOnly:    true
		}
		createdAt: {
			type:     "string"
			format:   "date-time"
			readOnly: true
		}
		updatedAt: {
			type:     "string"
			format:   "date-time"
			readOnly: true
		}
		query: $ref: "./DashboardQuery.yml"
		status: $ref: "./TaskStatusType.yml"
		description: {
			description: "An optional description of the check."
			type:        "string"
		}
		latestCompleted: {
			description: "Timestamp of latest scheduled, completed run, RFC3339."
			type:        "string"
			format:      "date-time"
			readOnly:    true
		}
		lastRunStatus: {
			readOnly: true
			type:     "string"
			enum: [
				"failed",
				"success",
				"canceled",
			]
		}
		lastRunError: {
			readOnly: true
			type:     "string"
		}
		labels: $ref: "./Labels.yml"
		links: {
			type:     "object"
			readOnly: true
			example: {
				self:    "/api/v2/checks/1"
				labels:  "/api/v2/checks/1/labels"
				members: "/api/v2/checks/1/members"
				owners:  "/api/v2/checks/1/owners"
				query:   "/api/v2/checks/1/query"
			}
			properties: {
				self: {
					description: "URL for this check"
					$ref:        "./Link.yml"
				}
				labels: {
					description: "URL to retrieve labels for this check"
					$ref:        "./Link.yml"
				}
				members: {
					description: "URL to retrieve members for this check"
					$ref:        "./Link.yml"
				}
				owners: {
					description: "URL to retrieve owners for this check"
					$ref:        "./Link.yml"
				}
				query: {
					description: "URL to retrieve flux script for this check"
					$ref:        "./Link.yml"
				}
			}
		}
	}
	required: ["name", "orgID", "query"]
}
