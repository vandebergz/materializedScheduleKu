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
import com.mysql.jdbc.SQLError;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;


public class DatabaseAccess {
    private static DatabaseAccess _instance;
    private static final String username = "root";
    private static final String password = "";
    private static final String url = "jdbc:mysql://localhost:3306/tubesags";
    private Connection conn;
    private boolean isFree = true;
    
    public DatabaseAccess() throws Exception{
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connect();
        } catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
            throw new Exception();
        }
    }
    
  
    public static DatabaseAccess getInstance(){
        if(_instance == null){
            try{
                _instance = new DatabaseAccess();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
       return _instance; 
    }
    
    private void connect() throws SQLException{
        conn = DriverManager.getConnection(url, username, password);
    }
    
    public synchronized Connection getConnection(){
        while(!isFree){
            try{
                wait();
            } catch (InterruptedException e){
                e.printStackTrace();
            }
        }
        isFree = false;
        notify();
        return conn;
    }
    
    public synchronized void releaseConnection(){
        while(isFree){
            try{
                wait();
            } catch (InterruptedException ie){
                ie.printStackTrace();
            }
        }
        isFree=true;
        notify();
    }
    
}
