package paths

operator_orgs_orgId_limits: {
	get: {
		operationId: "GetOrganizationLimitsById"
		tags: [
			"Organizations",
			"Operators",
		]
		summary: "Get the org's limits"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "orgId"
			schema: type: "string"
			required:    true
			description: "The IDPE id of the org"
		}]
		responses: {
			"200": {
				description: "Organization Limits"
				content: "application/json": schema: $ref: "../../quartz/schemas/OrgLimits.yml"
			}
			"401": {
				description: "Unauthorized"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"404": {
				description: "Org not found"
				$ref:        "../../common/responses/ServerError.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	put: {
		operationId: "UpdateOrganizationLimitsById"
		tags: [
			"Organizations",
			"Operators",
		]
		summary: "Update the org's limits"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "orgId"
			schema: type: "string"
			required:    true
			description: "The IDPE id of the org"
		}]
		requestBody: {
			description: "Updated limits for an organization"
			required:    true
			content: "application/json": schema: $ref: "../../quartz/schemas/OrgLimits.yml"
		}
		responses: {
			"200": {
				description: "Organization Limits"
				content: "application/json": schema: $ref: "../../quartz/schemas/OrgLimits.yml"
			}
			"400": {
				description: "Invalid request"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"401": {
				description: "Unauthorized"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"404": {
				description: "Org not found"
				$ref:        "../../common/responses/ServerError.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
