package schemas

SecretKeys: {
	type: "object"
	properties: secrets: {
		type: "array"
		items: type: "string"
	}
}
