package paths

buckets_bucketID_owners_userID: delete: {
	operationId: "DeleteBucketsIDOwnersID"
	tags: [
		"Buckets",
	]
	summary: "Remove an owner from a bucket"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "userID"
		schema: type: "string"
		required:    true
		description: "The ID of the owner to remove."
	}, {
		in:   "path"
		name: "bucketID"
		schema: type: "string"
		required:    true
		description: "The bucket ID."
	}]
	responses: {
		"204": description: "Owner removed"
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
