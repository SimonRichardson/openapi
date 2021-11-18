package osspaths

import "github.com/influxdata/openapi/src/common/commonresponses"

backup_metadata: get: {
	operationId: "GetBackupMetadata"
	tags: [
		"Backup",
	]
	summary: "Download snapshot of all metadata in the server"
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
	}, {
		in:          "header"
		name:        "Accept-Encoding"
		description: "Indicates the content encoding (usually a compression algorithm) that the client can understand."
		schema: {
			type:        "string"
			description: "The content coding.  Use `gzip` for compressed data or `identity` for unmodified, uncompressed data."
			default:     "identity"
			enum: [
				"gzip",
				"identity",
			]
		}
	}]
	responses: {
		"200": {
			description: "Snapshot of metadata"
			headers: "Content-Encoding": {
				description: "Lists any encodings (usually compression algorithms) that have been applied to the response payload."
				schema: {
					type: "string"
					description: """
						The content coding: `gzip` for compressed data or `identity` for unmodified, uncompressed data.

						"""

					default: "identity"
					enum: [
						"gzip",
						"identity",
					]
				}
			}
			content: "multipart/mixed": schema: $ref: "../schemas/MetadataBackup.yml"
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
