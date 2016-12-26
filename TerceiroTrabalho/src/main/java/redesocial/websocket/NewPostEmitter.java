/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package redesocial.websocket;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import redesocial.db.DatabaseDAO;
import redesocial.db.Post;

/**
 *
 * @author pedroreis
 */
@ServerEndpoint("/newpostemitter")
public class NewPostEmitter {
    private static final Set<Session> CONNECTED_USERS = Collections.synchronizedSet(new HashSet<Session>());
    private Session thisUser;
    
    @OnMessage
    public void onMessage(String param, Session session) {
        try{
            for (Session client : CONNECTED_USERS) {
                int connectedUserID = Integer.parseInt(param);
                ArrayList<String> friendsIDs = (new DatabaseDAO()).findFriendsIDs(connectedUserID);
                
                String friendsIDsArray = "[";
                for (int i = 0; i < friendsIDs.size(); i++) {
                    friendsIDsArray += "\"" + friendsIDs.get(i) + "\"";
                    if (i != (friendsIDs.size() - 1)) {
                        friendsIDsArray += ",";
                    }
                }
                friendsIDsArray += "]";
                
                if (!client.equals(session)) {
                    client.getBasicRemote().sendText(friendsIDsArray);
                }
            }
        } catch(Exception e){
            e.printStackTrace();
        }
    }
    
    @OnClose
    public void onClose(Session client) {
        CONNECTED_USERS.remove(client);
        
        System.out.println(client.getId());
        System.out.println("=== Desconectou");
    }

    @OnOpen
    public void onOpen(Session client) {
        CONNECTED_USERS.add(client);
        thisUser = client;
        
        System.out.println(client.getId());
        System.out.println("=== Conectou");        
    }

    @OnError
    public void onError(Throwable t) {
        System.out.println("Erro");      
    }
}
