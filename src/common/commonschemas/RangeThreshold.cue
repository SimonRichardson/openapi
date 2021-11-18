package commonschemas

RangeThreshold: allOf: [{
	ThresholdBase.#Ref
}, {
	type: "object"
	required: ["type", "min", "max", "within"]
	properties: {
		type: {
			type: "string"
			enum: ["range"]
		}
		min: {
			type:   "number"
			format: "float"
		}
		max: {
			type:   "number"
			format: "float"
		}
		within: type: "boolean"
	}
}]
