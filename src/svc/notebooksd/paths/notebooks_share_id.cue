package paths

notebooks_share_id: {
	delete: {
		summary:     "deletes a single Share by its ID"
		operationId: "deleteShare"
		tags: [
			"Share",
		]
		parameters: [{
			name: "id"
			in:   "path"
			schema: type: "string"
			required: true
		}]
		responses: {
			"204": $ref: "../../../common/responses/ServerError.yml"
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"404": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
	put: {
		summary:     "update a single Share by its ID"
		operationId: "putShare"
		tags: [
			"Share",
		]
		parameters: [{
			name: "id"
			in:   "path"
			schema: type: "string"
			required: true
		}]
		requestBody: $ref: "../requestBodies/ShareParams.yml"
		responses: {
			"200": {
				description: "returns the Share record"
				content: "application/json": schema: $ref: "../schemas/Share.yml"
			}
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
}
