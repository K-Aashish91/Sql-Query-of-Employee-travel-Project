package com.project.main.repository;

import com.project.main.domain.LoginDetails;

public interface LoginDetailsRepositoryInterface {
  
	public boolean verifyUser(LoginDetails loginDetails);
	
}
