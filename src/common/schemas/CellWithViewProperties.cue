package schemas

CellWithViewProperties: {
	type: "object"
	allOf: [{
		$ref: "./Cell.yml"
	}, {
		type: "object"
		properties: {
			name: type: "string"
			properties: $ref: "./ViewProperties.yml"
		}
	}]
}
