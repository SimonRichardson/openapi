package paths

usage_vectors: get: {
	operationId: "GetUsageVectors"
	tags: [
		"Usage",
	]
	responses: {
		"200": {
			description: "List of usage vectors for the account"
			content: "application/json": schema: $ref: "../schemas/UsageVectors.yml"
		}
		"401": {
			description: "Unauthorized"
			$ref:        "../../common/responses/ServerError.yml"
		}
		"404": {
			description: "Pricing version not 4 or User/Org not found"
			$ref:        "../../common/responses/ServerError.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
