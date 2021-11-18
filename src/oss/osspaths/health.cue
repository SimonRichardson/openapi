package osspaths

import "github.com/influxdata/openapi/src/common/commonresponses"

health: get: {
	operationId: "GetHealth"
	tags: [
		"Health",
	]
	summary: "Get the health of an instance"
	servers: [{
		url: ""
	}]
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
	}]
	responses: {
		"200": {
			description: "The instance is healthy"
			content: "application/json": schema: $ref: "../../common/schemas/HealthCheck.yml"
		}
		"503": {
			description: "The instance is unhealthy"
			content: "application/json": schema: $ref: "../../common/schemas/HealthCheck.yml"
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
