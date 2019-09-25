package app.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table
public class Roles {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Role_ID")
	private Long role_ID;
	@NotEmpty(message="{javax.validation.constraints.NotEmpty.message}")
	private String name;
	
	
	private ArrayList<String> fonction;
	
	@OneToMany(mappedBy = "role",fetch=FetchType.EAGER )
	private List<USER_PARAM> users;
	
	
	public Roles() {}
	
	public Roles(Roles r) {
		role_ID=r.getRole_ID();
		name=r.getName();
		fonction=r.getFonction();
		users=r.getUsers();
	}
	
	public Roles(Long role_ID, String pname, ArrayList<String> pfonction) {
		this.role_ID = role_ID;
		name = pname;
		fonction = pfonction;
	}



	public Roles(Long id, String pname, ArrayList<String> pfonction, List<USER_PARAM> users) {
		role_ID = id;
		name = pname;
		fonction = pfonction;
		this.users = users;
	}

	

	public Long getRole_ID() {
		return role_ID;
	}
	public void setRole_ID(Long id) {
		role_ID = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String pname) {
		name = pname;
	}
	public ArrayList<String> getFonction() {
		return fonction;
	}
	public void setFonction(ArrayList<String> pfonction) {
		fonction = pfonction;
	}
	public List<USER_PARAM> getUsers() {
		return users;
	}
	public void setUsers(List<USER_PARAM> users) {
		this.users = users;
	}
	@Override
	public String toString() {
		return "Roles [Id=" + role_ID + ", Name=" + name + ", Fonction=" + fonction +  "]";
	}
	
	
	 
}
