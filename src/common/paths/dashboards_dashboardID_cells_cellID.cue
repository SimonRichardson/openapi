package paths

dashboards_dashboardID_cells_cellID: {
	patch: {
		operationId: "PatchDashboardsIDCellsID"
		tags: [
			"Cells",
			"Dashboards",
		]
		summary:     "Update the non-positional information related to a cell"
		description: "Updates the non positional information related to a cell. Updates to a single cell's positional data could cause grid conflicts."
		requestBody: {
			required: true
			content: "application/json": schema: $ref: "../schemas/CellUpdate.yml"
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
				description: "Updated dashboard cell"
				content: "application/json": schema: $ref: "../schemas/Cell.yml"
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
	delete: {
		operationId: "DeleteDashboardsIDCellsID"
		tags: [
			"Cells",
			"Dashboards",
		]
		summary: "Delete a dashboard cell"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "dashboardID"
			schema: type: "string"
			required:    true
			description: "The ID of the dashboard to delete."
		}, {
			in:   "path"
			name: "cellID"
			schema: type: "string"
			required:    true
			description: "The ID of the cell to delete."
		}]
		responses: {
			"204": description: "Cell successfully deleted"
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
