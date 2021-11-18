package commonschemas

HistogramViewProperties: {
	type: "object"
	required: [
		"type",
		"queries",
		"colors",
		"shape",
		"note",
		"showNoteWhenEmpty",
		"xColumn",
		"fillColumns",
		"xDomain",
		"xAxisLabel",
		"position",
		"binCount",
	]
	properties: {
		type: {
			type: "string"
			enum: ["histogram"]
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
		xColumn: type: "string"
		fillColumns: {
			type: "array"
			items: type: "string"
		}
		xDomain: {
			type: "array"
			items: {
				type:   "number"
				format: "float"
			}
		}
		xAxisLabel: type: "string"
		position: {
			type: "string"
			enum: ["overlaid", "stacked"]
		}
		binCount: type: "integer"
		legendColorizeRows: type: "boolean"
		legendHide: type: "boolean"
		legendOpacity: {
			type:   "number"
			format: "float"
		}
		legendOrientationThreshold: type: "integer"
	}
}
