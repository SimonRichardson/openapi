package paths

orgs_orgID_settings: {
	get: {
		summary: "Get settings for an org"
		parameters: [{
			in:          "path"
			name:        "orgID"
			description: "org to get settings for"
			required:    true
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "Current settings for org"
				content: "application/json": schema: $ref: "../schemas/OrgSettings.yml"
			}
			default: {
				description: "unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	put: {
		summary: "Create or update settings for an org"
		parameters: [{
			in:          "path"
			name:        "orgID"
			description: "org to create settings for"
			required:    true
			schema: type: "string"
		}]
		requestBody: {
			description: "Org settings that will be updated"
			required:    true
			content: "application/json": schema: $ref: "../schemas/OrgSettings.yml"
		}
		responses: {
			"200": {
				description: "The updated or created settings"
				content: "application/json": schema: $ref: "../schemas/OrgSettings.yml"
			}
			default: {
				description: "unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
