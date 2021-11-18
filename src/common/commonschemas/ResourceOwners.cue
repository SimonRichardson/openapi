package commonschemas

ResourceOwners: {
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
			items: ResourceOwner.#Ref
		}
	}
}
