package commonschemas

TelegramNotificationEndpoint: {
	type: "object"
	allOf: [{
		NotificationEndpointBase.#Ref
	}, {
		type: "object"
		required: ["token", "channel"]
		properties: {
			token: {
				description: "Specifies the Telegram bot token. See https://core.telegram.org/bots#creating-a-new-bot ."
				type:        "string"
			}
			channel: {
				description: "ID of the telegram channel, a chat_id in https://core.telegram.org/bots/api#sendmessage ."
				type:        "string"
			}
		}
	}]
}
