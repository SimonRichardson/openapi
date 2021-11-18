package schemas

BucketShardMapping: {
	type: "object"
	properties: {
		oldId: {
			type:   "integer"
			format: "int64"
		}
		newId: {
			type:   "integer"
			format: "int64"
		}
	}
	required: ["oldId", "newId"]
}
