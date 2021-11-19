package contracts

unity: {
	openapi: "3.0.0"
	info: {
		title:   "Unity API Service"
		version: "0.1.0"
	}
	servers: [{
		url: "/api/v2/quartz"
	}]
	paths: {
		"/me": $ref:                                           "./unity/paths/me.yml"
		"/account": $ref:                                      "./unity/paths/account.yml"
		"/accounts": $ref:                                     "./unity/paths/accounts.yml"
		"/accounts/default": $ref:                             "./unity/paths/accounts_default.yml"
		"/billing": $ref:                                      "./unity/paths/billing.yml"
		"/marketplace": $ref:                                  "./unity/paths/marketplace.yml"
		"/billing/start_date": $ref:                           "./unity/paths/billing_start_date.yml"
		"/usage/vectors": $ref:                                "./unity/paths/usage_vectors.yml"
		"/usage/{vector_name}": $ref:                          "./unity/paths/usage_vector_name.yml"
		"/usage/billing_stats": $ref:                          "./unity/paths/usage_billing_stats.yml"
		"/usage/rate_limits": $ref:                            "./unity/paths/usage_rate_limits.yml"
		"/settings/notifications": $ref:                       "./unity/paths/settings_notifications.yml"
		"/billing/contact": $ref:                              "./unity/paths/billing_contact.yml"
		"/payment_form/{form}": $ref:                          "./unity/paths/payment_form.yml"
		"/billing/payment_method": $ref:                       "./unity/paths/billing_payment_method.yml"
		"/billing/invoices": $ref:                             "./unity/paths/billing_invoices.yml"
		"/billing/invoices/{invoiceId}": $ref:                 "./unity/paths/billing_invoices_invoiceId.yml"
		"/orgs/{orgId}/invites": $ref:                         "./unity/paths/orgs_orgId_invites.yml"
		"/orgs/{orgId}/invites/{inviteId}": $ref:              "./unity/paths/orgs_orgId_invites_inviteId.yml"
		"/orgs/{orgId}/invites/{inviteId}/resend": $ref:       "./unity/paths/orgs_orgId_invites_inviteId_resend.yml"
		"/orgs/{orgId}/users": $ref:                           "./unity/paths/orgs_orgId_users.yml"
		"/orgs/{orgId}/users/{userId}": $ref:                  "./unity/paths/orgs_orgId_users_userId.yml"
		"/orgs/{orgId}/limits": $ref:                          "./unity/paths/orgs_orgId_limits.yml"
		"/checkout": $ref:                                     "./unity/paths/checkout.yml"
		"/cancel": $ref:                                       "./unity/paths/cancel.yml"
		"/operator/accounts": $ref:                            "./unity/paths/operator_accounts.yml"
		"/operator/accounts/{accountId}": $ref:                "./unity/paths/operator_accounts_accountId.yml"
		"/operator/accounts/{accountId}/users/{userId}": $ref: "./unity/paths/operator_accounts_accountId_users_userId.yml"
		"/operator/orgs": $ref:                                "./unity/paths/operator_orgs.yml"
		"/operator/orgs/{orgId}": $ref:                        "./unity/paths/operator_orgs_orgId.yml"
		"/operator/orgs/{orgId}/limits": $ref:                 "./unity/paths/operator_orgs_orgId_limits.yml"
		"/auth/connection": $ref:                              "./unity/paths/sso.yml"
	}
	components: {
		parameters: TraceSpan: $ref: "./common/parameters/TraceSpan.yml"
		schemas: {
			Error: $ref:                   "./common/schemas/Error.yml"
			Marketplace: $ref:             "./unity/schemas/Marketplace.yml"
			OperatorAccount: $ref:         "./unity/schemas/OperatorAccount.yml"
			OperatorAccounts: $ref:        "./unity/schemas/OperatorAccounts.yml"
			MarketplaceSubscription: $ref: "./unity/schemas/MarketplaceSubscription.yml"
			User: $ref:                    "./unity/schemas/User.yml"
			Users: $ref:                   "./unity/schemas/Users.yml"
			MarketplaceType: $ref:         "./unity/schemas/MarketplaceType.yml"
			TimeRange: $ref:               "./unity/schemas/TimeRange.yml"
			VectorName: $ref:              "./unity/schemas/VectorName.yml"
			Role: $ref:                    "./unity/schemas/Role.yml"
			PaymentFormType: $ref:         "./unity/schemas/PaymentFormType.yml"
			AccountType: $ref:             "./unity/schemas/AccountType.yml"
			BillingInfo: $ref:             "./unity/schemas/BillingInfo.yml"
			Region: $ref:                  "./unity/schemas/Region.yml"
			BillingDate: $ref:             "./unity/schemas/BillingDate.yml"
			BillingContact: $ref:          "./unity/schemas/BillingContact.yml"
			BillingNotifySettings: $ref:   "./unity/schemas/BillingNotifySettings.yml"
			CheckoutRequest: $ref:         "./unity/schemas/CheckoutRequest.yml"
			Invite: $ref:                  "./unity/schemas/Invite.yml"
			Invites: $ref:                 "./unity/schemas/Invites.yml"
			PaymentMethodPut: $ref:        "./unity/schemas/PaymentMethodPut.yml"
			CreditCardParams: $ref:        "./unity/schemas/CreditCardParams.yml"
			PaymentMethod: $ref:           "./unity/schemas/PaymentMethod.yml"
			UsageVectors: $ref:            "./unity/schemas/UsageVectors.yml"
			UsageVector: $ref:             "./unity/schemas/UsageVector.yml"
			Invoice: $ref:                 "./unity/schemas/Invoice.yml"
			Invoices: $ref:                "./unity/schemas/Invoices.yml"
			OrgUser: $ref:                 "./unity/schemas/OrgUser.yml"
			Me: $ref:                      "./unity/schemas/Me.yml"
			OrgUsers: $ref:                "./unity/schemas/OrgUsers.yml"
			Organization: $ref:            "./unity/schemas/Organization.yml"
			Organizations: $ref:           "./unity/schemas/Organizations.yml"
			RelatedAccount: $ref:          "./unity/schemas/RelatedAccount.yml"
			// quartz shared limits
			OrgLimits: {
				$ref: "./quartz/schemas/OrgLimits.yml"
			}
			RateLimits: $ref:                 "./quartz/schemas/RateLimits.yml"
			Limit: $ref:                      "./quartz/schemas/Limit.yml"
			BucketLimits: $ref:               "./quartz/schemas/BucketLimits.yml"
			TaskLimits: $ref:                 "./quartz/schemas/TaskLimits.yml"
			DashboardLimits: $ref:            "./quartz/schemas/DashboardLimits.yml"
			CheckLimits: $ref:                "./quartz/schemas/CheckLimits.yml"
			NotificationRuleLimits: $ref:     "./quartz/schemas/NotificationRuleLimits.yml"
			NotificationEndpointLimits: $ref: "./quartz/schemas/NotificationEndpointLimits.yml"
			RestrictedLimit: $ref:            "./quartz/schemas/RestrictedLimit.yml"
			Unlimited: $ref:                  "./quartz/schemas/Unlimited.yml"
		}
		responses: ServerError: $ref: "./common/responses/ServerError.yml"
	}
}
