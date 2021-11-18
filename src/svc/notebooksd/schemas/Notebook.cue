package schemas

Notebook: properties: {
	id: type: "string"
	name: type: "string"
	orgID: type: "string"
	spec: type: "object"
	createdAt: {
		type:   "string"
		format: "date-time"
	}
	updatedAt: {
		type:   "string"
		format: "date-time"
	}
}
