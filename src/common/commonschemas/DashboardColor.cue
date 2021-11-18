package commonschemas

DashboardColor: {
	type:        "object"
	description: "Defines an encoding of data value into color space."
	required: ["id", "type", "hex", "name", "value"]
	properties: {
		id: {
			description: "The unique ID of the view color."
			type:        "string"
		}
		type: {
			description: "Type is how the color is used."
			type:        "string"
			enum: [
				"min",
				"max",
				"threshold",
				"scale",
				"text",
				"background",
			]
		}
		hex: {
			description: "The hex number of the color"
			type:        "string"
			maxLength:   7
			minLength:   7
		}
		name: {
			description: "The user-facing name of the hex color."
			type:        "string"
		}
		value: {
			description: "The data value mapped to this color."
			type:        "number"
			format:      "float"
		}
	}
}
