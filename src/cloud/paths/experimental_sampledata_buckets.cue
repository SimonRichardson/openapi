package paths

experimental_sampledata_buckets: get: {
	operationId: "GetDemoDataBuckets"
	tags: [
		"DemoDataBuckets",
	]
	summary: "List of Demo Data Buckets"
	responses: {
		"200": {
			description: "A list of demo data buckets"
			content: "application/json": schema: $ref: "../schemas/DemoDataBuckets.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
