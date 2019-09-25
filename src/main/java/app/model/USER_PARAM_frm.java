package app.model;

import javax.validation.constraints.NotEmpty;

public class USER_PARAM_frm extends USER_PARAM {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2L;
	
	@NotEmpty(message="{javax.validation.constraints.NotEmpty.message}")
	private String confpsswd;
	
	
	
	

	public USER_PARAM_frm() {
		super();
	}

	
	public USER_PARAM_frm(USER_PARAM user) {
		
		super(user);
		confpsswd=user.getUSER_PASSWORD();
	}

	public String getConfpsswd() {
		return confpsswd;
	}


	public void setConfpsswd(String confpsswd) {
		this.confpsswd = confpsswd;
	}


	@Override
	public String toString() {
		
		return super.toString()+"USER_PARAM_frm [confpsswd=" + confpsswd + "]";
	}


	
	
	
	
	
	
	

}
