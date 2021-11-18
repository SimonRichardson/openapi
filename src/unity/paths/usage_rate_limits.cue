package paths

usage_rate_limits: get: {
	operationId: "GetUsageLimits"
	tags: [
		"Usage",
	]
	parameters: [{
		in:   "query"
		name: "range"
		schema: $ref: "../schemas/TimeRange.yml"
	}]
	responses: {
		"200": {
			description: "Limit history for Account"
			content: "application/csv": schema: {
				type: "string"
				example: """
					#group,false,false,true,false,false
					#datatype,string,long,string,dateTime:RFC3339,long
					#default,rate_limits,,,,
					,result,table,_field,_time,_value
					,,0,rate_limits,2021-01-13T22:05:00Z,120

					"""
			}
		}

		"400": {
			description: "Invalid query param name - Bad request"
			$ref:        "../../common/responses/ServerError.yml"
		}
		"401": {
			description: "Unauthorized"
			$ref:        "../../common/responses/ServerError.yml"
		}
		"404": {
			description: "Invalid vector_name or start or User/Org not found"
			$ref:        "../../common/responses/ServerError.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
