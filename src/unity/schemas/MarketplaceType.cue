package schemas

MarketplaceType: {
	type:        "string"
	description: "marketplace acronym or name"
	enum: [
		"aws",
		"gcm",
		"azure",
	]
}
