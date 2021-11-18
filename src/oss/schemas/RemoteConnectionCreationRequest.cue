package schemas

RemoteConnectionCreationRequest: {
	type: "object"
	properties: {
		name: type: "string"
		description: type: "string"
		orgID: type: "string"
		remoteURL: {
			type:   "string"
			format: "uri"
		}
		remoteAPIToken: type: "string"
		remoteOrgID: type: "string"
		allowInsecureTLS: {
			type:    "boolean"
			default: false
		}
	}
	required: [
		"name",
		"orgID",
		"remoteURL",
		"remoteAPIToken",
		"remoteOrgID",
		"allowInsecureTLS",
	]
}
