package schemas

SecretKeysResponse: allOf: [{
	$ref: "./SecretKeys.yml"
}, {
	type: "object"
	properties: links: {
		readOnly: true
		type:     "object"
		properties: {
			self: type: "string"
			org: type: "string"
		}
	}
}]
