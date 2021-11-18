package paths

orgs_orgId_limits: {
	get: {
		operationId: "GetOrgsIdLimits"
		tags: [
			"Organizations",
			"Operators",
		]
		summary: "Get the limits of an organization"
		parameters: [{
			in:   "path"
			name: "orgId"
			schema: type: "string"
			required:    true
			description: "The ID of the organization"
		}]
		responses: {
			"200": {
				description: "Organization limits"
				content: "application/json": schema: $ref: "../../quartz/schemas/OrgLimits.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	put: {
		operationId: "PutOrgsIdLimits"
		tags: [
			"Organizations",
			"Operators",
		]
		summary: "Update the limits of an organization"
		requestBody: content: "application/json; charset=utf-8": schema: type: "object"
		parameters: [{
			in:   "path"
			name: "orgId"
			schema: type: "string"
			required:    true
			description: "The ID of the organization"
		}]
		responses: {
			"200": {
				description: "Organization limits"
				content: "application/json": schema: $ref: "../../quartz/schemas/OrgLimits.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
