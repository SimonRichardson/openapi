package commonschemas

SMTPNotificationRule: allOf: [{
	$ref: "./NotificationRuleBase.yml"
}, {
	$ref: "./SMTPNotificationRuleBase.yml"
}]
