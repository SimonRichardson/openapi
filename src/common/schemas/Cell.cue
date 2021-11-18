package schemas

Cell: {
	type: "object"
	properties: {
		id: type: "string"
		links: {
			type: "object"
			properties: {
				self: type: "string"
				view: type: "string"
			}
		}
		x: {
			type:   "integer"
			format: "int32"
		}
		y: {// Quoted to prevent YAML parser from interpreting y as shorthand for true.
			type:   "integer"
			format: "int32"
		}
		w: {
			type:   "integer"
			format: "int32"
		}
		h: {
			type:   "integer"
			format: "int32"
		}
		viewID: {
			type:        "string"
			description: "The reference to a view from the views API."
		}
	}
}
