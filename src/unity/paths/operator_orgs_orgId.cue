package paths

operator_orgs_orgId: get: {
	operationId: "GetOrganizationById"
	tags: [
		"Organizations",
		"Operators",
	]
	summary: "Get organization by id"
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "orgId"
		schema: type: "string"
		required:    true
		description: "the idpe id of the org"
	}]
	responses: {
		"200": {
			description: "Organization"
			content: "application/json": schema: allOf: [{
				$ref: "../schemas/Organization.yml"
			}]
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
