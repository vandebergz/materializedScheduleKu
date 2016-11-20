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
import model.*;

public class MahasiswaAccess {
    public boolean register(String nim, String nama, String kelas, String username){
        boolean isRegistered1 = false;
        
        DatabaseAccess access = DatabaseAccess.getInstance();
        
        try{
         Connection conn = access.getConnection();
         PreparedStatement ps = conn.prepareStatement("Insert into Mahasiswa values(?, ?, ?, ?)");
         ps.setString(1, nim);
         ps.setString(2, nama);
         ps.setString(3, kelas);
         ps.setString(4, username);
         
         ResultSet rs = ps.executeQuery();
         
         if(rs.next()){
             isRegistered1 = true;
         }
         access.releaseConnection();
    } catch (SQLException e){
        e.printStackTrace();
    }
        
        return isRegistered1;
    }
    
    
//    public boolean registeruser(String username, String password){
//         boolean isRegistered2 = false;
//        
//        DatabaseAccess access = DatabaseAccess.getInstance();
//        
//        try{
//         Connection conn = access.getConnection();
//         
//         PreparedStatement ps = conn.prepareStatement("Insert into Users values(?, ?)");
//         
//         ps.setInt(1, Integer.parseInt(username));
//         ps.setInt(2, Integer.parseInt(password));
//         
////         ps.setString(1, username);u
////         ps.setString(2, password);
//         
//        int updateQuery = ps.executeUpdate();
//         
//         if(updateQuery>0){
//             isRegistered2 = true;
//         }
//         access.releaseConnection();
//    } catch (SQLException e){
//        e.printStackTrace();
//    }
//        
//        return isRegistered2;
//    }
}
