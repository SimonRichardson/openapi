package schemas

HeatmapViewProperties: {
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
		"xDomain",
		"yDomain",
		"xAxisLabel",
		"yAxisLabel",
		"xPrefix",
		"yPrefix",
		"xSuffix",
		"ySuffix",
		"binSize",
	]
	properties: {
		timeFormat: type: "string"
		type: {
			type: "string"
			enum: ["heatmap"]
		}
		queries: {
			type: "array"
			items: $ref: "./DashboardQuery.yml"
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
		xAxisLabel: type: "string"
		yAxisLabel: type: "string"
		xPrefix: type: "string"
		xSuffix: type: "string"
		yPrefix: type: "string"
		ySuffix: type: "string"
		binSize: type: "number"
		legendColorizeRows: type: "boolean"
		legendHide: type: "boolean"
		legendOpacity: {
			type:   "number"
			format: "float"
		}
		legendOrientationThreshold: type: "integer"
	}
}
