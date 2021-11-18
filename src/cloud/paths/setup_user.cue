package paths

setup_user: post: {
	operationId: "PostSetupUser"
	tags: [
		"Setup",
	]
	summary:     "Create a new user, organization, and bucket"
	description: "Post an onboarding request to create a new user, organization, and bucket."
	requestBody: {
		description: "Source to create"
		required:    true
		content: "application/json": schema: $ref: "../schemas/OnboardingRequest.yml"
	}
	responses: {
		"201": {
			description: "The created default user, bucket, and organization."
			content: "application/json": schema: $ref: "../schemas/OnboardingResponse.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
