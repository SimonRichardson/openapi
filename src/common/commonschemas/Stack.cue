package commonschemas

Stack: {
	type: "object"
	properties: {
		id: type: "string"
		orgID: type: "string"
		createdAt: {
			type:     "string"
			format:   "date-time"
			readOnly: true
		}
		events: {
			type: "array"
			items: {
				type: "object"
				properties: {
					eventType: type: "string"
					name: type: "string"
					description: type: "string"
					sources: {
						type: "array"
						items: type: "string"
					}
					resources: {
						type: "array"
						items: {
							type: "object"
							properties: {
								apiVersion: type: "string"
								resourceID: type: "string"
								kind: TemplateKind.#Ref
								templateMetaName: type: "string"
								associations: {
									type: "array"
									items: {
										type: "object"
										properties: {
											kind: TemplateKind.#Ref
											metaName: type: "string"
										}
									}
								}
								links: {
									type: "object"
									properties: self: type: "string"
								}
							}
						}
					}
					urls: {
						type: "array"
						items: type: "string"
					}
					updatedAt: {
						type:     "string"
						format:   "date-time"
						readOnly: true
					}
				}
			}
		}
	}
}
