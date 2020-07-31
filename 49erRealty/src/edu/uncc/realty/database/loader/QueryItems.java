package edu.uncc.realty.database.loader;

public class QueryItems {
	public String city, zipcode, mincost, maxcost, sqft, beds, baths, countyName, streetNumber, streetName;
	
	
	
	public String getCity() {
		return city;
	}

	public String getCountyName() {
		return countyName;
	}

	public void setCountyName(String countyName) {
		this.countyName = countyName;
	}

	public String getStreetNumber() {
		return streetNumber;
	}

	public void setStreetNumber(String streetNumber) {
		this.streetNumber = streetNumber;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getMincost() {
		return mincost;
	}

	public void setMincost(String mincost) {
		this.mincost = mincost;
	}

	public String getMaxcost() {
		return maxcost;
	}

	public void setMaxcost(String maxcost) {
		this.maxcost = maxcost;
	}

	public String getSqft() {
		return sqft;
	}

	public void setSqft(String sqft) {
		this.sqft = sqft;
	}

	public String getBeds() {
		return beds;
	}

	public void setBeds(String beds) {
		this.beds = beds;
	}

	public String getBaths() {
		return baths;
	}

	public void setBaths(String baths) {
		this.baths = baths;
	}

	public void QueryItems()
	{
		city = null;
		zipcode = null;
		mincost = null;
		maxcost = null;
		sqft = null;
		beds = null;
		baths = null;
	}

}
