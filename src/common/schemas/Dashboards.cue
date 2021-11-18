package schemas

Dashboards: {
	type: "object"
	properties: {
		links: $ref: "./Links.yml"
		dashboards: {
			type: "array"
			items: $ref: "./Dashboard.yml"
		}
	}
}
