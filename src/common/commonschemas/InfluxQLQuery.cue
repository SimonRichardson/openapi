package commonschemas

InfluxQLQuery: {
	description: "Query influx using the InfluxQL language"
	type:        "object"
	required: [
		"query",
	]
	properties: {
		query: {
			description: "InfluxQL query execute."
			type:        "string"
		}
		type: {
			description: "The type of query. Must be \"influxql\"."
			type:        "string"
			enum: [
				"influxql",
			]
		}
		bucket: {
			description: "Bucket is to be used instead of the database and retention policy specified in the InfluxQL query."
			type:        "string"
		}
	}
}
