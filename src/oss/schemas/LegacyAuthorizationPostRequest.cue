package schemas

LegacyAuthorizationPostRequest: {
	required: ["orgID", "permissions"]
	allOf: [{
		$ref: "../../common/schemas/AuthorizationUpdateRequest.yml"
	}, {
		type: "object"
		properties: {
			orgID: {
				type:        "string"
				description: "ID of org that authorization is scoped to."
			}
			userID: {
				type:        "string"
				description: "ID of user that authorization is scoped to."
			}
			token: {
				type:        "string"
				description: "Token (name) of the authorization"
			}
			permissions: {
				type:        "array"
				minItems:    1
				description: "List of permissions for an auth.  An auth must have at least one Permission."
				items: $ref: "../../common/schemas/Permission.yml"
			}
		}
	}]
}
