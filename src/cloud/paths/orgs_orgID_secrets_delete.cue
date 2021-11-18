package paths

orgs_orgID_secrets_delete: post: {
	deprecated:  true
	operationId: "PostOrgsIDSecrets"
	tags: [
		"Secrets",
	]
	summary: "Delete secrets from an organization"
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "orgID"
		schema: type: "string"
		required:    true
		description: "The organization ID."
	}]
	requestBody: {
		description: "Secret key to delete"
		required:    true
		content: "application/json": schema: $ref: "../../common/schemas/SecretKeys.yml"
	}
	responses: {
		"204": description: "Keys successfully patched"
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../../common/schemas/Error.yml"
		}
	}
}
