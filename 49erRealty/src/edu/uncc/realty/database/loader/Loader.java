package edu.uncc.realty.database.loader;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;

/**
 * Loads the input file into the database. Run from command line.
 * @author guna
 *
 */
public class Loader {
	private static DatabaseManager db = new DatabaseManager();
	public static void main (String args[]) throws Exception {
		
		final String DELIMITER = "\\|";
		
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(args[0])));
		@SuppressWarnings("unused")
		String header = br.readLine();
		
		String row = null;
		while((row = br.readLine())!=null) {
			System.out.println(row);
			String [] fields = row.split(DELIMITER);
			writeToDB(fields);
		}
		db.close();
		br.close();
	}
	
	private static void writeToDB (String fields []) throws Exception {
		
		
		//Neighborhood
				String sql = "REPLACE INTO NEIGHBORHOOD VALUES ("+"'"+fields[4]+"'"+
															",'"+fields[2]+"')";
				System.out.println(sql);
				db.runSQL(sql);
				
				//Zipcode
				
				String sql1 = "REPLACE INTO ZIP_CODE VALUES ("+fields[3]+",'"
																+fields[6]+"'"+","
																+fields[7] +",'"
																+fields[5]+"'"+",'"
																+fields[8]+"'"+",'"
																+fields[9]
																		
																		+"')";
				System.out.println(sql1);
				db.runSQL(sql1);
		//Property
		
		//scrub squarefeet
		String sqftString = fields [21];
		int sqft = 0;
		if(sqftString!=null && !sqftString.trim().startsWith("null") && !sqftString.trim().equals("")) {
			sqftString = sqftString.trim().split(" ")[0];
			sqftString = sqftString.replaceAll(",", "");
			sqft = Integer.parseInt(sqftString);
		}

		String sql2 = "REPLACE INTO PROPERTY VALUES ("+fields[0]+",'"
														+fields[19]+"'"+","
														+sqft +","
														+fields[15]+","
														+fields[14]+","
														+fields[22]+","
														+0+",'"
														+fields[18]+"'"+","
														+fields[25]+","
														+fields[23]+","
														+fields[24]
																+")";
		System.out.println(sql2);
		db.runSQL(sql2);
		
	
				
		//Address
		

		String sql3 = "REPLACE INTO ADDRESS VALUES ("+fields[16]+",'"
														+fields[17]+"'"+","
														+fields[3]+","
														+fields[0]+","
														+fields[4]+","
														+fields[11]+","
														+fields[10]+",'"
														+fields[12]+"'"
														
																+")";
		System.out.println(sql3);
		db.runSQL(sql3);
		

	}
}
	