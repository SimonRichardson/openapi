package commonschemas

Telegraf: {
	type: "object"
	allOf: [{
		$ref: "./TelegrafRequest.yml"
	}, {
		type: "object"
		properties: {
			id: {
				type:     "string"
				readOnly: true
			}
			links: {
				type:     "object"
				readOnly: true
				example: {
					self:    "/api/v2/telegrafs/1"
					lables:  "/api/v2/telegrafs/1/labels"
					owners:  "/api/v2/telegrafs/1/owners"
					members: "/api/v2/telegrafs/1/members"
				}
				properties: {
					self: $ref: "./Link.yml"
					labels: $ref: "./Link.yml"
					members: $ref: "./Link.yml"
					owners: $ref: "./Link.yml"
				}
			}
			labels: {
				readOnly: true
				$ref:     "./Labels.yml"
			}
		}
	}]
}
