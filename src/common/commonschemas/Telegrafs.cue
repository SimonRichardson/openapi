package commonschemas

Telegrafs: {
	type: "object"
	properties: configurations: {
		type: "array"
		items: $ref: "./Telegraf.yml"
	}
}
