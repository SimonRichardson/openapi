package contracts

common: {
	openapi: "3.0.0"
	info: {
		title:   "Influx Common API"
		version: "2.0.1"
	}
	servers: [{
		url: "/api/v2"
	}]
	paths: REF_COMMON_PATHS: "TODO"
	components: {
		parameters: REF_COMMON_PARAMETERS: "TODO"
		schemas: REF_COMMON_SCHEMAS: "TODO"
		responses: ServerError: $ref: "./common/responses/ServerError.yml"
	}
}
