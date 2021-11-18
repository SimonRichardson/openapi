package commonschemas

DashboardWithViewProperties: {
	type: "object"
	allOf: [{
		$ref: "./CreateDashboardRequest.yml"
	}, {
		type: "object"
		properties: {
			links: {
				type: "object"
				example: {
					self:    "/api/v2/dashboards/1"
					cells:   "/api/v2/dashboards/1/cells"
					owners:  "/api/v2/dashboards/1/owners"
					members: "/api/v2/dashboards/1/members"
					labels:  "/api/v2/dashboards/1/labels"
					org:     "/api/v2/labels/1"
				}
				properties: {
					self: $ref: "./Link.yml"
					cells: $ref: "./Link.yml"
					members: $ref: "./Link.yml"
					owners: $ref: "./Link.yml"
					labels: $ref: "./Link.yml"
					org: $ref: "./Link.yml"
				}
			}
			id: {
				readOnly: true
				type:     "string"
			}
			meta: {
				type: "object"
				properties: {
					createdAt: {
						type:   "string"
						format: "date-time"
					}
					updatedAt: {
						type:   "string"
						format: "date-time"
					}
				}
			}
			cells: $ref: "./CellsWithViewProperties.yml"
			labels: $ref: "./Labels.yml"
		}
	}]
}
