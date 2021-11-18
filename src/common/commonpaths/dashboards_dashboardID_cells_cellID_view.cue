package commonpaths

dashboards_dashboardID_cells_cellID_view: {
	get: {
		operationId: "GetDashboardsIDCellsIDView"
		tags: [
			"Cells",
			"Dashboards",
			"Views",
		]
		summary: "Retrieve the view for a cell"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "dashboardID"
			schema: type: "string"
			required:    true
			description: "The dashboard ID."
		}, {
			in:   "path"
			name: "cellID"
			schema: type: "string"
			required:    true
			description: "The cell ID."
		}]
		responses: {
			"200": {
				description: "A dashboard cells view"
				content: "application/json": schema: $ref: "../schemas/View.yml"
			}
			"404": {
				description: "Cell or dashboard not found"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	patch: {
		operationId: "PatchDashboardsIDCellsIDView"
		tags: [
			"Cells",
			"Dashboards",
			"Views",
		]
		summary: "Update the view for a cell"
		requestBody: {
			required: true
			content: "application/json": schema: $ref: "../schemas/View.yml"
		}
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "dashboardID"
			schema: type: "string"
			required:    true
			description: "The ID of the dashboard to update."
		}, {
			in:   "path"
			name: "cellID"
			schema: type: "string"
			required:    true
			description: "The ID of the cell to update."
		}]
		responses: {
			"200": {
				description: "Updated cell view"
				content: "application/json": schema: $ref: "../schemas/View.yml"
			}
			"404": {
				description: "Cell or dashboard not found"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
