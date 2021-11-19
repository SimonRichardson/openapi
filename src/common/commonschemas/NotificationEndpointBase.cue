package commonschemas

NotificationEndpointBase: {
	type: "object"
	required: ["type", "name"]
	properties: {
		id: type:     "string"
		orgID: type:  "string"
		userID: type: "string"
		createdAt: {
			type:     "string"
			format:   "date-time"
			readOnly: true
		}
		updatedAt: {
			type:     "string"
			format:   "date-time"
			readOnly: true
		}
		description: {
			description: "An optional description of the notification endpoint."
			type:        "string"
		}
		name: type: "string"
		status: {
			description: "The status of the endpoint."
			default:     "active"
			type:        "string"
			enum: ["active", "inactive"]
		}
		labels: Labels.#Ref
		links: {
			type:     "object"
			readOnly: true
			example: {
				self:    "/api/v2/notificationEndpoints/1"
				labels:  "/api/v2/notificationEndpoints/1/labels"
				members: "/api/v2/notificationEndpoints/1/members"
				owners:  "/api/v2/notificationEndpoints/1/owners"
			}
			properties: {
				self: {
					description: "URL for this endpoint."
					Link.#Ref
				}
				labels: {
					description: "URL to retrieve labels for this endpoint."
					Link.#Ref
				}
				members: {
					description: "URL to retrieve members for this endpoint."
					Link.#Ref
				}
				owners: {
					description: "URL to retrieve owners for this endpoint."
					Link.#Ref
				}
			}
		}
		type: NotificationEndpointType.#Ref
	}
}
