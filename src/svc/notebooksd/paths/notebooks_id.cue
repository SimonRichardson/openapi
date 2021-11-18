package paths

notebooks_id: {
	get: {
		summary:     "get single Notebook by its ID"
		operationId: "getNotebook"
		tags: [
			"Notebooks",
		]
		parameters: [{
			name: "id"
			in:   "path"
			schema: type: "string"
			required: true
		}]
		responses: {
			"200": {
				description: "returns the Notebook record"
				content: "application/json": schema: $ref: "../schemas/Notebook.yml"
			}
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
	delete: {
		summary:     "deletes a single Notebook by its ID"
		operationId: "deleteNotebook"
		tags: [
			"Notebooks",
		]
		parameters: [{
			name: "id"
			in:   "path"
			schema: type: "string"
			required: true
		}]
		responses: {
			"204": $ref: "../../../common/responses/NoContent.yml"
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"404": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
	put: {
		summary:     "update a single Notebook by its ID"
		operationId: "putNotebook"
		tags: [
			"Notebooks",
		]
		parameters: [{
			name: "id"
			in:   "path"
			schema: type: "string"
			required: true
		}]
		requestBody: $ref: "../requestBodies/NotebookParams.yml"
		responses: {
			"200": {
				description: "returns the Notebook record"
				content: "application/json": schema: $ref: "../schemas/Notebook.yml"
			}
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
	patch: {
		summary:     "update a single Notebook by its ID"
		operationId: "patchNotebook"
		tags: [
			"Notebooks",
		]
		parameters: [{
			name: "id"
			in:   "path"
			schema: type: "string"
			required: true
		}]
		requestBody: $ref: "../requestBodies/NotebookParams.yml"
		responses: {
			"200": {
				description: "returns the Notebook record"
				content: "application/json": schema: $ref: "../schemas/Notebook.yml"
			}
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
}
