package schemas

Runs: {
	type: "object"
	properties: {
		links: $ref: "./Links.yml"
		runs: {
			type: "array"
			items: $ref: "./Run.yml"
		}
	}
}
