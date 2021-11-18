package schemas

MeasurementSchemaList: {
	description: "A list of measurement schemas returning summary information"
	example: measurementSchemas: [{
		id:        "1a3c5e7f9b0a8642"
		orgID:     "0a3c5e7f9b0a0001"
		bucketID:  "ba3c5e7f9b0a0010"
		name:      "cpu"
		createdAt: "2021-01-21T00:48:40.993Z"
		updatedAt: "2021-01-21T00:48:40.993Z"
	}, {
		id:        "1a3c5e7f9b0a8643"
		orgID:     "0a3c5e7f9b0a0001"
		bucketID:  "ba3c5e7f9b0a0010"
		name:      "memory"
		createdAt: "2021-01-21T00:48:40.993Z"
		updatedAt: "2021-01-21T00:48:40.993Z"
	}, {
		id:        "1a3c5e7f9b0a8644"
		orgID:     "0a3c5e7f9b0a0001"
		bucketID:  "ba3c5e7f9b0a0010"
		name:      "disk"
		createdAt: "2021-01-21T00:48:40.993Z"
		updatedAt: "2021-01-21T00:48:40.993Z"
	}]
	type: "object"
	required: ["measurementSchemas"]
	properties: measurementSchemas: {
		type: "array"
		items: $ref: "./MeasurementSchema.yml"
	}
}
