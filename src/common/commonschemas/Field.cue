package commonschemas

Field: {
	type: "object"
	properties: {
		value: {
			description: "value is the value of the field.  Meaning of the value is implied by the `type` key"

			type: "string"
		}
		type: {
			description: "`type` describes the field type. `func` is a function. `field` is a field reference."

			type: "string"
			enum: [
				"func",
				"field",
				"integer",
				"number",
				"regex",
				"wildcard",
			]
		}
		alias: {
			description: "Alias overrides the field name in the returned response.  Applies only if type is `func`"

			type: "string"
		}
		args: {
			description: "Args are the arguments to the function"
			type:        "array"
			items: Field.#Ref
		}
	}
}
