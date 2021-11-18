package schemas

GeoCircleViewLayer: allOf: [{
	$ref: "./GeoViewLayerProperties.yml"
}, {
	type: "object"
	required: ["radiusField", "radiusDimension", "colorField", "colorDimension", "colors"]
	properties: {
		radiusField: {
			type:        "string"
			description: "Radius field"
		}
		radiusDimension: $ref: "./Axis.yml"
		colorField: {
			type:        "string"
			description: "Circle color field"
		}
		colorDimension: $ref: "./Axis.yml"
		colors: {
			description: "Colors define color encoding of data into a visualization"
			type:        "array"
			items: $ref: "./DashboardColor.yml"
		}
		radius: {
			description: "Maximum radius size in pixels"
			type:        "integer"
		}
		interpolateColors: {
			description: "Interpolate circle color based on displayed value"
			type:        "boolean"
		}
	}
}]
