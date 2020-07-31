package edu.uncc.realty.database.loader;



import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DatabaseManager {
	
	private static DataSource dataSource;


	private static Object syncObject = new Object();
	
    private static Connection conn = null;
    
    private Statement stmt = null;
	
    private PreparedStatement pStmt = null;
    
	public DatabaseManager () {
		if(dataSource==null) {
			initializeDataSource();
		}
	}

	
	public static void initializeDataSource () {
		synchronized(syncObject){
		    InitialContext ctx;
				conn = getSimpleConnection();
			
		}
	}
	
	 /** Uses DriverManager.  */
	  private static Connection getSimpleConnection() {
	    //See your driver documentation for the proper format of this string :
	    String DB_CONN_STRING = "jdbc:mysql://localhost:3306/realty";
	    //Provided by your driver documentation. In this case, a MySql driver is used : 
	    String DRIVER_CLASS_NAME = "org.gjt.mm.mysql.Driver";
	    String USER_NAME = "root";
	    String PASSWORD = "rootpass";
	    
	    Connection result = null;
	    try {
	      Class.forName(DRIVER_CLASS_NAME).newInstance();
	    }
	    catch (Exception ex){
	    	System.out.println( "Check classpath. Cannot load db driver: " + DRIVER_CLASS_NAME);
	    }

	    try {
	      result = DriverManager.getConnection(DB_CONN_STRING, USER_NAME, PASSWORD);
	    }
	    catch (SQLException e){
	    	e.printStackTrace();
	      System.out.println( "Driver loaded, but cannot connect to db: " + DB_CONN_STRING);
	    }
	    return result;
	  }


	

	
	public Object uploadBlob (String fileName, InputStream blobIS, String sql, int size ) {
		
		Boolean executeSuccess = true; 
    	
    	sql = sql.trim();



        try {
            //conn = dataSource.getConnection();

            pStmt = conn.prepareStatement(sql);
            
            pStmt.setString(1,fileName);
            pStmt.setBinaryStream(2, blobIS, size);
            

            pStmt.executeUpdate();

  
        }
        catch (Exception e) {
        	e.printStackTrace();
        	executeSuccess = false;
        }
        
        return executeSuccess;
		
	}
	
	public Object runSQL (String sql, Object [] values){
		
		Boolean executeSuccess = true; 
    	
    	sql = sql.trim();



        try {
            //conn = dataSource.getConnection();

            pStmt = conn.prepareStatement(sql);
            
            for(int i=0;i<values.length;i++) {
            	Object obj = values[i];
            	
            	if(obj instanceof String) {
            		pStmt.setString(i+1, obj.toString());
            	}
            	else if(obj instanceof Integer) {
            		pStmt.setInt(i+1, ((Integer) values[i]).intValue());
            	}
            	else if(obj instanceof Date) {
            		pStmt.setDate(i+1, ((Date)values[i]));
            	}
            
            
            }
  

            pStmt.executeUpdate();

  
        }
        catch (Exception e) {
        	e.printStackTrace();
        	executeSuccess = false;
        }
        
        return executeSuccess;
		
	}
	
	//TODO: Refactor not to return two types - ResultSet/Boolean
    public Object runSQL (String sql){
    	
    	Boolean executeSuccess = false; 
    	
    	sql = sql.trim().toUpperCase();



        try {
           // conn = dataSource.getConnection();

            stmt = conn.createStatement();
            
            
            
            if(sql.startsWith("SELECT")){

            	ResultSet results = stmt.executeQuery(sql);	 
            	return results;
            } else 
            if (sql.startsWith("INSERT") || (sql.startsWith("REPLACE")) || (sql.startsWith("UPDATE")) || (sql.startsWith("DELETE"))) {
            	if(stmt.executeUpdate(sql)==1){
            		executeSuccess=true;
            	}
            }
  
        }
        catch (Exception e) {
        	e.printStackTrace();
        }
        
        return executeSuccess;
    }	
    
    public void close() {
        

        try {
			if(stmt!=null) {
				stmt.close();
			}
			if(pStmt!=null) {
				pStmt.close();
			}
	        pStmt = null;
	        stmt = null;

	        conn.close();
	        conn = null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    }

}

