package commonschemas

PagerDutyNotificationRule: allOf: [{
	$ref: "./NotificationRuleBase.yml"
}, {
	$ref: "./PagerDutyNotificationRuleBase.yml"
}]
