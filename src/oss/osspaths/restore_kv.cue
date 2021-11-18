package osspaths

import "github.com/influxdata/openapi/src/oss/ossschemas"

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonresponses"

restore_kv: post: {
	operationId: "PostRestoreKV"
	tags: [
		"Restore",
	]
	summary: "Overwrite the embedded KV store on the server with a backed-up snapshot."
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "header"
		name: "Content-Encoding"
		description: """
			The value tells InfluxDB what compression is applied to the line protocol in the request payload.
			To make an API request with a GZIP payload, send `Content-Encoding: gzip` as a request header.

			"""

		schema: {
			type:        "string"
			description: "The content coding.  Use `gzip` for compressed data or `identity` for unmodified, uncompressed data."
			default:     "identity"
			enum: [
				"gzip",
				"identity",
			]
		}
	}, {
		in:   "header"
		name: "Content-Type"
		schema: {
			type:    "string"
			default: "application/octet-stream"
			enum: [
				"application/octet-stream",
			]
		}
	}]
	requestBody: {
		description: "Full KV snapshot."
		required:    true
		content: {
			// NOTE: Use text-plain here to work around https://github.com/influxdata/oats/issues/16.
			"text/plain": {
				schema: {
					type:   "string"
					format: "binary"
				}
			}
		}
	}
	responses: {
		"204": description: "KV store successfully overwritten."
		"200": {
			// when application/json is specified, we get json back
			description: "KV store successfully overwritten."
			content: "application/json": schema: ossschemas.PostRestoreKVResponse
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
