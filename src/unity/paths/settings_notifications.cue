package paths

settings_notifications: {
	get: {
		operationId: "GetSettingsNotifications"
		tags: [
			"Settings",
		]
		responses: {
			"200": {
				description: "Settings for billing notifications"
				content: "application/json": schema: $ref: "../schemas/BillingNotifySettings.yml"
			}
			"401": {
				description: "Unauthorized"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"404": {
				description: "Notification Settings nil or User/Org not found"
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
	put: {
		operationId: "PutSettingsNotifications"
		tags: [
			"Settings",
		]
		requestBody: {
			description: "Update to notify setting"
			required:    true
			content: "application/json": schema: $ref: "../schemas/BillingNotifySettings.yml"
		}
		responses: {
			"200": {
				description: "billing notification settings updated"
				content: "application/json": schema: $ref: "../schemas/BillingNotifySettings.yml"
			}
			"400": {
				description: "Bad Request"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"401": {
				description: "Unauthorized"
				$ref:        "../../common/responses/ServerError.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
