package paths

scrapers_scraperTargetID_members_userID: delete: {
	operationId: "DeleteScrapersIDMembersID"
	tags: ["Scraper Targets"]
	summary: "Remove a member from a scraper target"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "userID"
		schema: type: "string"
		required:    true
		description: "The ID of member to remove."
	}, {
		in:   "path"
		name: "scraperTargetID"
		schema: type: "string"
		required:    true
		description: "The scraper target ID."
	}]
	responses: {
		"204": description: "Member removed"
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
