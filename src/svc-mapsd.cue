package contracts

"svc-mapsd": {
	openapi: "3.0.0"
	info: {
		title:   "Maps service"
		version: "0.1.0"
	}
	servers: [{
		url: "/api/v1"
	}]
	paths: "/mapToken": $ref: "./svc/mapsd/paths/mapToken.yml"
	components: {
		schemas: {
			Token: $ref: "./svc/mapsd/schemas/Token.yml"
			Error: $ref: "./common/schemas/Error.yml"
		}
		responses: ServerError: $ref: "./common/responses/ServerError.yml"
	}
}
