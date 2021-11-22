package notebooksdpaths

import (
	"github.com/influxdata/openapi/src/svc/pinneditemsd/pinneditemsdschemas"
	"github.com/influxdata/openapi/src/svc/pinneditemsd/pinneditemsdrequestBodies"
	"github.com/influxdata/openapi/src/common/commonresponses"
)
pinned: {
	get: {
		summary:     "get all pinned items"
		operationId: "getPinnedItems"
		tags: [
			"PinnedItems",
		]
		responses: {
			"200": {
				description: "returns all pinned items for a given user"
				content: "application/json": schema: pinneditemsdschemas.PinnedItemArray.#Ref
			}
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
		}
	}
	post: {
		summary:     "creates a Pinned Item"
		operationId: "createPinnedItem"
		tags: [
			"PinnedItems",
		]
		requestBody: {
			pinneditemsdrequestBodies.PinnedItemParams.#Ref
			required: true
		}
		responses: {
			"200": {
				description: "Pinned item record created"
				content: "application/json": schema: pinneditemsdschemas.PinnedItem.#Ref
			}
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
		}
	}
}
