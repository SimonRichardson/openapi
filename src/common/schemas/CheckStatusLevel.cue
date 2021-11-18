package schemas

CheckStatusLevel: {
	description: "The state to record if check matches a criteria."
	type:        "string"
	enum: ["UNKNOWN", "OK", "INFO", "CRIT", "WARN"]
}
