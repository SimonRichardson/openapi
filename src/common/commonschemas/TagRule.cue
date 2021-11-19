package commonschemas

TagRule: {
	type: "object"
	properties: {
		key: type:   "string"
		value: type: "string"
		operator: {
			type: "string"
			enum: ["equal", "notequal", "equalregex", "notequalregex"]
		}
	}
}
