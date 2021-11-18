package paths

accounts: get: {
	operationId: "GetAccounts"
	tags: [
		"Accounts",
	]
	summary: "Get the list of accounts for the current user"
	responses: {
		"200": {
			description: "Accounts"
			content: "application/json": schema: $ref: "../schemas/Accounts.yml"
		}
		"401": {
			description: "Unauthorized"
			$ref:        "../../common/responses/ServerError.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
