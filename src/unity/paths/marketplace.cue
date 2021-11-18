package paths

marketplace: get: {
	operationId: "GetMarketplace"
	tags: [
		"Marketplace",
	]
	responses: {
		"200": {
			description: "Marketplace information for account"
			content: "application/json": schema: $ref: "../schemas/Marketplace.yml"
		}
		"401": {
			description: "Not Authorized or Invalid Session"
			$ref:        "../../common/responses/ServerError.yml"
		}
		"404": {
			description: "Marketplace not found"
			$ref:        "../../common/responses/ServerError.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
