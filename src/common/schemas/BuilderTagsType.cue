package schemas

BuilderTagsType: {
	type: "object"
	properties: {
		key: type: "string"
		values: {
			type: "array"
			items: type: "string"
		}
		aggregateFunctionType: $ref: "./BuilderAggregateFunctionType.yml"
	}
}
