package schemas

CellUpdate: {
	type: "object"
	properties: {
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
	}
}
