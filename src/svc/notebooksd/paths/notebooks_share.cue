package paths

notebooks_share: {
	get: {
		summary:     "get all Share records in org"
		operationId: "getAllShares"
		tags: [
			"Share",
		]
		parameters: [{
			name: "orgID"
			in:   "query"
			schema: type: "string"
			required: true
		}, {
			name: "notebookID"
			in:   "query"
			schema: type: "string"
			required: false
		}]
		responses: {
			"200": {
				description: "returns all Share records in org"
				content: "application/json": schema: $ref: "../schemas/Shares.yml"
			}
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
	post: {
		summary:     "creates a Share"
		operationId: "createShare"
		tags: [
			"Share",
		]
		requestBody: $ref: "../requestBodies/ShareParams.yml"
		responses: {
			"200": {
				description: "Share created"
				content: "application/json": schema: $ref: "../schemas/Share.yml"
			}
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
}
