package commonschemas

TemplateExportByID: {
	type: "object"
	properties: {
		stackID: type: "string"
		orgIDs: {
			type: "array"
			items: {
				type: "object"
				properties: {
					orgID: type: "string"
					resourceFilters: {
						type: "object"
						properties: {
							byLabel: {
								type: "array"
								items: type: "string"
							}
							byResourceKind: {
								type: "array"
								items: TemplateKind.#Ref
							}
						}
					}
				}
			}
		}
		resources: {
			type: "array"
			items: {
				type: "object"
				properties: {
					id: type: "string"
					kind: TemplateKind.#Ref
					name: {
						type:        "string"
						description: "if defined with id, name is used for resource exported by id. if defined independently, resources strictly matching name are exported"
					}
				}
				required: ["id", "kind"]
			}
		}
	}
}
