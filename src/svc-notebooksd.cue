package contracts

"svc-notebooksd": {
	openapi: "3.0.0"
	info: {
		title:   "notebooksd"
		version: "1.0.0"
	}
	servers: [{
		url: "/"
	}]
	paths: {
		"/notebooks": $ref: "./svc/notebooksd/paths/notebooks.yml"
		"/notebooks/{id}": $ref: "./svc/notebooksd/paths/notebooks_id.yml"
		"/notebooks/share": $ref: "./svc/notebooksd/paths/notebooks_share.yml"
		"/notebooks/share/{id}": $ref: "./svc/notebooksd/paths/notebooks_share_id.yml"
		"/api/share/{id}/query/{pipeID}": $ref: "./svc/notebooksd/paths/api_share_id_query_pipeid.yml"
		"/api/share/{id}": $ref: "./svc/notebooksd/paths/api_share_id.yml"
	}
	components: {
		requestBodies: {
			NotebookParams: $ref: "./svc/notebooksd/requestBodies/NotebookParams.yml"
			ShareParams: $ref: "./svc/notebooksd/requestBodies/ShareParams.yml"
		}
		schemas: {
			NotebookParams: $ref: "./svc/notebooksd/schemas/NotebookParams.yml"
			Notebook: $ref: "./svc/notebooksd/schemas/Notebook.yml"
			NotebookArray: $ref: "./svc/notebooksd/schemas/NotebookArray.yml"
			Notebooks: $ref: "./svc/notebooksd/schemas/Notebooks.yml"
			ShareParams: $ref: "./svc/notebooksd/schemas/ShareParams.yml"
			Share: $ref: "./svc/notebooksd/schemas/Share.yml"
			Shares: $ref: "./svc/notebooksd/schemas/Shares.yml"
			Error: $ref: "./common/schemas/Error.yml"
		}
		responses: {
			NoContent: $ref: "./common/responses/NoContent.yml"
			ServerError: $ref: "./common/responses/ServerError.yml"
		}
	}
}
