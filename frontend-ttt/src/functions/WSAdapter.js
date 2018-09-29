class WSAdapter {
	static openConnection(){
		return new WebSocket('ws://localhost:3000/cable')
	}

	static liveSocket(webSocket){
		webSocket.onmessage = event => {
			let result = JSON.parse(event.data)
			// console.log(result['message'])
		}
	}
}

export default WSAdapter
