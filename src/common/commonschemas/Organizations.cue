package commonschemas

Organizations: {
	type: "object"
	properties: {
		links: $ref: "./Links.yml"
		orgs: {
			type: "array"
			items: $ref: "./Organization.yml"
		}
	}
}
