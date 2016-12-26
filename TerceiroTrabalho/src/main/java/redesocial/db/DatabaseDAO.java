package redesocial.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class DatabaseDAO extends BaseDAO {
    
    public ArrayList<String> findFriends(String username) {
        ArrayList<String> list = new ArrayList<>();
        
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
                "SELECT username FROM usuarios WHERE username LIKE ?;"
            );
            pstmt.setString(1, username + '%');
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()){
                list.add(rst.getString("username"));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return list;
    }
    
    public ArrayList<String> findFriendsIDs(int userid) {
        ArrayList<String> list = new ArrayList<>();
        
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
                "SELECT amigoserial FROM amigos WHERE userserial=?;"
            );
            pstmt.setInt(1, userid);
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()){
                list.add(rst.getString("amigoserial"));
            }
            con.close();        
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return list;
    }

    public ArrayList<Post> getTimeline(int userserial, int offset, int limit){
        ArrayList<Post> lista = new ArrayList<>();
        Post post = null;
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
                "select T4.userserial,T4.username,T5.datahora,T5.post,T5.postserial" +
                " from usuarios T4, posts T5\n" +
                " where T5.userserial=? and T4.userserial=?\n" +
                " order by datahora desc offset ? limit ?;"      
            );
            pstmt.setInt(1, userserial);
            pstmt.setInt(2, userserial);
            pstmt.setInt(3, offset);
            pstmt.setInt(4, limit);
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()){
                post = new Post();
                post.setUsername(rst.getString("username"));
                String datahora = 
                        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                                .format(rst.getTimestamp("datahora"));
                post.setDate(datahora);
                post.setPost(rst.getString("post"));
                post.setId(rst.getString("postserial"));
                lista.add(post);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return lista;
    }

    public ArrayList<Post> getFeed(int userserial, int offset, int limit){
        ArrayList<Post> lista = new ArrayList<>();
        Post post = null;
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
                "(select T1.userserial,T1.username,T2.datahora,T2.post,T2.postserial from usuarios T1 \n" +
                " join posts T2 on (T2.userserial=T1.userserial)\n" +
                " join amigos T3 on (T3.userserial=? and T1.userserial=T3.amigoserial)\n" +
                " group by T1.userserial,T1.username,T2.datahora,T2.post,T2.postserial) union\n" +
                " (select T4.userserial,T4.username,T5.datahora,T5.post,T5.postserial from usuarios T4, posts T5\n" +
                " where (T5.userserial=? and T4.userserial=?))\n" +
                " order by datahora desc offset ? limit ?;"      
            );
            pstmt.setInt(1, userserial);
            pstmt.setInt(2, userserial);
            pstmt.setInt(3, userserial);
            pstmt.setInt(4, offset);
            pstmt.setInt(5, limit);
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()){
                post = new Post();
                post.setUsername(rst.getString("username"));
                
                String datahora = 
                        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                                .format(rst.getTimestamp("datahora"));
                post.setDate(datahora);
                
                post.setPost(rst.getString("post"));
                post.setId(rst.getString("postserial"));
                lista.add(post);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return lista;
    }
    
    public void insertPost(int userserial,String post){
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
               "INSERT INTO posts (userserial,datahora,post) VALUES(?,?,?)");
            pstmt.setInt(1, userserial);
            pstmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            pstmt.setString(3, post);
            pstmt.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public int userAuthentication(String username){
        int result = 0;
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
                "SELECT userserial FROM usuarios WHERE username=?;"
            );
            pstmt.setString(1, username);
            ResultSet rst = pstmt.executeQuery();
            if(rst.next()){
                result = rst.getInt("userserial");
            }else{
                result = 0;
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            result = 0;
        }
        return result;
    }
    
    public boolean userSignup(String username){
        boolean result = false;
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
                "INSERT INTO usuarios (username) VALUES(?);"
            );
            pstmt.setString(1, username);
            pstmt.executeUpdate();
            con.close();
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}