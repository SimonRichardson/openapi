package schemas

LabelResponse: {
	type: "object"
	properties: {
		label: $ref: "./Label.yml"
		links: $ref: "./Links.yml"
	}
}
