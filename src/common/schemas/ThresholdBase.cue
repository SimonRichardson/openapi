package schemas

ThresholdBase: properties: {
	level: $ref: "./CheckStatusLevel.yml"
	allValues: {
		description: "If true, only alert if all values meet threshold."
		type:        "boolean"
	}
}
