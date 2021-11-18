package schemas

Dialect: {
	description: "Dialect are options to change the default CSV output format; https://www.w3.org/TR/2015/REC-tabular-metadata-20151217/#dialect-descriptions"
	type:        "object"
	properties: {
		header: {
			description: "If true, the results will contain a header row"
			type:        "boolean"
			default:     true
		}
		delimiter: {
			description: "Separator between cells; the default is ,"
			type:        "string"
			default:     ","
			maxLength:   1
			minLength:   1
		}
		annotations: {
			description: "https://www.w3.org/TR/2015/REC-tabular-data-model-20151217/#columns"
			type:        "array"
			uniqueItems: true
			items: {
				type: "string"
				enum: [
					"group",
					"datatype",
					"default",
				]
			}
		}
		commentPrefix: {
			description: "Character prefixed to comment strings"
			type:        "string"
			default:     "#"
			maxLength:   1
			minLength:   0
		}
		dateTimeFormat: {
			description: "Format of timestamps"
			type:        "string"
			default:     "RFC3339"
			enum: [
				"RFC3339",
				"RFC3339Nano",
			]
		}
	}
}
