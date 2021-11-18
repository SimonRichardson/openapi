package osspaths

replications_replicationID: {
	get: {
		operationId: "GetReplicationByID"
		tags: [
			"Replications",
		]
		summary: "Retrieve a replication"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "replicationID"
			schema: type: "string"
			required: true
		}]
		responses: {
			"200": {
				description: "Replication"
				content: "application/json": schema: $ref: "../schemas/Replication.yml"
			}
			"404": $ref: "../../common/responses/ServerError.yml"
			default: $ref: "../../common/responses/ServerError.yml"
		}
	}

	patch: {
		operationId: "PatchReplicationByID"
		tags: [
			"Replications",
		]
		summary: "Update a replication"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "replicationID"
			schema: type: "string"
			required: true
		}, {
			in:          "query"
			name:        "validate"
			description: "If true, validate the updated information, but don't save it."
			schema: {
				type:    "boolean"
				default: false
			}
		}]
		requestBody: {
			required: true
			content: "application/json": schema: $ref: "../schemas/ReplicationUpdateRequest.yml"
		}
		responses: {
			"204": description: "Updated replication validated, but not saved"
			"200": {
				description: "Updated information saved"
				content: "application/json": schema: $ref: "../schemas/Replication.yml"
			}
			"404": $ref: "../../common/responses/ServerError.yml"
			"400": $ref: "../../common/responses/ServerError.yml"
			default: $ref: "../../common/responses/ServerError.yml"
		}
	}

	delete: {
		operationId: "DeleteReplicationByID"
		tags: [
			"Replications",
		]
		summary: "Delete a replication"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "replicationID"
			schema: type: "string"
			required: true
		}]
		responses: {
			"204": description: "Replication deleted."
			"404": $ref: "../../common/responses/ServerError.yml"
			default: $ref: "../../common/responses/ServerError.yml"
		}
	}
}
