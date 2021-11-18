package schemas

LimitPublic: {
	type:        "object"
	description: "These are org limits similar to those configured in/by quartz."
	properties: {
		links: $ref: "../../common/schemas/Links.yml"
		limits: $ref: "./Limit.yml"
	}
}
