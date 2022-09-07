package com.mindgate.main.domain;

public class Address {
	private int addressId;
	private String buildingName;
	private String street;
	private String city;
	private int pin;
	
	public Address() {
		// TODO Auto-generated constructor stub
	}

	public Address(int addressId, String buildingName, String street, String city, int pin) {
		super();
		this.addressId = addressId;
		this.buildingName = buildingName;
		this.street = street;
		this.city = city;
		this.pin = pin;
	}
	

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public String getBuildingName() {
		return buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getPin() {
		return pin;
	}

	public void setPin(int pin) {
		this.pin = pin;
	}

	@Override
	public String toString() {
		return "Address [addressId=" + addressId + ", buildingName=" + buildingName + ", street=" + street + ", city="
				+ city + ", pin=" + pin + "]";
	}
	
	
	
}
