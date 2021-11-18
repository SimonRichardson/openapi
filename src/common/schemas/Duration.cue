package schemas

Duration: {
	description: "A pair consisting of length of time and the unit of time measured. It is the atomic unit from which all duration literals are composed."
	type:        "object"
	properties: {
		type: $ref: "./NodeType.yml"
		magnitude: type: "integer"
		unit: type: "string"
	}
}
