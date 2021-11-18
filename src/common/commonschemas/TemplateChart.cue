package commonschemas

TemplateChart: {
	type: "object"
	properties: {
		xPos: type: "integer"
		yPos: type: "integer"
		height: type: "integer"
		width: type: "integer"
		properties: {// field name is properties
			$ref: "./ViewProperties.yml"
		}
	}
}
