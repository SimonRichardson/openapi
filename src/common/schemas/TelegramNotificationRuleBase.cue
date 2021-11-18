package schemas

TelegramNotificationRuleBase: {
	type: "object"
	required: ["type", "messageTemplate", "channel"]
	properties: {
		type: {
			description: "The discriminator between other types of notification rules is \"telegram\"."
			type:        "string"
			enum: ["telegram"]
		}
		messageTemplate: {
			description: "The message template as a flux interpolated string."
			type:        "string"
		}
		parseMode: {
			description: "Parse mode of the message text per https://core.telegram.org/bots/api#formatting-options . Defaults to \"MarkdownV2\" ."
			type:        "string"
			enum: [
				"MarkdownV2",
				"HTML",
				"Markdown",
			]
		}
		disableWebPagePreview: {
			description: "Disables preview of web links in the sent messages when \"true\". Defaults to \"false\" ."
			type:        "boolean"
		}
	}
}
