package commonschemas

TelegrafPlugins: {
	type: "object"
	properties: {
		version: type: "string"
		os: type: "string"
		plugins: {
			type: "array"
			items: $ref: "./TelegrafPlugin.yml"
		}
	}
}
