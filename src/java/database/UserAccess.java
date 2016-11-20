/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

/**
 *
 * @author FransiskaJesinta
 */
import java.sql.*;
import java.sql.Connection;
import model.User;

public class UserAccess {
    
    public boolean login(String username, String password){
        boolean isValidated = false;
        DatabaseAccess access = DatabaseAccess.getInstance();
        
        try{
         Connection conn = access.getConnection();
         PreparedStatement ps = conn.prepareStatement("Select * From users where username = ? and password = ?");
         ps.setString(1, username);
         ps.setString(2, password);
         
         ResultSet rs = ps.executeQuery();
         
         if(rs.next()){
             isValidated = true;
         }
         access.releaseConnection();
    } catch (SQLException e){
        e.printStackTrace();
    }
    return isValidated;
    
}
     
}
