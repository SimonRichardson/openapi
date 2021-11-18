package schemas

GeoViewLayerProperties: {
	type: "object"
	required: ["type"]
	properties: type: {
		type: "string"
		enum: ["heatmap", "circleMap", "pointMap", "trackMap"]
	}
}
