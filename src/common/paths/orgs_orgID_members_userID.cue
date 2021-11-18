package paths

orgs_orgID_members_userID: delete: {
	operationId: "DeleteOrgsIDMembersID"
	tags: [
		"Organizations",
	]
	summary: "Remove a member from an organization"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "userID"
		schema: type: "string"
		required:    true
		description: "The ID of the member to remove."
	}, {
		in:   "path"
		name: "orgID"
		schema: type: "string"
		required:    true
		description: "The organization ID."
	}]
	responses: {
		"204": description: "Member removed"
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
