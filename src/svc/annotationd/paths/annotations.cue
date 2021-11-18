package paths

annotations: {
	post: {
		tags: [
			"Annotations",
		]
		operationId: "createAnnotations"
		summary:     "Create annotations"
		requestBody: {
			description: "Annotations to create"
			content: "application/json": schema: $ref: "../schemas/AnnotationCreateList.yml"
		}
		responses: {
			"200": {
				description: "Annotations created"
				content: "application/json": schema: $ref: "../schemas/AnnotationEventList.yml"
			}
			"204": $ref: "../../../common/responses/NoContent.yml"
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
	get: {
		tags: [
			"Annotations",
		]
		operationId: "listAnnotations"
		summary:     "List annotations"
		parameters: [{
			$ref: "../parameters/AnnotationListFilter.yml"
		}]
		responses: {
			"200": {
				description: "Optionally filtered list of annotations"
				content: "application/json": schema: $ref: "../schemas/AnnotationList.yml"
			}
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
	delete: {
		tags: [
			"Annotations",
		]
		operationId: "deleteAnnotations"
		summary:     "Delete annotation"
		parameters: [{
			$ref: "../parameters/AnnotationDeleteFilter.yml"
		}]
		responses: {
			"204": $ref: "../../../common/responses/NoContent.yml"
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
}
