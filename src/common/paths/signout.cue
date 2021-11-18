package paths

signout: post: {
	operationId: "PostSignout"
	summary:     "Expire the current UI session"
	tags: [
		"Signout",
	]
	description: "Expires the current UI session for the user."
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}]
	responses: {
		"204": description: "Session successfully expired"
		"401": {
			description: "Unauthorized access"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
		default: {
			description: "Unsuccessful session expiry"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
