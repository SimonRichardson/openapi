package schemas

Organization: {
	type: "object"
	properties: {
		id: {
			description: "the IDPE organization ID"
			readOnly:    true
			type:        "string"
		}
		apiUrl: {
			description: "URL for talking to a specific cluster"
			readOnly:    true
			type:        "string"
		}
		region: {
			description: "name of the region within the cloud provider"
			type:        "string"
		}
		provider: {
			description: "name of the cloud provider"
			type:        "string"
			enum: [
				"AWS",
				"GCP",
				"Azure",
			]
		}
	}
}
