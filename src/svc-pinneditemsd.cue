package contracts

"svc-pinneditemsd": {
	openapi: "3.0.0"
	info: {
		title:   "pinneditemsd"
		version: "1.0.0"
	}
	servers: [{
		url: "/"
	}]
	paths: {
		"/pinned": $ref: "./svc/pinneditemsd/paths/pinned.yml"
		"/pinned/{id}": $ref: "./svc/pinneditemsd/paths/pinned_id.yml"
	}
	components: {
		requestBodies: PinnedItemParams: $ref: "./svc/pinneditemsd/requestBodies/PinnedItemParams.yml"
		schemas: {
			PinnedItem: $ref: "./svc/pinneditemsd/schemas/pinnedItem.yml"
			PinnedItemArray: $ref: "./svc/pinneditemsd/schemas/pinnedItemArray.yml"
			Error: $ref: "./common/schemas/Error.yml"
		}
		responses: {
			NoContent: $ref: "./common/responses/NoContent.yml"
			ServerError: $ref: "./common/responses/ServerError.yml"
		}
	}
}
