package paths

telegrafs_telegrafID_members: {
	get: {
		operationId: "GetTelegrafsIDMembers"
		tags: [
			"Telegrafs",
		]
		summary: "List all users with member privileges for a Telegraf config"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "telegrafID"
			schema: type: "string"
			required:    true
			description: "The Telegraf config ID."
		}]
		responses: {
			"200": {
				description: "A list of Telegraf config members"
				content: "application/json": schema: $ref: "../schemas/ResourceMembers.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	post: {
		operationId: "PostTelegrafsIDMembers"
		tags: [
			"Telegrafs",
		]
		summary: "Add a member to a Telegraf config"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "telegrafID"
			schema: type: "string"
			required:    true
			description: "The Telegraf config ID."
		}]
		requestBody: {
			description: "User to add as member"
			required:    true
			content: "application/json": schema: $ref: "../schemas/AddResourceMemberRequestBody.yml"
		}
		responses: {
			"201": {
				description: "Member added to Telegraf config"
				content: "application/json": schema: $ref: "../schemas/ResourceMember.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
