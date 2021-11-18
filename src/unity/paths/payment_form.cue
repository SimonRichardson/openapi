package paths

payment_form: get: {
	operationId: "GetPaymentForm"
	tags: [
		"PaymentGateway",
	]
	parameters: [{
		in:       "path"
		name:     "form"
		required: true
		schema: $ref: "../schemas/PaymentFormType.yml"
		example: "checkout"
	}]
	responses: {
		"200": {
			description: "A CreditCard Form parameter object"
			content: "application/json": schema: $ref: "../schemas/CreditCardParams.yml"
		}
		"400": {
			description: "Bad Request"
			$ref:        "../../common/responses/ServerError.yml"
		}
		"401": {
			description: "Unauthorized"
			$ref:        "../../common/responses/ServerError.yml"
		}
		"404": {
			description: "User or Form not found"
			$ref:        "../../common/responses/ServerError.yml"
		}
		"406": {
			description: "Not Acceptable"
			$ref:        "../../common/responses/ServerError.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
