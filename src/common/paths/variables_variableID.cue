package paths

variables_variableID: {
	get: {
		operationId: "GetVariablesID"
		tags: [
			"Variables",
		]
		summary: "Retrieve a variable"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:       "path"
			name:     "variableID"
			required: true
			schema: type: "string"
			description: "The variable ID."
		}]
		responses: {
			"200": {
				description: "Variable found"
				content: "application/json": schema: $ref: "../../common/schemas/Variable.yml"
			}
			"404": {
				description: "Variable not found"
				$ref:        "../../common/responses/ServerError.yml"
			}
			default: {
				description: "Internal server error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	delete: {
		operationId: "DeleteVariablesID"
		tags: [
			"Variables",
		]
		summary: "Delete a variable"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:       "path"
			name:     "variableID"
			required: true
			schema: type: "string"
			description: "The variable ID."
		}]
		responses: {
			"204": description: "Variable deleted"
			default: {
				description: "Internal server error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	patch: {
		operationId: "PatchVariablesID"
		summary:     "Update a variable"
		tags: [
			"Variables",
		]
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:       "path"
			name:     "variableID"
			required: true
			schema: type: "string"
			description: "The variable ID."
		}]
		requestBody: {
			description: "Variable update to apply"
			required:    true
			content: "application/json": schema: $ref: "../../common/schemas/Variable.yml"
		}
		responses: {
			"200": {
				description: "Variable updated"
				content: "application/json": schema: $ref: "../../common/schemas/Variable.yml"
			}
			default: {
				description: "Internal server error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	put: {
		operationId: "PutVariablesID"
		summary:     "Replace a variable"
		tags: [
			"Variables",
		]
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:       "path"
			name:     "variableID"
			required: true
			schema: type: "string"
			description: "The variable ID."
		}]
		requestBody: {
			description: "Variable to replace"
			required:    true
			content: "application/json": schema: $ref: "../../common/schemas/Variable.yml"
		}
		responses: {
			"200": {
				description: "Variable updated"
				content: "application/json": schema: $ref: "../../common/schemas/Variable.yml"
			}
			default: {
				description: "Internal server error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
