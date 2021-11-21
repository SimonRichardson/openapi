package old

"priv-unity": {
	openapi: "3.0.0"
	info: {
		title:   "Unity API Service"
		version: "0.1.0"
	}
	servers: [{
		url: "/api/v2/quartz"
	}]
	paths: {
		"/me": get: {
			operationId: "GetMe"
			tags: [
				"Accounts",
				"Operators",
				"Regions",
				"Organizations",
			]
			responses: {
				"200": {
					description: "congregated meta data for an individual account and org"
					content: "application/json": schema: $ref: "#/components/schemas/Me"
				}
				"401": {
					description: "Unauthorized"
					$ref:        "#/components/responses/ServerError"
				}
				"404": {
					description: "Cannot get account or organization for user"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/account": delete: {
			operationId: "DeleteAccount"
			summary:     "Self-delete account"
			requestBody: content: "application/json; charset=utf-8": schema: type: "object"
			responses: {
				"204": description: "Account deleted"
				"401": {
					description: "Unauthorized/Account doesn't exist"
					$ref:        "#/components/responses/ServerError"
				}
				"405": {
					description: "Account is not deletable"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/accounts": get: {
			operationId: "GetAccounts"
			tags: [
				"Accounts",
			]
			summary: "Get the list of accounts for the current user"
			responses: {
				"200": {
					description: "Accounts"
					content: "application/json": schema: {
						type: "array"
						items: {
							properties: {
								id: {
									type:        "number"
									description: "account id in quartz"
								}
								isActive: {
									type:        "boolean"
									description: "is this the currently active account in the session?"
								}
								isDefault: {
									type:        "boolean"
									description: "is this the user's default account?"
								}
								name: {
									type:        "string"
									description: "name of the account"
								}
							}
							required: [
								"id",
								"isActive",
								"isDefault",
								"name",
							]
						}
					}
				}
				"401": {
					description: "Unauthorized"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/accounts/default": put: {
			operationId: "PutDefaultAccount"
			tags: [
				"Accounts",
			]
			requestBody: {
				description: "The account to set as the user's default account"
				required:    true
				content: "application/json": schema: {
					properties: id: {
						type:        "number"
						description: "account id in quartz"
					}
					required: [
						"id",
					]
				}
			}
			responses: {
				"204": description: "default account set"
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/billing": get: {
			operationId: "GetBilling"
			tags: [
				"Billing",
			]
			responses: {
				"200": {
					description: "Billing information for account"
					content: "application/json": schema: $ref: "#/components/schemas/BillingInfo"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/marketplace": get: {
			operationId: "GetMarketplace"
			tags: [
				"Marketplace",
			]
			responses: {
				"200": {
					description: "Marketplace information for account"
					content: "application/json": schema: $ref: "#/components/schemas/Marketplace"
				}
				"401": {
					description: "Not Authorized or Invalid Session"
					$ref:        "#/components/responses/ServerError"
				}
				"404": {
					description: "Marketplace not found"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/billing/start_date": get: {
			operationId: "GetBillingStartDate"
			tags: [
				"Billing",
			]
			responses: {
				"200": {
					description: "Start of the current billing period for the Account"
					content: "application/json": schema: $ref: "#/components/schemas/BillingDate"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/usage/vectors": get: {
			operationId: "GetUsageVectors"
			tags: [
				"Usage",
			]
			responses: {
				"200": {
					description: "List of usage vectors for the account"
					content: "application/json": schema: $ref: "#/components/schemas/UsageVectors"
				}
				"401": {
					description: "Unauthorized"
					$ref:        "#/components/responses/ServerError"
				}
				"404": {
					description: "Pricing version not 4 or User/Org not found"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/usage/{vector_name}": get: {
			operationId: "GetUsagetype"
			tags: [
				"Usage",
			]
			parameters: [{
				in:       "path"
				name:     "vector_name"
				required: true
				schema: $ref: "#/components/schemas/VectorName"
				description: "The name of the UsageVector to query."
				example:     "reads_gb"
			}, {
				in:   "query"
				name: "range"
				schema: $ref: "#/components/schemas/TimeRange"
			}]
			responses: {
				"200": {
					description: "Usage history for account"
					content: "application/csv": schema: {
						type: "string"
						example: """
		#group,false,false,true,false,false
		#datatype,string,long,string,dateTime:RFC3339,long
		#default,reads_gb,,,,
		,result,table,_field,_time,_value
		,,0,reads_gb,2021-01-13T22:05:00Z,120

		"""
					}
				}

				"400": {
					description: "Invalid query param name - Bad request"
					$ref:        "#/components/responses/ServerError"
				}
				"401": {
					description: "Unauthorized"
					$ref:        "#/components/responses/ServerError"
				}
				"404": {
					description: "Invalid vector_name or start or User/Org not found"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/usage/billing_stats": get: {
			operationId: "GetUsageBilling"
			tags: [
				"Usage",
			]
			responses: {
				"200": {
					description: "Billing stats for Account current billing period"
					content: "text/csv": schema: {
						type: "string"
						example: """
		#group,false,false,true,false,false
		#datatype,string,long,string,dateTime:RFC3339,long
		#default,billing_stats,,,,
		,result,table,_field,_time,_value
		,,0,billing_stats,2021-01-13T22:05:00Z,120

		"""
					}
				}

				"401": {
					description: "Unauthorized"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/usage/rate_limits": get: {
			operationId: "GetUsageLimits"
			tags: [
				"Usage",
			]
			parameters: [{
				in:   "query"
				name: "range"
				schema: $ref: "#/components/schemas/TimeRange"
			}]
			responses: {
				"200": {
					description: "Limit history for Account"
					content: "application/csv": schema: {
						type: "string"
						example: """
		#group,false,false,true,false,false
		#datatype,string,long,string,dateTime:RFC3339,long
		#default,rate_limits,,,,
		,result,table,_field,_time,_value
		,,0,rate_limits,2021-01-13T22:05:00Z,120

		"""
					}
				}

				"400": {
					description: "Invalid query param name - Bad request"
					$ref:        "#/components/responses/ServerError"
				}
				"401": {
					description: "Unauthorized"
					$ref:        "#/components/responses/ServerError"
				}
				"404": {
					description: "Invalid vector_name or start or User/Org not found"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/settings/notifications": {
			get: {
				operationId: "GetSettingsNotifications"
				tags: [
					"Settings",
				]
				responses: {
					"200": {
						description: "Settings for billing notifications"
						content: "application/json": schema: $ref: "#/components/schemas/BillingNotifySettings"
					}
					"401": {
						description: "Unauthorized"
						$ref:        "#/components/responses/ServerError"
					}
					"404": {
						description: "Notification Settings nil or User/Org not found"
						$ref:        "#/components/responses/ServerError"
					}
					"406": {
						description: "Not Acceptable"
						$ref:        "#/components/responses/ServerError"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			put: {
				operationId: "PutSettingsNotifications"
				tags: [
					"Settings",
				]
				requestBody: {
					description: "Update to notify setting"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/BillingNotifySettings"
				}
				responses: {
					"200": {
						description: "billing notification settings updated"
						content: "application/json": schema: $ref: "#/components/schemas/BillingNotifySettings"
					}
					"400": {
						description: "Bad Request"
						$ref:        "#/components/responses/ServerError"
					}
					"401": {
						description: "Unauthorized"
						$ref:        "#/components/responses/ServerError"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/billing/contact": put: {
			operationId: "PutBillingContact"
			tags: [
				"Billing",
			]
			requestBody: {
				description: "BillingContact to update"
				required:    true
				content: "application/json": schema: $ref: "#/components/schemas/BillingContact"
			}
			responses: {
				"200": {
					description: "billing contact updated"
					content: "application/json": schema: $ref: "#/components/schemas/BillingContact"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/payment_form/{form}": get: {
			operationId: "GetPaymentForm"
			tags: [
				"PaymentGateway",
			]
			parameters: [{
				in:       "path"
				name:     "form"
				required: true
				schema: $ref: "#/components/schemas/PaymentFormType"
				example: "checkout"
			}]
			responses: {
				"200": {
					description: "A CreditCard Form parameter object"
					content: "application/json": schema: $ref: "#/components/schemas/CreditCardParams"
				}
				"400": {
					description: "Bad Request"
					$ref:        "#/components/responses/ServerError"
				}
				"401": {
					description: "Unauthorized"
					$ref:        "#/components/responses/ServerError"
				}
				"404": {
					description: "User or Form not found"
					$ref:        "#/components/responses/ServerError"
				}
				"406": {
					description: "Not Acceptable"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/billing/payment_method": put: {
			operationId: "PutPaymentMethod"
			tags: [
				"Billing",
			]
			requestBody: {
				description: "PaymentMethod to update"
				required:    true
				content: "application/json": schema: $ref: "#/components/schemas/PaymentMethodPut"
			}
			responses: {
				"200": {
					description: "Payment method updated"
					content: "application/json": schema: $ref: "#/components/schemas/PaymentMethod"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/billing/invoices": get: {
			operationId: "GetInvoices"
			tags: [
				"Billing",
			]
			responses: {
				"200": {
					description: "A list of invoices"
					content: "application/json": schema: $ref: "#/components/schemas/Invoices"
				}
				"401": {
					description: "Unauthorized"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/billing/invoices/{invoiceId}": get: {
			operationId: "GetInvoicesId"
			tags: [
				"Billing",
			]
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "invoiceId"
				schema: type: "string"
				required:    true
				description: "The ID of the invoice to get."
			}]
			responses: {
				"200": {
					description: "Returns the raw binary for the json pdf"
					content: "application/pdf": schema: {
						type:   "string"
						format: "binary"
					}
				}
				"401": {
					description: "Not Authorized or Invalid Session"
					$ref:        "#/components/responses/ServerError"
				}
				"404": {
					description: "Invoice not found"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/orgs/{orgId}/invites": {
			get: {
				operationId: "GetInvites"
				tags: [
					"Invites",
				]
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:          "path"
					name:        "orgId"
					description: "Specifies the organization ID of the Invite."
					required:    true
					schema: type: "string"
				}]
				responses: {
					"200": {
						description: "A list of cloud invites"
						content: "application/json": schema: $ref: "#/components/schemas/Invites"
					}
					"401": {
						description: "Unauthorized"
						$ref:        "#/components/responses/ServerError"
					}
					"404": {
						description: "Session user not owner or Org not found"
						$ref:        "#/components/responses/ServerError"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			post: {
				operationId: "PostOrgsIdInvites"
				tags: [
					"Invites",
					"Organizations",
				]
				summary: "Creates an invite to an organization"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "orgId"
					schema: type: "string"
					required:    true
					description: "The organization ID."
				}]
				requestBody: {
					description: "Invite to be sent"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/Invite"
				}
				responses: {
					"201": {
						description: "Invite sent"
						content: "application/json": schema: $ref: "#/components/schemas/Invite"
					}
					"401": {
						description: "Unauthorized"
						$ref:        "#/components/responses/ServerError"
					}
					"404": {
						description: "Session user not owner or Org not found"
						$ref:        "#/components/responses/ServerError"
					}
					"409": {
						description: "Conflict with invite email"
						$ref:        "#/components/responses/ServerError"
					}
					"422": {
						description: "Missing information"
						$ref:        "#/components/responses/ServerError"
					}
					"429": {
						description: "Too many requests"
						$ref:        "#/components/responses/ServerError"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/orgs/{orgId}/invites/{inviteId}": delete: {
			operationId: "DeleteOrgsIdInviteId"
			tags: [
				"Invites",
				"Organizations",
			]
			summary: "Remove an invite to an organization"
			requestBody: content: "application/json; charset=utf-8": schema: type: "object"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "inviteId"
				schema: type: "number"
				required:    true
				description: "The ID of the invite to remove."
			}, {
				in:   "path"
				name: "orgId"
				schema: type: "string"
				required:    true
				description: "The organization ID."
			}]
			responses: {
				"204": description: "Invite removed"
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/orgs/{orgId}/invites/{inviteId}/resend": post: {
			operationId: "PostOrgsIdInvitesId"
			tags: [
				"Invites",
				"Organizations",
			]
			summary: "Re-sends an invite"
			requestBody: content: "application/json; charset=utf-8": schema: type: "object"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "inviteId"
				schema: type: "number"
				required:    true
				description: "The ID of the invite to resend."
			}, {
				in:   "path"
				name: "orgId"
				schema: type: "string"
				required:    true
				description: "The organization ID."
			}]
			responses: {
				"200": {
					description: "Invite resent"
					content: "application/json": schema: $ref: "#/components/schemas/Invite"
				}
				"401": {
					description: "Not Authorized or Invalid Session"
					$ref:        "#/components/responses/ServerError"
				}
				"404": {
					description: "Session user not owner or Invite/Org not found"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/orgs/{orgId}/users": get: {
			operationId: "GetUsers"
			tags: [
				"Users",
			]
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:          "path"
				name:        "orgId"
				description: "Specifies the organization ID of the User."
				required:    true
				schema: type: "string"
			}]
			responses: {
				"200": {
					description: "A list of users"
					content: "application/json": schema: $ref: "#/components/schemas/OrgUsers"
				}
				"401": {
					description: "Unauthorized"
					$ref:        "#/components/responses/ServerError"
				}
				"404": {
					description: "Org or Users not found"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/orgs/{orgId}/users/{userId}": delete: {
			operationId: "DeleteOrgsIdUserId"
			tags: [
				"Users",
				"Organizations",
			]
			summary: "Removes a user from an organization and account"
			requestBody: content: "application/json; charset=utf-8": schema: type: "object"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "userId"
				schema: type: "string"
				required:    true
				description: "The ID of the user to remove."
			}, {
				in:   "path"
				name: "orgId"
				schema: type: "string"
				required:    true
				description: "The organization ID."
			}]
			responses: {
				"204": description: "User removed"
				"400": {
					description: "User trying to remove self"
					$ref:        "#/components/responses/ServerError"
				}
				"401": {
					description: "Unauthorized"
					$ref:        "#/components/responses/ServerError"
				}
				"404": {
					description: "Session user not owner or User/Org not found"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/orgs/{orgId}/limits": {
			get: {
				operationId: "GetOrgsIdLimits"
				tags: [
					"Organizations",
					"Operators",
				]
				summary: "Get the limits of an organization"
				parameters: [{
					in:   "path"
					name: "orgId"
					schema: type: "string"
					required:    true
					description: "The ID of the organization"
				}]
				responses: {
					"200": {
						description: "Organization limits"
						content: "application/json": schema: $ref: "#/components/schemas/OrgLimits"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			put: {
				operationId: "PutOrgsIdLimits"
				tags: [
					"Organizations",
					"Operators",
				]
				summary: "Update the limits of an organization"
				requestBody: content: "application/json; charset=utf-8": schema: type: "object"
				parameters: [{
					in:   "path"
					name: "orgId"
					schema: type: "string"
					required:    true
					description: "The ID of the organization"
				}]
				responses: {
					"200": {
						description: "Organization limits"
						content: "application/json": schema: $ref: "#/components/schemas/OrgLimits"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/checkout": post: {
			operationId: "PostCheckout"
			tags: [
				"Accounts",
			]
			requestBody: {
				description: "Information for Upgrading Account"
				required:    true
				content: "application/json": schema: $ref: "#/components/schemas/CheckoutRequest"
			}
			responses: {
				"201": description: "Created"
				"400": {
					description: "Bad Request"
					$ref:        "#/components/responses/ServerError"
				}
				"401": {
					description: "Unauthorized"
					$ref:        "#/components/responses/ServerError"
				}
				"404": {
					description: "Org/User not found or Beta region"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/cancel": post: {
			operationId: "PostCancel"
			description: "Cancel an account"
			requestBody: content: "application/json; charset=utf-8": schema: type: "object"
			tags: [
				"Accounts",
			]
			responses: {
				"204": description: "Account cancelled"
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/operator/accounts": get: {
			operationId: "GetAccountsForOperator"
			tags: [
				"Accounts",
				"Operators",
			]
			summary: "Get the list of accounts by search term"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "query"
				name: "query"
				schema: type: "string"
				required:    false
				description: "The partial email of any user in an account"
			}]
			responses: {
				"200": {
					description: "Account"
					content: "application/json": schema: $ref: "#/components/schemas/OperatorAccounts"
				}
				"401": {
					description: "Unauthorized"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/operator/accounts/{accountId}": {
			get: {
				operationId: "GetAccountById"
				tags: [
					"Accounts",
					"Operators",
				]
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "accountId"
					schema: type: "string"
					required:    true
					description: "The ID of the account to get."
				}]
				responses: {
					"200": {
						description: "the account"
						content: "application/json": schema: allOf: [{
							$ref: "#/components/schemas/OperatorAccount"
						}, {
							properties: organizations: {
								type:        "array"
								description: "organizations in the account"
								$ref:        "#/components/schemas/Organizations"
							}
						}, {
							required: [
								"organizations",
							]
						}]
					}
					"401": {
						description: "Unauthorized"
						$ref:        "#/components/responses/ServerError"
					}
					"404": {
						description: "Account not found"
						$ref:        "#/components/responses/ServerError"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			delete: {
				operationId: "DeleteAccountById"
				requestBody: content: "application/json; charset=utf-8": schema: type: "object"
				tags: [
					"Accounts",
					"Operators",
				]
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "accountId"
					schema: type: "string"
					required:    true
					description: "The ID of the account to delete."
				}]
				responses: {
					"204": description: "Account deleted"
					"400": {
						description: "Account is not deletable"
						$ref:        "#/components/responses/ServerError"
					}
					"401": {
						description: "Unauthorized"
						$ref:        "#/components/responses/ServerError"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/operator/accounts/{accountId}/users/{userId}": delete: {
			operationId: "RemoveUserFromAccount"
			tags: [
				"Accounts",
				"Users",
				"Operators",
			]
			summary: "Removes a user from an account"
			requestBody: content: "application/json; charset=utf-8": schema: type: "object"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "accountId"
				schema: type: "string"
				required:    true
				description: "The ID of the account to remove user from."
			}, {
				in:   "path"
				name: "userId"
				schema: type: "string"
				required:    true
				description: "The ID of the user to remove from the account."
			}]
			responses: {
				"204": description: "User removed from account"
				"401": {
					description: "Unauthorized"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/operator/orgs": get: {
			operationId: "GetOrganizations"
			tags: [
				"Organizations",
				"Operators",
			]
			summary: "Get the list of orgs by search term"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "query"
				name: "query"
				schema: type: "string"
				required:    false
				description: "The partial idpe id of the org being searched"
			}]
			responses: {
				"200": {
					description: "Organization"
					content: "application/json": schema: $ref: "#/components/schemas/Organizations"
				}
				"401": {
					description: "Unauthorized"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/operator/orgs/{orgId}": get: {
			operationId: "GetOrganizationById"
			tags: [
				"Organizations",
				"Operators",
			]
			summary: "Get organization by id"
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "path"
				name: "orgId"
				schema: type: "string"
				required:    true
				description: "the idpe id of the org"
			}]
			responses: {
				"200": {
					description: "Organization"
					content: "application/json": schema: allOf: [{
						$ref: "#/components/schemas/Organization"
					}]
				}
				"401": {
					description: "Unauthorized"
					$ref:        "#/components/responses/ServerError"
				}
				"404": {
					description: "Org not found"
					$ref:        "#/components/responses/ServerError"
				}
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
		}
		"/operator/orgs/{orgId}/limits": {
			get: {
				operationId: "GetOrganizationLimitsById"
				tags: [
					"Organizations",
					"Operators",
				]
				summary: "Get the org's limits"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "orgId"
					schema: type: "string"
					required:    true
					description: "The IDPE id of the org"
				}]
				responses: {
					"200": {
						description: "Organization Limits"
						content: "application/json": schema: $ref: "#/components/schemas/OrgLimits"
					}
					"401": {
						description: "Unauthorized"
						$ref:        "#/components/responses/ServerError"
					}
					"404": {
						description: "Org not found"
						$ref:        "#/components/responses/ServerError"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
			put: {
				operationId: "UpdateOrganizationLimitsById"
				tags: [
					"Organizations",
					"Operators",
				]
				summary: "Update the org's limits"
				parameters: [{
					$ref: "#/components/parameters/TraceSpan"
				}, {
					in:   "path"
					name: "orgId"
					schema: type: "string"
					required:    true
					description: "The IDPE id of the org"
				}]
				requestBody: {
					description: "Updated limits for an organization"
					required:    true
					content: "application/json": schema: $ref: "#/components/schemas/OrgLimits"
				}
				responses: {
					"200": {
						description: "Organization Limits"
						content: "application/json": schema: $ref: "#/components/schemas/OrgLimits"
					}
					"400": {
						description: "Invalid request"
						$ref:        "#/components/responses/ServerError"
					}
					"401": {
						description: "Unauthorized"
						$ref:        "#/components/responses/ServerError"
					}
					"404": {
						description: "Org not found"
						$ref:        "#/components/responses/ServerError"
					}
					default: {
						description: "Unexpected error"
						$ref:        "#/components/responses/ServerError"
					}
				}
			}
		}
		"/auth/connection": get: {
			operationId: "GetConnection"
			tags: [
				"Connection",
			]
			parameters: [{
				$ref: "#/components/parameters/TraceSpan"
			}, {
				in:   "query"
				name: "email"
				schema: {
					type:   "string"
					format: "email"
				}
				required:    true
				description: "The email to get connection for."
			}]
			responses: {
				"200": {
					content: "application/json": schema: {
						type:    "string"
						example: "connection"
					}
					description: "Connection name as string"
				}
				"204": description: "No connection for the specified email"
				default: {
					description: "Unexpected error"
					$ref:        "#/components/responses/ServerError"
				}
			}
			summary: "Get connection  for the specified email"
		}
	}
	components: {
		parameters: TraceSpan: {
			in:          "header"
			name:        "Zap-Trace-Span"
			description: "OpenTracing span context"
			example: {
				trace_id: "1"
				span_id:  "1"
				baggage: key: "value"
			}
			required: false
			schema: type: "string"
		}
		schemas: {
			Error: {
				properties: {
					code: {
						description: "code is the machine-readable error code."
						readOnly:    true
						type:        "string"
						enum: [
							"internal error",
							"not found",
							"conflict",
							"invalid",
							"unprocessable entity",
							"empty value",
							"unavailable",
							"forbidden",
							"too many requests",
							"unauthorized",
							"method not allowed",
							"request too large",
							"unsupported media type",
						]
					}
					message: {
						readOnly:    true
						description: "message is a human-readable message."
						type:        "string"
					}
					op: {
						readOnly:    true
						description: "op describes the logical code operation during error. Useful for debugging."
						type:        "string"
					}
					err: {
						readOnly:    true
						description: "err is a stack of errors that occurred during processing of the request. Useful for debugging."
						type:        "string"
					}
				}
				required: [
					"code",
					"message",
				]
			}
			Marketplace: {
				properties: {
					name: {
						description: "full name of the marketplace"
						type:        "string"
						example:     "Google Cloud Marketplace"
					}
					shortName: {
						description: "marketplace acronyms"
						$ref:        "#/components/schemas/MarketplaceType"
						example:     "gcm"
					}
					url: {
						description: "link to marketplace"
						type:        "string"
					}
				}
				required: [
					"name",
					"shortName",
					"url",
				]
			}
			OperatorAccount: {
				properties: {
					id: {
						type:        "number"
						description: "account id in quartz"
					}
					type: $ref: "#/components/schemas/AccountType"
					zuoraAccountId: {
						type:        "string"
						description: "Zuora ID associated with the account"
					}
					deletable: {
						type:        "boolean"
						description: "flag whether the account can be deleted or not"
					}
					balance: {
						type:        "number"
						description: "remaining balance on the account, nil if none"
					}
					billingContact: {
						$ref:        "#/components/schemas/BillingContact"
						description: "billing contact for the account"
					}
					users: {
						type: "array"
						$ref: "#/components/schemas/Users"
					}
					marketplaceSubscription: {
						$ref:        "#/components/schemas/MarketplaceSubscription"
						description: "which marketplace, nil if none"
					}
				}
				required: [
					"id",
					"account",
					"balance",
					"billingContact",
					"marketplaceSubscription",
					"type",
					"users",
				]
			}
			OperatorAccounts: {
				type: "array"
				items: $ref: "#/components/schemas/OperatorAccount"
			}
			MarketplaceSubscription: {
				properties: {
					marketplace: $ref: "#/components/schemas/MarketplaceType"
					status: {
						type: "string"
						enum: [
							"pending",
							"subscribed",
							"unsubscribed",
							"failed",
						]
						description: "status of the marketplace"
					}
					subscriberId: type: "string"
				}
				required: [
					"marketplace",
					"status",
					"subscriberId",
				]
			}
			User: {
				properties: {
					email: {
						type:        "string"
						description: "user's email"
					}
					firstName: {
						type:        "string"
						description: "user's first name"
					}
					id: {
						type:        "string"
						description: "user's id in quartz"
					}
					idpeId: {
						type:        "string"
						description: "user's id in idpe"
					}
					lastName: {
						type:        "string"
						description: "user's last name"
					}
					operator: {
						type:        "boolean"
						description: "whether or not the user is an operator"
					}
					sfdcContactId: {
						type:        "string"
						description: "the contact id of the user in salesforce"
					}
				}
				required: [
					"firstName",
					"id",
					"idpeId",
					"lastName",
				]
			}
			Users: {
				type: "array"
				items: $ref: "#/components/schemas/User"
			}
			MarketplaceType: {
				type:        "string"
				description: "marketplace acronym or name"
				enum: [
					"aws",
					"gcm",
					"azure",
				]
			}
			TimeRange: {
				type:        "string"
				description: "The timerange options for usage information"
				enum: [
					"24h",
					"7d",
					"30d",
				]
				default: "24h"
			}
			VectorName: {
				type:        "string"
				description: "Name of the usage vector"
				enum: [
					"storage_gb",
					"writes_mb",
					"reads_gb",
					"query_count",
				]
			}
			Role: {
				type:        "string"
				description: "Role of the User"
				enum: [
					"owner",
					"member",
				]
			}
			PaymentFormType: {
				type:        "string"
				description: "The name of the PaymentForm to query."
				example:     "checkout"
				enum: [
					"checkout",
					"billing",
				]
			}
			AccountType: {
				type:        "string"
				description: "type of the account"
				enum: [
					"cancelled",
					"contract",
					"free",
					"pay_as_you_go",
				]
			}
			BillingInfo: {
				properties: {
					balance: {
						type:        "number"
						description: "account balance"
					}
					region: type: "string"
					paymentMethod: $ref: "#/components/schemas/PaymentMethod"
					balanceUpdatedAt: {
						type:        "string"
						description: "date of last update to account"
					}
					contact: $ref: "#/components/schemas/BillingContact"
				}
				required: [
					"balance",
					"balanceUpdatedAt",
					"contact",
				]
			}
			Region: {
				properties: title: {
					type:        "string"
					description: "title of the region"
				}
				required: [
					"title",
				]
			}
			BillingDate: {
				properties: dateTime: {
					type:        "string"
					description: "UTC datetime representing the start of the billing period for the account"
				}
				required: [
					"dateTime",
				]
			}
			BillingContact: {
				properties: {
					companyName: {
						type:        "string"
						description: "name of the company billed"
					}
					email: {
						type:        "string"
						description: "billing email"
					}
					firstName: {
						type:        "string"
						description: "first name of billing contact"
					}
					lastName: {
						type:        "string"
						description: "last name of billing contact"
					}
					country: {
						type:        "string"
						description: "country of billing contact"
					}
					street1: {
						type:        "string"
						description: "street of billing contact"
					}
					street2: {
						type:        "string"
						description: "additional street info"
					}
					city: {
						type:        "string"
						description: "city of billing contact"
					}
					subdivision: {
						type:        "string"
						description: "subdivision"
					}
					postalCode: {
						type:        "string"
						description: "postal code of billing contact"
					}
				}
				required: [
					"companyName",
					"email",
					"firstName",
					"lastName",
					"country",
					"city",
					"postalCode",
				]
			}
			BillingNotifySettings: {
				properties: {
					isNotify: {
						description: "opt in to threshold notifications"
						type:        "boolean"
					}
					balanceThreshold: {
						type:        "number"
						description: "threshold that when passed will trigger a notification"
					}
					notifyEmail: {
						type:        "string"
						description: "email to send notification"
					}
				}
				required: [
					"isNotify",
					"balanceThreshold",
					"notifyEmail",
				]
			}
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
			Invite: {
				properties: {
					id: {
						description: "the quartz id of the invite"
						readOnly:    true
						type:        "number"
					}
					email: type: "string"
					role: $ref: "#/components/schemas/Role"
					expiresAt: {
						description: "when the invite will expire"
						readOnly:    true
						format:      "date-time"
						type:        "string"
					}
				}
				required: [
					"email",
					"role",
				]
			}
			Invites: {
				type: "array"
				items: $ref: "#/components/schemas/Invite"
			}
			PaymentMethodPut: properties: paymentMethodId: {
				type:        "string"
				description: "ref id from Zuora"
				readOnly:    true
			}
			CreditCardParams: {
				properties: {
					id: {
						description: "id of the page displayed"
						readOnly:    true
						type:        "string"
					}
					tenantId: {
						description: "id of our account with the payment processor"
						type:        "string"
						readOnly:    true
					}
					key: {
						description: "payment processor secret key"
						readOnly:    true
						type:        "string"
					}
					signature: {
						description: "signature of the key or token"
						readOnly:    true
						type:        "string"
					}
					token: {
						description: "api token of the payment processor"
						readOnly:    true
						type:        "string"
					}
					style: {
						description: "way payment form gets displayed"
						type:        "string"
						readOnly:    true
					}
					submitEnabled: {
						description: "boolean string 'true' or 'false' which allows us to handle submits from our form"
						type:        "string"
						enum: [
							"true",
							"false",
						]
						readOnly: true
					}
					url: {
						type:        "string"
						readOnly:    true
						description: "uri of the embedded iframe"
					}
				}
				required: [
					"id",
					"tenantId",
					"key",
					"signature",
					"token",
					"style",
					"submitEnabled",
					"url",
				]
			}
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
				required: [
					"cardType",
					"cardNumber",
					"expirationMonth",
					"expirationYear",
				]
			}
			UsageVectors: {
				type: "array"
				items: $ref: "#/components/schemas/UsageVector"
			}
			UsageVector: {
				properties: {
					name: {
						description: "name of usage vector"
						type:        "string"
						example:     "storage"
					}
					unit: {
						description: "unit for usage vector"
						type:        "string"
						example:     "GB-hr"
					}
					fluxKey: {
						description: "key in flux response"
						type:        "string"
						example:     "storage_gb"
					}
				}
				required: [
					"name",
					"unit",
					"fluxKey",
				]
			}
			Invoice: {
				properties: {
					id: {
						description: "id of the invoice"
						type:        "string"
					}
					status: {
						description: "status of the invoice"
						readOnly:    true
						type:        "string"
					}
					amount: {
						description: "amount of invoice in dollars"
						type:        "number"
						readOnly:    true
					}
					targetDate: {
						description: "date of invoice"
						readOnly:    true
						type:        "string"
					}
				}
				required: [
					"id",
					"status",
					"amount",
					"targetDate",
				]
			}
			Invoices: {
				type: "array"
				items: $ref: "#/components/schemas/Invoice"
			}
			OrgUser: {
				properties: {
					id: {
						description: "the idpe id of the user"
						readOnly:    true
						type:        "string"
					}
					firstName: type: "string"
					lastName: type: "string"
					email: type: "string"
					role: $ref: "#/components/schemas/Role"
				}
				required: [
					"id",
					"firstName",
					"lastName",
					"email",
					"role",
				]
			}
			Me: {
				properties: {
					id: {
						type:        "string"
						description: "the idpe id of the user"
					}
					email: {
						type:        "string"
						description: "the email associated with the user"
					}
					accountType: $ref: "#/components/schemas/AccountType"
					billingProvider: {
						type:        "string"
						description: "the billing provider for the account, nil if none"
						enum: [
							"zuora",
							"aws",
							"gcm",
							"azure",
						]
					}
					isRegionBeta: {
						type:        "boolean"
						description: "whether the region associated with the account is a beta region"
					}
					isOperator: {
						type:        "boolean"
						description: "whether the user is an operator"
					}
					operatorRole: {
						type:     "string"
						nullable: true
						enum: [
							"read-only",
							"read-write",
						]
						description: "role permission whether this operator is \"read-only\" | \"read-write\""
					}
					paygCreditStartDate: {
						type:        "string"
						nullable:    true
						description: "a timestamp indicates if an account is part of the payg credit experiment, nil if not"
					}
				}
				required: [
					"id",
					"accountType",
					"billingProvider",
					"email",
					"isOperator",
					"isRegionBeta",
				]
			}
			OrgUsers: {
				type: "array"
				items: $ref: "#/components/schemas/OrgUser"
			}
			Organization: {
				type: "object"
				properties: {
					idpeId: {
						type:        "string"
						description: "idpe ID of the org"
					}
					id: {
						type:        "number"
						description: "quartz ID of the org"
					}
					name: {
						type:        "string"
						description: "name of the org"
					}
					region: {
						type:        "string"
						description: "region of the org"
					}
					provider: {
						type:        "string"
						description: "provider of the org"
					}
					date: {
						type:        "string"
						description: "date org was created"
					}
					account: $ref: "#/components/schemas/RelatedAccount"
				}
				required: [
					"account",
					"id",
					"idpeId",
					"region",
					"provider",
					"date",
				]
			}
			Organizations: {
				type: "array"
				items: $ref: "#/components/schemas/Organization"
			}
			RelatedAccount: {
				description: "Subset of Account data related to the organization"
				type:        "object"
				properties: {
					id: {
						type:        "number"
						description: "account id in quartz"
					}
					type: $ref: "#/components/schemas/AccountType"
					balance: {
						type:        "number"
						description: "remaining balance on the account, nil if none"
					}
					billingContact: {
						$ref:        "#/components/schemas/BillingContact"
						description: "billing contact for the account"
					}
					updatedAt: {
						type:        "string"
						description: "date of last update to account"
					}
				}
				required: [
					"id",
					"balance",
					"type",
					"updatedAt",
				]
			}
			OrgLimits: {
				type: "object"
				properties: {
					orgID: {
						type:        "string"
						readOnly:    true
						description: "ID of the org for which these rates apply"
					}
					rate: $ref: "#/components/schemas/RateLimits"
					bucket: $ref: "#/components/schemas/BucketLimits"
					task: $ref: "#/components/schemas/TaskLimits"
					dashboard: $ref: "#/components/schemas/DashboardLimits"
					check: $ref: "#/components/schemas/CheckLimits"
					notificationRule: $ref: "#/components/schemas/NotificationRuleLimits"
					notificationEndpoint: $ref: "#/components/schemas/NotificationEndpointLimits"
				}
				required: [
					"orgID",
					"rate",
					"bucket",
					"task",
					"dashboard",
					"check",
					"notificationRule",
					"notificationEndpoint",
				]
			}
			RateLimits: {
				description: "Usage rate limits"
				type:        "object"
				properties: {
					readKBs: {
						description: "KB of data query'd per second"
						example:     1000
						oneOf: [{
							$ref: "#/components/schemas/RestrictedLimit"
						}, {
							$ref:    "#/components/schemas/Limit"
							maximum: 10000
						}]
					}
					writeKBs: {
						description: "KB of data written per second"
						example:     17
						oneOf: [{
							$ref: "#/components/schemas/RestrictedLimit"
						}, {
							$ref:    "#/components/schemas/Limit"
							maximum: 10000
						}]
					}
					cardinality: {
						description: "Max cardinality of data"
						example:     10000
						oneOf: [{
							$ref: "#/components/schemas/RestrictedLimit"
						}, {
							$ref:    "#/components/schemas/Limit"
							maximum: 1000000
						}]
					}
				}
			}
			Limit: {
				description: "Limit of at least 1"
				type:        "integer"
				minimum:     1
			}
			BucketLimits: {
				description: "Bucket limits"
				type:        "object"
				properties: {
					maxBuckets: {
						example:     2
						description: "Number of buckets allowed"
						oneOf: [{
							$ref: "#/components/schemas/RestrictedLimit"
						}, {
							$ref: "#/components/schemas/Unlimited"
						}, {
							$ref: "#/components/schemas/Limit"
						}]
					}
					maxRetentionDuration: {
						description: "Retention duration limits in nanoseconds"
						example:     2592000000000000
						oneOf: [{
							$ref: "#/components/schemas/RestrictedLimit"
						}, {
							$ref: "#/components/schemas/Unlimited"
						}, {
							$ref: "#/components/schemas/Limit"
						}]
					}
				}
			}
			TaskLimits: {
				description: "Task limits"
				type:        "object"
				properties: maxTasks: {
					description: "Number of tasks allowed"
					example:     5
					oneOf: [{
						$ref: "#/components/schemas/RestrictedLimit"
					}, {
						$ref: "#/components/schemas/Unlimited"
					}, {
						$ref: "#/components/schemas/Limit"
					}]
				}
			}
			DashboardLimits: {
				description: "Dashboard limits"
				type:        "object"
				properties: maxDashboards: {
					description: "Number of dashboards allowed"
					example:     5
					oneOf: [{
						$ref: "#/components/schemas/RestrictedLimit"
					}, {
						$ref: "#/components/schemas/Unlimited"
					}, {
						$ref: "#/components/schemas/Limit"
					}]
				}
			}
			CheckLimits: {
				description: "Check limits"
				type:        "object"
				properties: maxChecks: {
					description: "Number of checks allowed"
					example:     2
					oneOf: [{
						$ref: "#/components/schemas/RestrictedLimit"
					}, {
						$ref: "#/components/schemas/Unlimited"
					}, {
						$ref: "#/components/schemas/Limit"
					}]
				}
			}
			NotificationRuleLimits: {
				description: "Notification rule limits"
				type:        "object"
				properties: {
					maxNotifications: {
						description: "Number of notifications allowed"
						example:     2
						oneOf: [{
							$ref: "#/components/schemas/RestrictedLimit"
						}, {
							$ref: "#/components/schemas/Unlimited"
						}, {
							$ref: "#/components/schemas/Limit"
						}]
					}
					blockedNotificationRules: {
						description: "Notification rules not allowed CSV"
						example:     "http,pagerduty"
						type:        "string"
					}
				}
			}
			NotificationEndpointLimits: {
				description: "Notification endpoint limits"
				type:        "object"
				properties: blockedNotificationEndpoints: {
					description: "Notification endpoints not allowed CSV"
					example:     "http,pagerduty"
					type:        "string"
				}
			}
			RestrictedLimit: {
				description: "Restrict access entirely"
				type:        "integer"
				enum: [-1,
				]
			}
			Unlimited: {
				description: "Unbounded limit"
				type:        "integer"
				enum: [
					0,
				]
			}
		}
		responses: ServerError: {
			description: "Non 2XX error response from server."
			content: "application/json": schema: $ref: "#/components/schemas/Error"
		}
	}
}
