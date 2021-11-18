package schemas

ResourceMembers: {
	type: "object"
	properties: {
		links: {
			type: "object"
			properties: self: {
				type:   "string"
				format: "uri"
			}
		}
		users: {
			type: "array"
			items: $ref: "./ResourceMember.yml"
		}
	}
}
