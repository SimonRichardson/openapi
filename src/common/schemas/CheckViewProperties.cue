package schemas

CheckViewProperties: {
	type: "object"
	required: [
		"type",
		"shape",
		"checkID",
		"queries",
		"colors",
	]
	properties: {
		type: {
			type: "string"
			enum: ["check"]
		}
		shape: {
			type: "string"
			enum: ["chronograf-v2"]
		}
		checkID: type: "string"
		check: $ref: "./Check.yml"
		queries: {
			type: "array"
			items: $ref: "./DashboardQuery.yml"
		}
		colors: {
			description: "Colors define color encoding of data into a visualization"
			type:        "array"
			items: $ref: "./DashboardColor.yml"
		}
		legendColorizeRows: type: "boolean"
		legendHide: type: "boolean"
		legendOpacity: {
			type:   "number"
			format: "float"
		}
		legendOrientationThreshold: type: "integer"
	}
}
