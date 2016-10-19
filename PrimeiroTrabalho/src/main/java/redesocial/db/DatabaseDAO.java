package redesocial.db;

import redesocial.db.BaseDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class DatabaseDAO extends BaseDAO {

    public ArrayList<Post> getTimeline(int userserial, int offset){
        ArrayList<Post> lista = new ArrayList<>();
        Post post = null;
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
                "select T4.userserial,T4.username,T5.datahora,T5.post" +
                " from usuarios T4, posts T5\n" +
                " where T5.userserial=? and T4.userserial=?\n" +
                " order by datahora desc offset ? limit 50;"      
            );
            pstmt.setInt(1, userserial);
            pstmt.setInt(2, userserial);
            pstmt.setInt(3, offset);
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()){
                post = new Post();
                post.setUsername(rst.getString("username"));
                String datahora = 
                        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                                .format(rst.getTimestamp("datahora"));
                post.setDate(datahora);
                post.setPost(rst.getString("post"));
                lista.add(post);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return lista;
    }

    public ArrayList<Post> getFeed(int userserial, int offset){
        ArrayList<Post> lista = new ArrayList<>();
        Post post = null;
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
"(select T1.userserial,T1.username,T2.datahora,T2.post from usuarios T1\n" +
" join posts T2 on (T2.userserial=T1.userserial)\n" +
" join amigos T3 on (T3.userserial=? and T1.userserial=T3.amigoserial)\n" +
" group by T1.userserial,T1.username,T2.datahora,T2.post) union\n" +
" (select T4.userserial,T4.username,T5.datahora,T5.post from usuarios T4, posts T5\n" +
" where (T5.userserial=? and T4.userserial=?))\n" +
" order by datahora desc offset ? limit 50;"      
            );
            pstmt.setInt(1, userserial);
            pstmt.setInt(2, userserial);
            pstmt.setInt(3, userserial);
            pstmt.setInt(4, offset);
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()){
                post = new Post();
                post.setUsername(rst.getString("username"));
                
                String datahora = 
                        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                                .format(rst.getTimestamp("datahora"));
                post.setDate(datahora);
                
                post.setPost(rst.getString("post"));
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
}