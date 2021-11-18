package paths

orgs_orgId_invites_inviteId_resend: post: {
	operationId: "PostOrgsIdInvitesId"
	tags: [
		"Invites",
		"Organizations",
	]
	summary: "Re-sends an invite"
	requestBody: content: "application/json; charset=utf-8": schema: type: "object"
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
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
			content: "application/json": schema: $ref: "../schemas/Invite.yml"
		}
		"401": {
			description: "Not Authorized or Invalid Session"
			$ref:        "../../common/responses/ServerError.yml"
		}
		"404": {
			description: "Session user not owner or Invite/Org not found"
			$ref:        "../../common/responses/ServerError.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
