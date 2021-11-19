package commonschemas

ScatterViewProperties: {
	type: "object"
	required: [
		"type",
		"queries",
		"colors",
		"shape",
		"note",
		"showNoteWhenEmpty",
		"xColumn",
		"yColumn",
		"fillColumns",
		"symbolColumns",
		"xDomain",
		"yDomain",
		"xAxisLabel",
		"yAxisLabel",
		"xPrefix",
		"yPrefix",
		"xSuffix",
		"ySuffix",
	]
	properties: {
		timeFormat: type: "string"
		type: {
			type: "string"
			enum: ["scatter"]
		}
		queries: {
			type:  "array"
			items: DashboardQuery.#Ref
		}
		colors: {
			description: "Colors define color encoding of data into a visualization"
			type:        "array"
			items: type: "string"
		}
		shape: {
			type: "string"
			enum: ["chronograf-v2"]
		}
		note: type: "string"
		showNoteWhenEmpty: {
			description: "If true, will display note when empty"
			type:        "boolean"
		}
		xColumn: type: "string"
		generateXAxisTicks: {
			type: "array"
			items: type: "string"
		}
		xTotalTicks: type: "integer"
		xTickStart: {
			type:   "number"
			format: "float"
		}
		xTickStep: {
			type:   "number"
			format: "float"
		}
		yColumn: type: "string"
		generateYAxisTicks: {
			type: "array"
			items: type: "string"
		}
		yTotalTicks: type: "integer"
		yTickStart: {
			type:   "number"
			format: "float"
		}
		yTickStep: {
			type:   "number"
			format: "float"
		}
		fillColumns: {
			type: "array"
			items: type: "string"
		}
		symbolColumns: {
			type: "array"
			items: type: "string"
		}
		xDomain: {
			type: "array"
			items: type: "number"
			maxItems: 2
		}
		yDomain: {
			type: "array"
			items: type: "number"
			maxItems: 2
		}
		xAxisLabel: type:         "string"
		yAxisLabel: type:         "string"
		xPrefix: type:            "string"
		xSuffix: type:            "string"
		yPrefix: type:            "string"
		ySuffix: type:            "string"
		legendColorizeRows: type: "boolean"
		legendHide: type:         "boolean"
		legendOpacity: {
			type:   "number"
			format: "float"
		}
		legendOrientationThreshold: type: "integer"
	}
}
