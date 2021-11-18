package paths

orgLimits: {
	get: {
		operationId: "GetOrgsIDLimits"
		tags: [
			"Limits",
		]
		summary: "Get the limits of an organization"
		parameters: [{
			in:   "path"
			name: "orgID"
			schema: type: "string"
			required:    true
			description: "The ID of the organization"
		}]
		responses: {
			"200": {
				description: "Organization limits"
				content: "application/json": schema: $ref: "../schemas/OrgLimits.yml"
			}
			"401": {
				description: "Unauthorized bearer token"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"404": {
				description: "Organization not found"
				$ref:        "../../common/responses/ServerError.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	put: {
		operationId: "PatchOrgsIDLimits"
		tags: [
			"Limits",
		]
		summary: "Update the limits of an organization"
		parameters: [{
			in:   "path"
			name: "orgID"
			schema: type: "string"
			required:    true
			description: "The ID of the organization"
		}]
		requestBody: {
			description: "Updated limits for an organization"
			required:    true
			content: "application/json": schema: $ref: "../schemas/OrgLimits.yml"
		}
		responses: {
			"200": {
				description: "Organization limits"
				content: "application/json": schema: $ref: "../schemas/OrgLimits.yml"
			}
			"400": {
				description: "Invalid request"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"401": {
				description: "Unauthorized bearer token"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"404": {
				description: "Organization not found"
				$ref:        "../../common/responses/ServerError.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
