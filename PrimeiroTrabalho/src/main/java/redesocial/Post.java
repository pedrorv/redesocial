package redesocial;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author pedroreis
 */
public class Post {
    private String username;
    private String date;
    private String post;
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public void setDate(String date) {
        this.date = date;
    }
    
    public void setPost(String post) {
        this.post = post;
    }
    
    public String getUsername() {
        return this.username;
    }
    
    public String getDate() {
        return this.date;
    }
    
    public String getPost() {
        return this.post;
    }
}