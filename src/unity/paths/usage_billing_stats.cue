package paths

usage_billing_stats: get: {
	operationId: "GetUsageBilling"
	tags: [
		"Usage",
	]
	responses: {
		"200": {
			description: "Billing stats for Account current billing period"
			content: "text/csv": schema: {
				type: "string"
				example: """
					#group,false,false,true,false,false
					#datatype,string,long,string,dateTime:RFC3339,long
					#default,billing_stats,,,,
					,result,table,_field,_time,_value
					,,0,billing_stats,2021-01-13T22:05:00Z,120

					"""
			}
		}

		"401": {
			description: "Unauthorized"
			$ref:        "../../common/responses/ServerError.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
