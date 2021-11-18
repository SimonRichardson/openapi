package paths

account: delete: {
	operationId: "DeleteAccount"
	summary:     "Self-delete account"
	requestBody: content: "application/json; charset=utf-8": schema: type: "object"
	responses: {
		"204": description: "Account deleted"
		"401": {
			description: "Unauthorized/Account doesn't exist"
			$ref:        "../../common/responses/ServerError.yml"
		}
		"405": {
			description: "Account is not deletable"
			$ref:        "../../common/responses/ServerError.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
