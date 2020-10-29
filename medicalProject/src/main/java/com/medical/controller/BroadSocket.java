package com.medical.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadsocket")
public class BroadSocket {
	private interface SearchExpression{
		boolean expression(User user);
	}
	private class User{
		Session session;
		String key;
	}
	private static List<User> sessionUsers = Collections.synchronizedList(new ArrayList<>());
	private static User getUser(Session session) {
		return searchUser(x -> x.session == session);
	}
	private static User getUser(String key) {
		return searchUser(x -> x.key.equals(key));
	}
	private static User searchUser(SearchExpression func) {
		Optional<User>op = sessionUsers.stream().filter(x -> func.expression(x)).findFirst();
		if(op.isPresent()) {
			return op.get();
		}
		return null;
	}
	
	@OnOpen
	public void handleOpen(Session userSession) {
		User user = new User();
		user.key = UUID.randomUUID().toString().replace("-", "");
		user.session = userSession;
		sessionUsers.add(user);
		Admin.visit(user.key);
	}
	
	@OnMessage
	public void handleMessage(String message, Session userSession)throws IOException{
		User user = getUser(userSession);
		if(user != null) {
			Admin.sendMessage(user.key, message);
		}
	}
public static void sendMessage(String key,String message) {
	User user = getUser(key);
	if(user != null) {
		try {
			user.session.getBasicRemote().sendText(message);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
}
	@OnClose
	public void handleClose(Session userSession) {
		User user = getUser(userSession);
		if(user != null) {
			Admin.bye(user.key);
			sessionUsers.remove(user);
		}
	}
	public static String[] getUserKeys() {
		String[]ret = new String[sessionUsers.size()];
		for(int i=0; i<ret.length; i++) {			
		ret[i] = sessionUsers.get(i).key;
	}
	return ret;
}
}