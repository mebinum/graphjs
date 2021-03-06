import apiCall from './api.js';
import handleLoginCookies from './_handleLoginCookies.js';

function loginCall(args, callback) {
	let username = args[0];
	window.GraphJS.events.emit("beforeLogin");
	apiCall("login", {
		"username": username,
		"password": args[1]
	},
	function(response) {
		if(response.data.success) {
			handleLoginCookies(username, response.data.id);
			window.GraphJS.events.emit("afterLogin", args, response.data);
		}
		callback(response.data);
	}, false);
};

export default function() {
	let args = Array.from(arguments);
	let callback = args.pop();
	loginCall(args, callback);
};
