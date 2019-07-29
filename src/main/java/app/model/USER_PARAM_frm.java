package app.model;

public class USER_PARAM_frm extends USER_PARAM {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2L;
	
	
	private String confpsswd;
	
	
	


	public USER_PARAM_frm() {
		super();
		
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
