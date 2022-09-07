package com.mindgate.main.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.mindgate.main.domain.Address;

public class AddressRowMapper implements RowMapper<Address> {

	@Override
	public Address mapRow(ResultSet rs, int rowNum) throws SQLException {
		int addressId = rs.getInt("address_Id");
		String buildingName = rs.getString("building_name");
		String street  = rs.getString("street");
		String city = rs.getString("city");
		int pin = rs.getInt("pin");
		
		Address address = new Address(addressId, buildingName, street, city, pin);
		
		return address;
	}
	
	

}
