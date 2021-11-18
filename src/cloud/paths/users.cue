package paths

users: {
	get: {
		operationId: "GetUsers"
		tags: [
			"Users",
		]
		summary: "List all users"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}]
		responses: {
			"200": {
				description: "A list of users"
				content: "application/json": schema: $ref: "../schemas/Users.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	post: {
		operationId: "PostUsers"
		tags: [
			"Users",
		]
		summary: "Create a user"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}]
		requestBody: {
			description: "User to create"
			required:    true
			content: "application/json": schema: $ref: "../schemas/User.yml"
		}
		responses: {
			"201": {
				description: "User created"
				content: "application/json": schema: $ref: "../../common/schemas/UserResponse.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
