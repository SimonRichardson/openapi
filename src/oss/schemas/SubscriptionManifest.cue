package schemas

SubscriptionManifest: {
	type: "object"
	properties: {
		name: type: "string"
		mode: type: "string"
		destinations: {
			type: "array"
			items: type: "string"
		}
	}
	required: ["name", "mode", "destinations"]
}
