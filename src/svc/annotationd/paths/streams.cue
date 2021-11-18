package paths

streams: {
	put: {
		tags: [
			"Streams",
		]
		operationId: "createUpdateStream"
		summary:     "Create or update stream"
		requestBody: {
			description: "Stream to create or update"
			content: "application/json": schema: $ref: "../schemas/Stream.yml"
		}
		responses: {
			"200": {
				description: "Stream as created/updated"
				content: "application/json": schema: $ref: "../schemas/ReadStream.yml"
			}
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
	get: {
		tags: [
			"Streams",
		]
		operationId: "getStreams"
		summary:     "Get streams"
		parameters: [{
			$ref: "../parameters/StreamListFilter.yml"
		}]
		responses: {
			"200": {
				description: "Optionally filtered list of streams"
				content: "application/json": schema: $ref: "../schemas/StreamList.yml"
			}
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
	delete: {
		tags: [
			"Streams",
		]
		operationId: "deleteStream"
		summary:     "Delete stream"
		parameters: [{
			$ref: "../parameters/StreamDeleteFilter.yml"
		}]
		responses: {
			"204": $ref: "../../../common/responses/NoContent.yml"
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
}
