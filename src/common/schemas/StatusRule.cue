package schemas

StatusRule: {
	type: "object"
	properties: {
		currentLevel: $ref: "./RuleStatusLevel.yml"
		previousLevel: $ref: "./RuleStatusLevel.yml"
		count: type: "integer"
		period: type: "string"
	}
}
