package schemas

BandViewProperties: {
	type: "object"
	required: [
		"type",
		"geom",
		"queries",
		"shape",
		"axes",
		"colors",
		"note",
		"showNoteWhenEmpty",
	]
	properties: {
		timeFormat: type: "string"
		type: {
			type: "string"
			enum: ["band"]
		}
		queries: {
			type: "array"
			items: $ref: "./DashboardQuery.yml"
		}
		colors: {
			description: "Colors define color encoding of data into a visualization"
			type:        "array"
			items: $ref: "./DashboardColor.yml"
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
		axes: $ref: "./Axes.yml"
		staticLegend: $ref: "./StaticLegend.yml"
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
		upperColumn: type: "string"
		mainColumn: type: "string"
		lowerColumn: type: "string"
		hoverDimension: {
			type: "string"
			enum: ["auto", "x", "y", "xy"]
		}
		geom: $ref: "./XYGeom.yml"
		legendColorizeRows: type: "boolean"
		legendHide: type: "boolean"
		legendOpacity: {
			type:   "number"
			format: "float"
		}
		legendOrientationThreshold: type: "integer"
	}
}
