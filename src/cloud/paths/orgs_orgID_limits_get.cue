package paths

orgs_orgID_limits_get: get: {
	tags: [
		"Limits",
	]
	summary: "Retrieve limits for an organization"
	parameters: [{
		in:          "path"
		name:        "orgID"
		description: "The identifier of the organization."
		required:    true
		schema: type: "string"
	}]
	responses: {
		"200": {
			description: "The Limits defined for the organization."
			content: "application/json": schema: $ref: "../schemas/LimitPublic.yml"
		}
		default: {
			description: "unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
