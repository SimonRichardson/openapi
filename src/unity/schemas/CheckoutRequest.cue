package schemas

CheckoutRequest: properties: {
	paymentMethodId: {
		type:        "string"
		description: "id from submitting the zuora form"
	}
	street1: {
		description: "for billing address"
		type:        "string"
	}
	street2: {
		description: "for billing address"
		type:        "string"
	}
	city: {
		description: "for billing address"
		type:        "string"
	}
	country: {
		description: "for billing address"
		type:        "string"
	}
	subdivision: {
		description: "for billing address (state in US)"
		type:        "string"
	}
	postalCode: {
		description: "for billing address"
		type:        "string"
	}
	notifyEmail: {
		description: "the email for the notification"
		type:        "string"
	}
	balanceThreshold: {
		description: "threshold for notification"
		type:        "number"
	}
	isNotify: {
		description: "whether the user will be notified about their balance"
		type:        "boolean"
	}
	isPaygCreditActive: {
		description: "whether the user is a part of the payg credit"
		type:        "boolean"
	}
}
