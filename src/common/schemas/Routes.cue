package schemas

Routes: properties: {
	authorizations: {
		type:   "string"
		format: "uri"
	}
	buckets: {
		type:   "string"
		format: "uri"
	}
	dashboards: {
		type:   "string"
		format: "uri"
	}
	external: {
		type: "object"
		properties: statusFeed: {
			type:   "string"
			format: "uri"
		}
	}
	variables: {
		type:   "string"
		format: "uri"
	}
	me: {
		type:   "string"
		format: "uri"
	}
	flags: {
		type:   "string"
		format: "uri"
	}
	orgs: {
		type:   "string"
		format: "uri"
	}
	query: {
		type: "object"
		properties: {
			self: {
				type:   "string"
				format: "uri"
			}
			ast: {
				type:   "string"
				format: "uri"
			}
			analyze: {
				type:   "string"
				format: "uri"
			}
			suggestions: {
				type:   "string"
				format: "uri"
			}
		}
	}
	setup: {
		type:   "string"
		format: "uri"
	}
	signin: {
		type:   "string"
		format: "uri"
	}
	signout: {
		type:   "string"
		format: "uri"
	}
	sources: {
		type:   "string"
		format: "uri"
	}
	system: {
		type: "object"
		properties: {
			metrics: {
				type:   "string"
				format: "uri"
			}
			debug: {
				type:   "string"
				format: "uri"
			}
			health: {
				type:   "string"
				format: "uri"
			}
		}
	}
	tasks: {
		type:   "string"
		format: "uri"
	}
	telegrafs: {
		type:   "string"
		format: "uri"
	}
	users: {
		type:   "string"
		format: "uri"
	}
	write: {
		type:   "string"
		format: "uri"
	}
}
