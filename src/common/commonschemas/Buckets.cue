package commonschemas

Buckets: {
	type: "object"
	properties: {
		links: {
			readOnly: true
			$ref:     "./Links.yml"
		}
		buckets: {
			type: "array"
			items: $ref: "./Bucket.yml"
		}
	}
}
