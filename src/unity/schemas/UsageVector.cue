package schemas

UsageVector: {
	properties: {
		name: {
			description: "name of usage vector"
			type:        "string"
			example:     "storage"
		}
		unit: {
			description: "unit for usage vector"
			type:        "string"
			example:     "GB-hr"
		}
		fluxKey: {
			description: "key in flux response"
			type:        "string"
			example:     "storage_gb"
		}
	}
	required: ["name", "unit", "fluxKey"]
}
