package commonschemas

XYViewProperties: {
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
		"position",
	]
	properties: {
		timeFormat: type: "string"
		type: {
			type: "string"
			enum: ["xy"]
		}
		queries: {
			type: "array"
			items: DashboardQuery.#Ref
		}
		colors: {
			description: "Colors define color encoding of data into a visualization"
			type:        "array"
			items: DashboardColor.#Ref
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
		axes: Axes.#Ref
		staticLegend: StaticLegend.#Ref
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
		shadeBelow: type: "boolean"
		hoverDimension: {
			type: "string"
			enum: ["auto", "x", "y", "xy"]
		}
		position: {
			type: "string"
			enum: ["overlaid", "stacked"]
		}
		geom: XYGeom.#Ref
		legendColorizeRows: type: "boolean"
		legendHide: type: "boolean"
		legendOpacity: {
			type:   "number"
			format: "float"
		}
		legendOrientationThreshold: type: "integer"
	}
}
