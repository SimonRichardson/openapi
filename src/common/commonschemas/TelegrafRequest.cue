package commonschemas

TelegrafRequest: {
	type: "object"
	properties: {
		name: type: "string"
		description: type: "string"
		metadata: {
			type: "object"
			properties: buckets: {
				type: "array"
				items: type: "string"
			}
		}
		config: type: "string"
		orgID: type: "string"
	}
}
