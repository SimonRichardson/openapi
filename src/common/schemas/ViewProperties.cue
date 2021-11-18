package schemas

ViewProperties: oneOf: [{
	$ref: "./LinePlusSingleStatProperties.yml"
}, {
	$ref: "./XYViewProperties.yml"
}, {
	$ref: "./SingleStatViewProperties.yml"
}, {
	$ref: "./HistogramViewProperties.yml"
}, {
	$ref: "./GaugeViewProperties.yml"
}, {
	$ref: "./TableViewProperties.yml"
}, {
	$ref: "./SimpleTableViewProperties.yml"
}, {
	$ref: "./MarkdownViewProperties.yml"
}, {
	$ref: "./CheckViewProperties.yml"
}, {
	$ref: "./ScatterViewProperties.yml"
}, {
	$ref: "./HeatmapViewProperties.yml"
}, {
	$ref: "./MosaicViewProperties.yml"
}, {
	$ref: "./BandViewProperties.yml"
}, {
	$ref: "./GeoViewProperties.yml"
}]
