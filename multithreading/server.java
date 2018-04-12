package multithreading;

public class server {
//	server will be loaded when the main page is loaded
//	when a new itnererary is made, it will go to a servlet that will make a new client and connect with server
//	the client will take in all the info in the constructor
//	then it will send a message to the server to display the new card
//	the server will then access database and update main page
	
	private static Vector<Session> sessionVector = new Vector<Session>(); 
	
	@OnOpen 
	public void open(Session session) {
		//System.out.println("Client connected");
		sessionVector.add(session);
	}
	
	@OnMessage 
	public void onMessage(Card c, Session session) {
		//log newI in database
		//send to all sockets the newI
		
		
//		THIS IS FOR SENDING INFO BACK TO SOCKET
//		try {
//			for (Session s : sessionVector) {
//				s.getBasicRemote().sendText(message);
//				
//			}
//		} catch (IOException ioe) {
//			System.out.println("ioe: " + ioe.getMessage());
//		}
	}
	
	@OnClose 
	public void close(Session session) {
		//System.out.println("Client disconnected");
		sessionVector.remove(session);
	}
}
