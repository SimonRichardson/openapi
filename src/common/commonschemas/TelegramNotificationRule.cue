package commonschemas

TelegramNotificationRule: allOf: [{
	$ref: "./NotificationRuleBase.yml"
}, {
	$ref: "./TelegramNotificationRuleBase.yml"
}]
