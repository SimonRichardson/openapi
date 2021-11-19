package commonschemas

Users: {
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
			type:  "array"
			items: UserResponse.#Ref
		}
	}
}
