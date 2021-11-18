package commonschemas

Axes: {
	description: "The viewport for a View's visualizations"
	type:        "object"
	required: ["x", "y"]
	properties: {
		x: $ref: "./Axis.yml"
		y: {// Quoted to prevent YAML parser from interpreting y as shorthand for true.
			$ref: "./Axis.yml"
		}
	}
}
