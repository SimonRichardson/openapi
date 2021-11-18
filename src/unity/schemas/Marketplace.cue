package schemas

Marketplace: {
	properties: {
		name: {
			description: "full name of the marketplace"
			type:        "string"
			example:     "Google Cloud Marketplace"
		}
		shortName: {
			description: "marketplace acronyms"
			$ref:        "./MarketplaceType.yml"
			example:     "gcm"
		}
		url: {
			description: "link to marketplace"
			type:        "string"
		}
	}
	required: ["name", "shortName", "url"]
}
