package paths

telegrafs: {
	get: {
		operationId: "GetTelegrafs"
		tags: [
			"Telegrafs",
		]
		summary: "List all Telegraf configurations"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:          "query"
			name:        "orgID"
			description: "The organization ID the Telegraf config belongs to."
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A list of Telegraf configurations"
				content: "application/json": schema: $ref: "../schemas/Telegrafs.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	post: {
		operationId: "PostTelegrafs"
		tags: [
			"Telegrafs",
		]
		summary: "Create a Telegraf configuration"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}]
		requestBody: {
			description: "Telegraf configuration to create"
			required:    true
			content: "application/json": schema: $ref: "../schemas/TelegrafRequest.yml"
		}
		responses: {
			"201": {
				description: "Telegraf configuration created"
				content: "application/json": schema: $ref: "../schemas/Telegraf.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
