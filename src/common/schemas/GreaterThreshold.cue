package schemas

GreaterThreshold: allOf: [{
	$ref: "./ThresholdBase.yml"
}, {
	type: "object"
	required: ["type", "value"]
	properties: {
		type: {
			type: "string"
			enum: ["greater"]
		}
		value: {
			type:   "number"
			format: "float"
		}
	}
}]
