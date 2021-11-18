package common

"_schemas": {
	LanguageRequest: $ref: "./common/schemas/LanguageRequest.yml"
	Query: $ref: "./common/schemas/Query.yml"
	Package: $ref: "./common/schemas/Package.yml"
	File: $ref: "./common/schemas/File.yml"
	PackageClause: $ref: "./common/schemas/PackageClause.yml"
	ImportDeclaration: $ref: "./common/schemas/ImportDeclaration.yml"
	DeletePredicateRequest: $ref: "./common/schemas/DeletePredicateRequest.yml"
	Node: $ref: "./common/schemas/Node.yml"
	NodeType: $ref: "./common/schemas/NodeType.yml"
	Block: $ref: "./common/schemas/Block.yml"
	Statement: $ref: "./common/schemas/Statement.yml"
	BadStatement: $ref: "./common/schemas/BadStatement.yml"
	VariableAssignment: $ref: "./common/schemas/VariableAssignment.yml"
	MemberAssignment: $ref: "./common/schemas/MemberAssignment.yml"
	ExpressionStatement: $ref: "./common/schemas/ExpressionStatement.yml"
	ReturnStatement: $ref: "./common/schemas/ReturnStatement.yml"
	OptionStatement: $ref: "./common/schemas/OptionStatement.yml"
	BuiltinStatement: $ref: "./common/schemas/BuiltinStatement.yml"
	TestStatement: $ref: "./common/schemas/TestStatement.yml"
	Expression: $ref: "./common/schemas/Expression.yml"
	ArrayExpression: $ref: "./common/schemas/ArrayExpression.yml"
	DictExpression: $ref: "./common/schemas/DictExpression.yml"
	DictItem: $ref: "./common/schemas/DictItem.yml"
	FunctionExpression: $ref: "./common/schemas/FunctionExpression.yml"
	BinaryExpression: $ref: "./common/schemas/BinaryExpression.yml"
	CallExpression: $ref: "./common/schemas/CallExpression.yml"
	ConditionalExpression: $ref: "./common/schemas/ConditionalExpression.yml"
	LogicalExpression: $ref: "./common/schemas/LogicalExpression.yml"
	MemberExpression: $ref: "./common/schemas/MemberExpression.yml"
	IndexExpression: $ref: "./common/schemas/IndexExpression.yml"
	ObjectExpression: $ref: "./common/schemas/ObjectExpression.yml"
	ParenExpression: $ref: "./common/schemas/ParenExpression.yml"
	PipeExpression: $ref: "./common/schemas/PipeExpression.yml"
	UnaryExpression: $ref: "./common/schemas/UnaryExpression.yml"
	BooleanLiteral: $ref: "./common/schemas/BooleanLiteral.yml"
	DateTimeLiteral: $ref: "./common/schemas/DateTimeLiteral.yml"
	DurationLiteral: $ref: "./common/schemas/DurationLiteral.yml"
	FloatLiteral: $ref: "./common/schemas/FloatLiteral.yml"
	IntegerLiteral: $ref: "./common/schemas/IntegerLiteral.yml"
	PipeLiteral: $ref: "./common/schemas/PipeLiteral.yml"
	RegexpLiteral: $ref: "./common/schemas/RegexpLiteral.yml"
	StringLiteral: $ref: "./common/schemas/StringLiteral.yml"
	UnsignedIntegerLiteral: $ref: "./common/schemas/UnsignedIntegerLiteral.yml"
	Duration: $ref: "./common/schemas/Duration.yml"
	Property: $ref: "./common/schemas/Property.yml"
	PropertyKey: $ref: "./common/schemas/PropertyKey.yml"
	Identifier: $ref: "./common/schemas/Identifier.yml"
	Dialect: $ref: "./common/schemas/Dialect.yml"
	AuthorizationUpdateRequest: $ref: "./common/schemas/AuthorizationUpdateRequest.yml"
	PostBucketRequest: $ref: "./common/schemas/PostBucketRequest.yml"
	Bucket: $ref: "./common/schemas/Bucket.yml"
	Buckets: $ref: "./common/schemas/Buckets.yml"
	RetentionRules: $ref: "./common/schemas/RetentionRules.yml"
	PatchBucketRequest: $ref: "./common/schemas/PatchBucketRequest.yml"
	PatchRetentionRules: $ref: "./common/schemas/PatchRetentionRules.yml"
	PatchRetentionRule: $ref: "./common/schemas/PatchRetentionRule.yml"
	RetentionRule: $ref: "./common/schemas/RetentionRule.yml"
	Link: $ref: "./common/schemas/Link.yml"
	Links: $ref: "./common/schemas/Links.yml"
	Logs: $ref: "./common/schemas/Logs.yml"
	LogEvent: $ref: "./common/schemas/LogEvent.yml"
	Organization: $ref: "./common/schemas/Organization.yml"
	Organizations: $ref: "./common/schemas/Organizations.yml"
	PostOrganizationRequest: $ref: "./common/schemas/PostOrganizationRequest.yml"
	PatchOrganizationRequest: $ref: "./common/schemas/PatchOrganizationRequest.yml"
	TemplateApply: $ref: "./common/schemas/TemplateApply.yml"
	TemplateKind: $ref: "./common/schemas/TemplateKind.yml"
	TemplateExportByID: $ref: "./common/schemas/TemplateExportByID.yml"
	TemplateExportByName: $ref: "./common/schemas/TemplateExportByName.yml"
	Template: $ref: "./common/schemas/Template.yml"
	TemplateEnvReferences: $ref: "./common/schemas/TemplateEnvReferences.yml"
	TemplateSummary: $ref: "./common/schemas/TemplateSummary.yml"
	TemplateSummaryLabel: $ref: "./common/schemas/TemplateSummaryLabel.yml"
	TemplateChart: $ref: "./common/schemas/TemplateChart.yml"
	Stack: $ref: "./common/schemas/Stack.yml"
	Runs: $ref: "./common/schemas/Runs.yml"
	Run: $ref: "./common/schemas/Run.yml"
	RunManually: $ref: "./common/schemas/RunManually.yml"
	Tasks: $ref: "./common/schemas/Tasks.yml"
	Task: $ref: "./common/schemas/Task.yml"
	TaskStatusType: $ref: "./common/schemas/TaskStatusType.yml"
	UserResponse: $ref: "./common/schemas/UserResponse.yml"
	Flags: $ref: "./common/schemas/Flags.yml"
	ResourceMember: $ref: "./common/schemas/ResourceMember.yml"
	ResourceMembers: $ref: "./common/schemas/ResourceMembers.yml"
	ResourceOwner: $ref: "./common/schemas/ResourceOwner.yml"
	ResourceOwners: $ref: "./common/schemas/ResourceOwners.yml"
	FluxSuggestions: $ref: "./common/schemas/FluxSuggestions.yml"
	FluxSuggestion: $ref: "./common/schemas/FluxSuggestion.yml"
	Routes: $ref: "./common/schemas/Routes.yml"
	Error: $ref: "./common/schemas/Error.yml"
	LineProtocolError: $ref: "./common/schemas/LineProtocolError.yml"
	LineProtocolLengthError: $ref: "./common/schemas/LineProtocolLengthError.yml"
	Field: $ref: "./common/schemas/Field.yml"
	BuilderConfig: $ref: "./common/schemas/BuilderConfig.yml"
	BuilderTagsType: $ref: "./common/schemas/BuilderTagsType.yml"
	BuilderAggregateFunctionType: $ref: "./common/schemas/BuilderAggregateFunctionType.yml"
	BuilderFunctionsType: $ref: "./common/schemas/BuilderFunctionsType.yml"
	DashboardQuery: $ref: "./common/schemas/DashboardQuery.yml"
	QueryEditMode: $ref: "./common/schemas/QueryEditMode.yml"
	Axis: $ref: "./common/schemas/Axis.yml"
	AxisScale: $ref: "./common/schemas/AxisScale.yml"
	DashboardColor: $ref: "./common/schemas/DashboardColor.yml"
	RenamableField: $ref: "./common/schemas/RenamableField.yml"
	XYViewProperties: $ref: "./common/schemas/XYViewProperties.yml"
	XYGeom: $ref: "./common/schemas/XYGeom.yml"
	BandViewProperties: $ref: "./common/schemas/BandViewProperties.yml"
	LinePlusSingleStatProperties: $ref: "./common/schemas/LinePlusSingleStatProperties.yml"
	MosaicViewProperties: $ref: "./common/schemas/MosaicViewProperties.yml"
	ScatterViewProperties: $ref: "./common/schemas/ScatterViewProperties.yml"
	HeatmapViewProperties: $ref: "./common/schemas/HeatmapViewProperties.yml"
	SingleStatViewProperties: $ref: "./common/schemas/SingleStatViewProperties.yml"
	HistogramViewProperties: $ref: "./common/schemas/HistogramViewProperties.yml"
	GaugeViewProperties: $ref: "./common/schemas/GaugeViewProperties.yml"
	TableViewProperties: $ref: "./common/schemas/TableViewProperties.yml"
	SimpleTableViewProperties: $ref: "./common/schemas/SimpleTableViewProperties.yml"
	MarkdownViewProperties: $ref: "./common/schemas/MarkdownViewProperties.yml"
	CheckViewProperties: $ref: "./common/schemas/CheckViewProperties.yml"
	GeoViewLayer: $ref: "./common/schemas/GeoViewLayer.yml"
	GeoViewLayerProperties: $ref: "./common/schemas/GeoViewLayerProperties.yml"
	GeoCircleViewLayer: $ref: "./common/schemas/GeoCircleViewLayer.yml"
	GeoPointMapViewLayer: $ref: "./common/schemas/GeoPointMapViewLayer.yml"
	GeoTrackMapViewLayer: $ref: "./common/schemas/GeoTrackMapViewLayer.yml"
	GeoHeatMapViewLayer: $ref: "./common/schemas/GeoHeatMapViewLayer.yml"
	GeoViewProperties: $ref: "./common/schemas/GeoViewProperties.yml"
	LatLonColumns: $ref: "./common/schemas/LatLonColumns.yml"
	LatLonColumn: $ref: "./common/schemas/LatLonColumn.yml"
	Axes: $ref: "./common/schemas/Axes.yml"
	StaticLegend: $ref: "./common/schemas/StaticLegend.yml"
	DecimalPlaces: $ref: "./common/schemas/DecimalPlaces.yml"
	ConstantVariableProperties: $ref: "./common/schemas/ConstantVariableProperties.yml"
	MapVariableProperties: $ref: "./common/schemas/MapVariableProperties.yml"
	QueryVariableProperties: $ref: "./common/schemas/QueryVariableProperties.yml"
	VariableProperties: $ref: "./common/schemas/VariableProperties.yml"
	ViewProperties: $ref: "./common/schemas/ViewProperties.yml"
	View: $ref: "./common/schemas/View.yml"
	Views: $ref: "./common/schemas/Views.yml"
	CellUpdate: $ref: "./common/schemas/CellUpdate.yml"
	CreateCell: $ref: "./common/schemas/CreateCell.yml"
	AnalyzeQueryResponse: $ref: "./common/schemas/AnalyzeQueryResponse.yml"
	CellWithViewProperties: $ref: "./common/schemas/CellWithViewProperties.yml"
	Cell: $ref: "./common/schemas/Cell.yml"
	CellsWithViewProperties: $ref: "./common/schemas/CellsWithViewProperties.yml"
	Cells: $ref: "./common/schemas/Cells.yml"
	Secrets: $ref: "./common/schemas/Secrets.yml"
	SecretKeys: $ref: "./common/schemas/SecretKeys.yml"
	SecretKeysResponse: $ref: "./common/schemas/SecretKeysResponse.yml"
	CreateDashboardRequest: $ref: "./common/schemas/CreateDashboardRequest.yml"
	DashboardWithViewProperties: $ref: "./common/schemas/DashboardWithViewProperties.yml"
	Dashboard: $ref: "./common/schemas/Dashboard.yml"
	Dashboards: $ref: "./common/schemas/Dashboards.yml"
	TelegrafRequest: $ref: "./common/schemas/TelegrafRequest.yml"
	Telegraf: $ref: "./common/schemas/Telegraf.yml"
	Telegrafs: $ref: "./common/schemas/Telegrafs.yml"
	TelegrafPlugin: $ref: "./common/schemas/TelegrafPlugin.yml"
	TelegrafPlugins: $ref: "./common/schemas/TelegrafPlugins.yml"
	IsOnboarding: $ref: "./common/schemas/IsOnboarding.yml"
	PasswordResetBody: $ref: "./common/schemas/PasswordResetBody.yml"
	AddResourceMemberRequestBody: $ref: "./common/schemas/AddResourceMemberRequestBody.yml"
	Ready: $ref: "./common/schemas/Ready.yml"
	HealthCheck: $ref: "./common/schemas/HealthCheck.yml"
	Labels: $ref: "./common/schemas/Labels.yml"
	Label: $ref: "./common/schemas/Label.yml"
	LabelCreateRequest: $ref: "./common/schemas/LabelCreateRequest.yml"
	LabelUpdate: $ref: "./common/schemas/LabelUpdate.yml"
	LabelMapping: $ref: "./common/schemas/LabelMapping.yml"
	LabelsResponse: $ref: "./common/schemas/LabelsResponse.yml"
	LabelResponse: $ref: "./common/schemas/LabelResponse.yml"
	ASTResponse: $ref: "./common/schemas/ASTResponse.yml"
	WritePrecision: $ref: "./common/schemas/WritePrecision.yml"
	TaskCreateRequest: $ref: "./common/schemas/TaskCreateRequest.yml"
	TaskUpdateRequest: $ref: "./common/schemas/TaskUpdateRequest.yml"
	FluxResponse: $ref: "./common/schemas/FluxResponse.yml"
	CheckPatch: $ref: "./common/schemas/CheckPatch.yml"
	CheckDiscriminator: $ref: "./common/schemas/CheckDiscriminator.yml"
	Check: $ref: "./common/schemas/Check.yml"
	PostCheck: $ref: "./common/schemas/PostCheck.yml"
	Checks: $ref: "./common/schemas/Checks.yml"
	CheckBase: $ref: "./common/schemas/CheckBase.yml"
	ThresholdCheck: $ref: "./common/schemas/ThresholdCheck.yml"
	Threshold: $ref: "./common/schemas/Threshold.yml"
	DeadmanCheck: $ref: "./common/schemas/DeadmanCheck.yml"
	CustomCheck: $ref: "./common/schemas/CustomCheck.yml"
	ThresholdBase: $ref: "./common/schemas/ThresholdBase.yml"
	GreaterThreshold: $ref: "./common/schemas/GreaterThreshold.yml"
	LesserThreshold: $ref: "./common/schemas/LesserThreshold.yml"
	RangeThreshold: $ref: "./common/schemas/RangeThreshold.yml"
	CheckStatusLevel: $ref: "./common/schemas/CheckStatusLevel.yml"
	RuleStatusLevel: $ref: "./common/schemas/RuleStatusLevel.yml"
	NotificationRuleUpdate: $ref: "./common/schemas/NotificationRuleUpdate.yml"
	NotificationRuleDiscriminator: $ref: "./common/schemas/NotificationRuleDiscriminator.yml"
	NotificationRule: $ref: "./common/schemas/NotificationRule.yml"
	PostNotificationRule: $ref: "./common/schemas/PostNotificationRule.yml"
	NotificationRules: $ref: "./common/schemas/NotificationRules.yml"
	NotificationRuleBase: $ref: "./common/schemas/NotificationRuleBase.yml"
	TagRule: $ref: "./common/schemas/TagRule.yml"
	StatusRule: $ref: "./common/schemas/StatusRule.yml"
	HTTPNotificationRuleBase: $ref: "./common/schemas/HTTPNotificationRuleBase.yml"
	HTTPNotificationRule: $ref: "./common/schemas/HTTPNotificationRule.yml"
	SlackNotificationRuleBase: $ref: "./common/schemas/SlackNotificationRuleBase.yml"
	SlackNotificationRule: $ref: "./common/schemas/SlackNotificationRule.yml"
	SMTPNotificationRule: $ref: "./common/schemas/SMTPNotificationRule.yml"
	SMTPNotificationRuleBase: $ref: "./common/schemas/SMTPNotificationRuleBase.yml"
	PagerDutyNotificationRule: $ref: "./common/schemas/PagerDutyNotificationRule.yml"
	PagerDutyNotificationRuleBase: $ref: "./common/schemas/PagerDutyNotificationRuleBase.yml"
	TelegramNotificationRule: $ref: "./common/schemas/TelegramNotificationRule.yml"
	TelegramNotificationRuleBase: $ref: "./common/schemas/TelegramNotificationRuleBase.yml"
	NotificationEndpointUpdate: $ref: "./common/schemas/NotificationEndpointUpdate.yml"
	NotificationEndpointDiscriminator: $ref: "./common/schemas/NotificationEndpointDiscriminator.yml"
	NotificationEndpoint: $ref: "./common/schemas/NotificationEndpoint.yml"
	PostNotificationEndpoint: $ref: "./common/schemas/PostNotificationEndpoint.yml"
	NotificationEndpoints: $ref: "./common/schemas/NotificationEndpoints.yml"
	NotificationEndpointBase: $ref: "./common/schemas/NotificationEndpointBase.yml"
	SlackNotificationEndpoint: $ref: "./common/schemas/SlackNotificationEndpoint.yml"
	PagerDutyNotificationEndpoint: $ref: "./common/schemas/PagerDutyNotificationEndpoint.yml"
	HTTPNotificationEndpoint: $ref: "./common/schemas/HTTPNotificationEndpoint.yml"
	TelegramNotificationEndpoint: $ref: "./common/schemas/TelegramNotificationEndpoint.yml"
	NotificationEndpointType: $ref: "./common/schemas/NotificationEndpointType.yml"
	DBRP: $ref: "./common/schemas/DBRP.yml"
	DBRPs: $ref: "./common/schemas/DBRPs.yml"
	DBRPUpdate: $ref: "./common/schemas/DBRPUpdate.yml"
	DBRPCreate: $ref: "./common/schemas/DBRPCreate.yml"
	DBRPGet: $ref: "./common/schemas/DBRPGet.yml"
	SchemaType: $ref: "./common/schemas/SchemaType.yml"
}
