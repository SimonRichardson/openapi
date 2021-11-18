package parameters

Limit: {
	in:       "query"
	name:     "limit"
	required: false
	schema: {
		type:    "integer"
		minimum: 1
		maximum: 100
		default: 20
	}
}
