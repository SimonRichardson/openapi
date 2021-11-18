package schemas

DashboardLimits: {
	description: "Dashboard limits"
	type:        "object"
	properties: maxDashboards: {
		description: "Number of dashboards allowed"
		example:     5
		oneOf: [{
			$ref: "./RestrictedLimit.yml"
		}, {
			$ref: "./Unlimited.yml"
		}, {
			$ref: "./Limit.yml"
		}]
	}
}
