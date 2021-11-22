package cloudschemas

import (
	"github.com/influxdata/openapi/src/common/commonschemas"
)

Variable: {
	type: "object"
	required: [
		"name",
		"orgID",
		"arguments",
	]
	properties: {
		links: {
			type:     "object"
			readOnly: true
			properties: {
				self: {
					type:   "string"
					format: "uri"
				}
				org: {
					type:   "string"
					format: "uri"
				}
				labels: {
					type:   "string"
					format: "uri"
				}
			}
		}
		id: {
			readOnly: true
			type:     "string"
		}
		orgID: type:       "string"
		name: type:        "string"
		description: type: "string"
		selected: {
			type: "array"
			items: type: "string"
		}
		sort_order: type: "integer"
		labels:    commonschemas.Labels.#Ref
		arguments: commonschemas.VariableProperties.#Ref
		createdAt: {
			type:   "string"
			format: "date-time"
		}
		updatedAt: {
			type:   "string"
			format: "date-time"
		}
	}
}
