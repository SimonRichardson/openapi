package commonschemas

LineProtocolLengthError: {
	properties: {
		code: LineProtocolLengthErrorCode
		message: {
			readOnly:    true
			description: "Message is a human-readable message."
			type:        "string"
		}
		maxLength: {
			readOnly:    true
			description: "Max length in bytes for a body of line-protocol."
			type:        "integer"
			format:      "int32"
		}
	}
	required: ["code", "message", "maxLength"]
}
