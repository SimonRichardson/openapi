package schemas

DecimalPlaces: {
	description: "Indicates whether decimal places should be enforced, and how many digits it should show."
	type:        "object"
	properties: {
		isEnforced: {
			description: "Indicates whether decimal point setting should be enforced"
			type:        "boolean"
		}
		digits: {
			description: "The number of digits after decimal to display"
			type:        "integer"
			format:      "int32"
		}
	}
}
