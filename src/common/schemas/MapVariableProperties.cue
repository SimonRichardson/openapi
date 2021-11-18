package schemas

MapVariableProperties: properties: {
	type: {
		type: "string"
		enum: ["map"]
	}
	values: {
		type: "object"
		additionalProperties: type: "string"
	}
}
