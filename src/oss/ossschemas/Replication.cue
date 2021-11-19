package ossschemas

Replication: {
	type: "object"
	properties: {
		id: type:             "string"
		name: type:           "string"
		description: type:    "string"
		orgID: type:          "string"
		remoteID: type:       "string"
		localBucketID: type:  "string"
		remoteBucketID: type: "string"
		maxQueueSizeBytes: {
			type:   "integer"
			format: "int64"
		}
		currentQueueSizeBytes: {
			type:   "integer"
			format: "int64"
		}
		latestResponseCode: type:   "integer"
		latestErrorMessage: type:   "string"
		dropNonRetryableData: type: "boolean"
	}
	required: [
		"id",
		"name",
		"remoteID",
		"orgID",
		"localBucketID",
		"remoteBucketID",
		"maxQueueSizeBytes",
		"currentQueueSizeBytes",
	]
}
