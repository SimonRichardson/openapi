package schemas

LabelsResponse: {
	type: "object"
	properties: {
		labels: $ref: "./Labels.yml"
		links: $ref: "./Links.yml"
	}
}
