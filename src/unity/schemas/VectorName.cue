package schemas

VectorName: {
	type:        "string"
	description: "Name of the usage vector"
	enum: [
		"storage_gb",
		"writes_mb",
		"reads_gb",
		"query_count",
	]
}
