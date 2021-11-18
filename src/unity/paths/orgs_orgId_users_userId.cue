package paths

orgs_orgId_users_userId: delete: {
	operationId: "DeleteOrgsIdUserId"
	tags: [
		"Users",
		"Organizations",
	]
	summary: "Removes a user from an organization and account"
	requestBody: content: "application/json; charset=utf-8": schema: type: "object"
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "userId"
		schema: type: "string"
		required:    true
		description: "The ID of the user to remove."
	}, {
		in:   "path"
		name: "orgId"
		schema: type: "string"
		required:    true
		description: "The organization ID."
	}]
	responses: {
		"204": description: "User removed"
		"400": {
			description: "User trying to remove self"
			$ref:        "../../common/responses/ServerError.yml"
		}
		"401": {
			description: "Unauthorized"
			$ref:        "../../common/responses/ServerError.yml"
		}
		"404": {
			description: "Session user not owner or User/Org not found"
			$ref:        "../../common/responses/ServerError.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
