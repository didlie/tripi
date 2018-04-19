package csci201.trips.multithreading;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Vector;

@ServerEndpoint(value = "/feed")
public class ServerSocket {
	private static Vector<Session> sessionVector = new Vector<Session>(); 
	
	public ServerSocket() {
		System.out.println("what's good");	
	}
	
	@OnOpen 
	public void open(Session session) {
		System.out.println("Client connected");
		sessionVector.add(session);
	}
	
	@OnMessage 
	public void onMessage(String message, Session session) {
		System.out.println(message);
		try {
			for (Session s : sessionVector) {
				s.getBasicRemote().sendText(message);
			}
		} catch (IOException ioe) {
			System.out.println("ioe: " + ioe.getMessage());
		}
	}
	
	@OnClose 
	public void close(Session session) {
		System.out.println("Client disconnected");
		sessionVector.remove(session);
	}
}
