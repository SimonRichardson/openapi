package contracts

"quartz-oem": {
	openapi: "3.0.0"
	info: {
		title:   "QuartzPublicAPI"
		version: "0.1.0"
	}
	servers: [{
		url: "/api/v2"
	}]
	security: [{
		bearerAuth: [

		]}]
	paths: {
		"/orgs": $ref: "./quartz/paths/orgs.yml"
		"/orgs/{orgID}": $ref: "./quartz/paths/org.yml"
		"/orgs/{orgID}/limits": $ref: "./quartz/paths/orgLimits.yml"
	}
	components: {
		securitySchemes: bearerAuth: {
			type:   "http"
			scheme: "bearer"
		}
		schemas: {
			BucketLimits: $ref: "./quartz/schemas/BucketLimits.yml"
			CheckLimits: $ref: "./quartz/schemas/CheckLimits.yml"
			DashboardLimits: $ref: "./quartz/schemas/DashboardLimits.yml"
			Error: $ref: "./common/schemas/Error.yml"
			Limit: $ref: "./quartz/schemas/Limit.yml"
			NotificationEndpointLimits: $ref: "./quartz/schemas/NotificationEndpointLimits.yml"
			NotificationRuleLimits: $ref: "./quartz/schemas/NotificationRuleLimits.yml"
			OrganizationRequest: $ref: "./quartz/schemas/OrganizationRequest.yml"
			OrganizationWithToken: $ref: "./quartz/schemas/OrganizationWithToken.yml"
			Organization: $ref: "./quartz/schemas/Organization.yml"
			Organizations: $ref: "./quartz/schemas/Organizations.yml"
			OrgLimits: $ref: "./quartz/schemas/OrgLimits.yml"
			RateLimits: $ref: "./quartz/schemas/RateLimits.yml"
			RestrictedLimit: $ref: "./quartz/schemas/RestrictedLimit.yml"
			TaskLimits: $ref: "./quartz/schemas/TaskLimits.yml"
			Unlimited: $ref: "./quartz/schemas/Unlimited.yml"
		}
		responses: {
			NoContent: $ref: "./common/responses/NoContent.yml"
			ServerError: $ref: "./common/responses/ServerError.yml"
		}
	}
}
