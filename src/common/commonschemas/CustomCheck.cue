package commonschemas

CustomCheck: allOf: [{
	$ref: "./CheckBase.yml"
}, {
	type: "object"
	properties: type: {
		type: "string"
		enum: ["custom"]
	}
	required: ["type"]
}]
