package schemas

Checks: properties: {
	checks: {
		type: "array"
		items: $ref: "./Check.yml"
	}
	links: $ref: "./Links.yml"
}
