package commonschemas

View: {
	required: [
		"name",
		"properties",
	]
	properties: {
		links: {
			type:     "object"
			readOnly: true
			properties: self: type: "string"
		}
		id: {
			readOnly: true
			type:     "string"
		}
		name: type: "string"
		properties: ViewProperties.#Ref
	}
}
