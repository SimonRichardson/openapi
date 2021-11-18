package schemas

LineProtocolError: {
	properties: {
		code: $ref: "./LineProtocolErrorCode.yml"
		message: {
			readOnly:    true
			description: "Message is a human-readable message."
			type:        "string"
		}
		op: {
			readOnly:    true
			description: "Op describes the logical code operation during error. Useful for debugging."
			type:        "string"
		}
		err: {
			readOnly:    true
			description: "Err is a stack of errors that occurred during processing of the request. Useful for debugging."
			type:        "string"
		}
		line: {
			readOnly:    true
			description: "First line within sent body containing malformed data"
			type:        "integer"
			format:      "int32"
		}
	}
	required: ["code", "message", "op", "err"]
}
