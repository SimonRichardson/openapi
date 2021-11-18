package schemas

PaymentMethod: {
	properties: {
		cardType: {
			description: "name of credit card vendor"
			type:        "string"
		}
		cardNumber: {
			description: "masked credit card number"
			type:        "string"
		}
		expirationMonth: {
			description: "month of expiration"
			type:        "string"
		}
		expirationYear: {
			description: "year of expiration"
			type:        "string"
		}
		defaultPaymentMethod: {
			description: "this the default payment method"
			type:        "boolean"
		}
	}
	required: ["cardType", "cardNumber", "expirationMonth", "expirationYear"]
}
