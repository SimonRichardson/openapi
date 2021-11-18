package schemas

Tasks: {
	type: "object"
	properties: {
		links: {
			readOnly: true
			$ref:     "./Links.yml"
		}
		tasks: {
			type: "array"
			items: $ref: "./Task.yml"
		}
	}
}
