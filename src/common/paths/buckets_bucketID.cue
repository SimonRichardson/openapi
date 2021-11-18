package paths

buckets_bucketID: {
	get: {
		operationId: "GetBucketsID"
		tags: [
			"Buckets",
		]
		summary: "Retrieve a bucket"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "bucketID"
			schema: type: "string"
			required:    true
			description: "The bucket ID."
		}]
		responses: {
			"200": {
				description: "Bucket details"
				content: "application/json": schema: $ref: "../schemas/Bucket.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	patch: {
		operationId: "PatchBucketsID"
		tags: [
			"Buckets",
		]
		summary: "Update a bucket"
		requestBody: {
			description: "Bucket update to apply"
			required:    true
			content: "application/json": schema: $ref: "../schemas/PatchBucketRequest.yml"
		}
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "bucketID"
			schema: type: "string"
			required:    true
			description: "The bucket ID."
		}]
		responses: {
			"200": {
				description: "An updated bucket"
				content: "application/json": schema: $ref: "../schemas/Bucket.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	delete: {
		operationId: "DeleteBucketsID"
		tags: [
			"Buckets",
		]
		summary: "Delete a bucket"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "bucketID"
			schema: type: "string"
			required:    true
			description: "The ID of the bucket to delete."
		}]
		responses: {
			"204": description: "Delete has been accepted"
			"404": {
				description: "Bucket not found"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
