package common

"_responses": {
	"401": $ref: "./common/responses/AuthorizationError.yml"
	"404": $ref: "./common/responses/ResourceNotFoundError.yml"
	"500": $ref: "./common/responses/InternalServerError.yml"
	ServerError: $ref: "./common/responses/ServerError.yml"
	default: $ref: "./common/responses/ServerError.yml"
}
