package schemas

Views: {
	type: "object"
	properties: {
		links: {
			type: "object"
			properties: self: type: "string"
		}
		views: {
			type: "array"
			items: $ref: "./View.yml"
		}
	}
}
