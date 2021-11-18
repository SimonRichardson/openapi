package paths

operator_accounts: get: {
	operationId: "GetAccountsForOperator"
	tags: [
		"Accounts",
		"Operators",
	]
	summary: "Get the list of accounts by search term"
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
	}, {
		in:   "query"
		name: "query"
		schema: type: "string"
		required:    false
		description: "The partial email of any user in an account"
	}]
	responses: {
		"200": {
			description: "Account"
			content: "application/json": schema: $ref: "../schemas/OperatorAccounts.yml"
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
