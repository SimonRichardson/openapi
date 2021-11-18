package paths

orgs_orgId_users: get: {
	operationId: "GetUsers"
	tags: [
		"Users",
	]
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
	}, {
		in:          "path"
		name:        "orgId"
		description: "Specifies the organization ID of the User."
		required:    true
		schema: type: "string"
	}]
	responses: {
		"200": {
			description: "A list of users"
			content: "application/json": schema: $ref: "../schemas/OrgUsers.yml"
		}
		"401": {
			description: "Unauthorized"
			$ref:        "../../common/responses/ServerError.yml"
		}
		"404": {
			description: "Org or Users not found"
			$ref:        "../../common/responses/ServerError.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
