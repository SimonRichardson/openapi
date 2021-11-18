package schemas

RemoteConnection: {
	type: "object"
	properties: {
		id: type: "string"
		name: type: "string"
		orgID: type: "string"
		description: type: "string"
		remoteURL: {
			type:   "string"
			format: "uri"
		}
		remoteOrgID: type: "string"
		allowInsecureTLS: {
			type:    "boolean"
			default: false
		}
	}
	required: [
		"id",
		"name",
		"orgID",
		"remoteURL",
		"remoteOrgID",
		"allowInsecureTLS",
	]
}
