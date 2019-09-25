package app.service;

import java.util.ArrayList;

import app.model.Roles;
import app.model.USER_PARAM;

public interface Iroleservice {
	
	public Roles Register(Roles user);
	public ArrayList<Roles> getALL();
	public void delete(Long Role_ID);
	public Roles findbyID(Long Role_ID);
	public void update(Roles user);
	
}
