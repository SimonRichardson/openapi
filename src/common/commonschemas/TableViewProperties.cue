package commonschemas

TableViewProperties: {
	type: "object"
	required: [
		"type",
		"queries",
		"colors",
		"shape",
		"note",
		"showNoteWhenEmpty",
		"tableOptions",
		"fieldOptions",
		"timeFormat",
		"decimalPlaces",
	]
	properties: {
		type: {
			type: "string"
			enum: ["table"]
		}
		queries: {
			type:  "array"
			items: DashboardQuery.#Ref
		}
		colors: {
			description: "Colors define color encoding of data into a visualization"
			type:        "array"
			items:       DashboardColor.#Ref
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
		tableOptions: {
			type: "object"
			properties: {
				verticalTimeAxis: {
					description: "verticalTimeAxis describes the orientation of the table by indicating whether the time axis will be displayed vertically"

					type: "boolean"
				}
				sortBy: RenamableField.#Ref
				wrapping: {
					description: "Wrapping describes the text wrapping style to be used in table views"
					type:        "string"
					enum: [
						"truncate",
						"wrap",
						"single-line",
					]
				}
				fixFirstColumn: {
					description: "fixFirstColumn indicates whether the first column of the table should be locked"

					type: "boolean"
				}
			}
		}
		fieldOptions: {
			description: "fieldOptions represent the fields retrieved by the query with customization options"

			type:  "array"
			items: RenamableField.#Ref
		}
		timeFormat: {
			description: "timeFormat describes the display format for time values according to moment.js date formatting"

			type: "string"
		}
		decimalPlaces: DecimalPlaces.#Ref
	}
}
