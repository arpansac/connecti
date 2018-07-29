console.log('creating server...');

const http = require('http');

const hostname = '192.168.1.16';
const port = '8000';

console.log('fetching port and starting...');

const server = http.createServer().listen(port, hostname);

console.log('Yay! chat server is up and running on ' + hostname + ':' + port);


var socketList = require('socket.io').listen(server);


socketList.sockets.on('connection', function(socket){
	console.log('new connection received!');

	socket.on('disconnect', function(){
		console.log('socket disconnected');
	});

	// every socket has unique id
	// console.log(socket);

	// this event was emitted by the user/client side
	socket.on('join_chat_room', function(data){
		console.log('chat room joining request: ', data);


		// now, let's make the user join a room
		socket.join(data.chatroom_name);

		socketList.in(data.chatroom_name).emit('new_user_joined', data);
	});


	socket.on('send_message', function(data){

		socketList.in(data.chatroom_name).emit('receive_message', data);
	});






});





























