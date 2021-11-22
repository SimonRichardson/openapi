package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

delete: post: {
	operationId: "PostDelete"
	tags: [
		"Delete",
	]
	summary: "Delete data"
	requestBody: {
		description: "Deletes data from an InfluxDB bucket."
		required:    true
		content: "application/json": schema: commonschemas.DeletePredicateRequest.#Ref
	}
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:          "query"
		name:        "org"
		description: "Specifies the organization to delete data from."
		schema: {
			type:        "string"
			description: "Only points from this organization are deleted."
		}
	}, {
		in:          "query"
		name:        "bucket"
		description: "Specifies the bucket to delete data from."
		schema: {
			type:        "string"
			description: "Only points from this bucket are deleted."
		}
	}, {
		in:          "query"
		name:        "orgID"
		description: "Specifies the organization ID of the resource."
		schema: type: "string"
	}, {
		in:          "query"
		name:        "bucketID"
		description: "Specifies the bucket ID to delete data from."
		schema: {
			type:        "string"
			description: "Only points from this bucket ID are deleted."
		}
	}]
	responses: {
		"204": description: "delete has been accepted"
		"400": {
			description: "Invalid request."
			content: "application/json": schema: commonschemas.Error.#Ref
		}
		"404": {
			description: "the bucket or organization is not found."
			content: "application/json": schema: commonschemas.Error.#Ref
		}
		"403": {
			description: "no token was sent or does not have sufficient permissions."
			content: "application/json": schema: commonschemas.Error.#Ref
		}
		default: {
			description: "internal server error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
