package schemas

TemplateEnvReferences: {
	type: "array"
	items: {
		type: "object"
		properties: {
			resourceField: {
				type:        "string"
				description: "Field the environment reference corresponds too"
			}
			envRefKey: {
				type:        "string"
				description: "Key identified as environment reference and is the key identified in the template"
			}
			value: {
				description: "Value provided to fulfill reference"
				nullable:    true
				oneOf: [{
					type: "string"
				}, {
					type: "integer"
				}, {
					type: "number"
				}, {
					type: "boolean"
				}]
			}
			defaultValue: {
				description: "Default value that will be provided for the reference when no value is provided"
				nullable:    true
				oneOf: [{
					type: "string"
				}, {
					type: "integer"
				}, {
					type: "number"
				}, {
					type: "boolean"
				}]
			}
		}
		required: ["resourceField", "envRefKey"]
	}
}
