package app.service;

import java.util.ArrayList;

import app.model.USER_PARAM;

public interface Iuserservice {
	
	public USER_PARAM Register(USER_PARAM user);
	public USER_PARAM login(USER_PARAM user);
	public ArrayList<USER_PARAM> getALL();
	public void delete(Long user_ID);
	public void update(USER_PARAM user);
	public USER_PARAM findbyID(Long user_ID);

}
