package schemas

Label: {
	type: "object"
	properties: {
		id: {
			readOnly: true
			type:     "string"
		}
		orgID: {
			readOnly: true
			type:     "string"
		}
		name: type: "string"
		properties: {
			type: "object"
			additionalProperties: type: "string"
			description: "Key/Value pairs associated with this label. Keys can be removed by sending an update with an empty value."
			example: {color: "ffb3b3", description: "this is a description"}
		}
	}
}
