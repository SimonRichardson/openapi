package schemas

RunManually: properties: scheduledFor: {
	nullable:    true
	description: "Time used for run's \"now\" option, RFC3339.  Default is the server's now time."
	type:        "string"
	format:      "date-time"
}
