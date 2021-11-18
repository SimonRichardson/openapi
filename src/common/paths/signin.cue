package paths

signin: post: {
	operationId: "PostSignin"
	summary:     "Create a user session."
	description: "Authenticates ***Basic Auth*** credentials for a user. If successful, creates a new UI session for the user."
	tags: [
		"Signin",
	]
	security: [{
		BasicAuthentication: [

		]}]
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}]
	responses: {
		"204": description: "Success. User authenticated."
		"401": {
			description: "Unauthorized access."
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
		"403": {
			description: "User account is disabled."
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
		default: {
			description: "Unsuccessful authentication."
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
