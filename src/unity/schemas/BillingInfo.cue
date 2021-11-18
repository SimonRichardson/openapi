package schemas

BillingInfo: {
	properties: {
		balance: {
			type:        "number"
			description: "account balance"
		}
		region: type: "string"
		paymentMethod: $ref: "./PaymentMethod.yml"
		balanceUpdatedAt: {
			type:        "string"
			description: "date of last update to account"
		}
		contact: $ref: "./BillingContact.yml"
	}
	required: ["balance", "balanceUpdatedAt", "contact"]
}
