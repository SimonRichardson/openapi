package paths

orgs: {
	get: {
		operationId: "GetOrgs"
		tags: [
			"Organizations",
		]
		summary: "List all organizations"
		responses: {
			"200": {
				description: "A list of organizations"
				content: "application/json": schema: $ref: "../schemas/Organizations.yml"
			}
			"401": {
				description: "Unauthorized bearer token"
				$ref:        "../../common/responses/ServerError.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	post: {
		operationId: "PostOrgs"
		tags: [
			"Organizations",
		]
		summary: "Creates an organization"
		requestBody: {
			description: "Information for provisioning an organization"
			required:    true
			content: "application/json": schema: $ref: "../schemas/OrganizationRequest.yml"
		}
		responses: {
			"201": {
				description: "Organization created"
				content: "application/json": schema: $ref: "../schemas/OrganizationWithToken.yml"
			}
			"400": {
				description: "Invalid request"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"401": {
				description: "Unauthorized bearer token"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"409": {
				description: "Organization name taken"
				$ref:        "../../common/responses/ServerError.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
