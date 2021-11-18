package commonschemas

Axis: {
	type:        "object"
	description: "The description of a particular axis for a visualization."
	properties: {
		bounds: {
			type:        "array"
			minItems:    0
			maxItems:    2
			description: "The extents of an axis in the form [lower, upper]. Clients determine whether bounds are to be inclusive or exclusive of their limits"

			items: type: "string"
		}
		label: {
			description: "Label is a description of this Axis"
			type:        "string"
		}
		prefix: {
			description: "Prefix represents a label prefix for formatting axis values."
			type:        "string"
		}
		suffix: {
			description: "Suffix represents a label suffix for formatting axis values."
			type:        "string"
		}
		base: {
			description: "Base represents the radix for formatting axis values."
			type:        "string"
			enum: ["", "2", "10"]
		}
		scale: AxisScale.#Ref
	}
}
