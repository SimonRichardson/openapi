package paths

operator_accounts_accountId_users_userId: delete: {
	operationId: "RemoveUserFromAccount"
	tags: [
		"Accounts",
		"Users",
		"Operators",
	]
	summary: "Removes a user from an account"
	requestBody: content: "application/json; charset=utf-8": schema: type: "object"
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "accountId"
		schema: type: "string"
		required:    true
		description: "The ID of the account to remove user from."
	}, {
		in:   "path"
		name: "userId"
		schema: type: "string"
		required:    true
		description: "The ID of the user to remove from the account."
	}]
	responses: {
		"204": description: "User removed from account"
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
