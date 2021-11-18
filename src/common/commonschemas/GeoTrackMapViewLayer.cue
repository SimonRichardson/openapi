package commonschemas

GeoTrackMapViewLayer: {
	allOf: [{
		GeoViewLayerProperties.#Ref
	}, {
		type: "object"
		required: ["trackWidth", "speed", "randomColors", "trackPointVisualization"]
	}]
	properties: {
		trackWidth: {
			description: "Width of the track"
			type:        "integer"
		}
		speed: {
			description: "Speed of the track animation"
			type:        "integer"
		}
		randomColors: {
			description: "Assign different colors to different tracks"
			type:        "boolean"
		}
		colors: {
			description: "Colors define color encoding of data into a visualization"
			type:        "array"
			items: DashboardColor.#Ref
		}
	}
}
