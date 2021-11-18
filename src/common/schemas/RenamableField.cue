package schemas

RenamableField: {
	description: "Describes a field that can be renamed and made visible or invisible."
	type:        "object"
	properties: {
		internalName: {
			description: "The calculated name of a field."
			readOnly:    true
			type:        "string"
		}
		displayName: {
			description: "The name that a field is renamed to by the user."
			type:        "string"
		}
		visible: {
			description: "Indicates whether this field should be visible on the table."
			type:        "boolean"
		}
	}
}
