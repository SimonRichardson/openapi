package schemas

ScraperTargetRequest: {
	type: "object"
	properties: {
		name: {
			type:        "string"
			description: "The name of the scraper target."
		}
		type: {
			type:        "string"
			description: "The type of the metrics to be parsed."
			enum: ["prometheus"]
		}
		url: {
			type:        "string"
			description: "The URL of the metrics endpoint."
			example:     "http://localhost:9090/metrics"
		}
		orgID: {
			type:        "string"
			description: "The organization ID."
		}
		bucketID: {
			type:        "string"
			description: "The ID of the bucket to write to."
		}
		allowInsecure: {
			type:        "boolean"
			description: "Skip TLS verification on endpoint."
			default:     false
		}
	}
}
