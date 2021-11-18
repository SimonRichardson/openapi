package schemas

DBRPCreate: {
	type: "object"
	properties: {
		orgID: {
			type:        "string"
			description: "the organization ID that owns this mapping."
		}
		org: {
			type:        "string"
			description: "the organization that owns this mapping."
		}
		bucketID: {
			type:        "string"
			description: "the bucket ID used as target for the translation."
		}
		database: {
			type:        "string"
			description: "InfluxDB v1 database"
		}
		retention_policy: {
			type:        "string"
			description: "InfluxDB v1 retention policy"
		}
		default: {
			type:        "boolean"
			description: "Specify if this mapping represents the default retention policy for the database specificed."
		}
	}
	required: [
		"bucketID",
		"database",
		"retention_policy",
	]
}
