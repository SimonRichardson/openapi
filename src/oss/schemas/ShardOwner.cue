package schemas

ShardOwner: {
	type: "object"
	properties: nodeID: {
		type:        "integer"
		format:      "int64"
		description: "ID of the node that owns a shard."
	}
	required: ["nodeID"]
}
