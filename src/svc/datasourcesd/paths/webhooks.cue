package paths

webhooks: post: {
	summary:     "handler for incoming webhook posts from the web"
	operationId: "post-webhooks-token"
	description: "A post operation coming from the web. body could be anything. Requests will be routed to the right Datasource"
	responses: "200": description: "OK"
}
