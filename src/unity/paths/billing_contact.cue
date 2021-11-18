package paths

billing_contact: put: {
	operationId: "PutBillingContact"
	tags: [
		"Billing",
	]
	requestBody: {
		description: "BillingContact to update"
		required:    true
		content: "application/json": schema: $ref: "../schemas/BillingContact.yml"
	}
	responses: {
		"200": {
			description: "billing contact updated"
			content: "application/json": schema: $ref: "../schemas/BillingContact.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
