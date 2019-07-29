package app.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;



@Entity
@Table
public class USER_PARAM implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="USER_ID")
	private Long  USER_ID ; 
	
	private String  USER_CODE ; 
	
	@javax.validation.constraints.NotEmpty(message="{javax.validation.constraints.NotEmpty.message}")
	private String  USER_NAME ;
	private String  USER_TYPE ;
	@javax.validation.constraints.NotEmpty(message="{javax.validation.constraints.NotEmpty.message}") 
	private String  USER_PASSWORD;  
	private String  USER_BANK_CODE;  
	private String  USER_BRANCH_CODE;  
	private int     NUMBER_OF_TRIES ;
	private int     NUMBER_OF_TRIES_ALLOWED;  
	private String  IP_ADDRESS_MANG ;
	private String  IP_ADDRESS ;
	private String  CONNECTED ;
	private char    FIRST_CONNECTION; 
	private int     NBRE_SESSION_ALLOWED; 
	private int     NBRE_SEESION_CONNECTED ; 
	private int     LENGTH_PASSWORD;
	private char    COMPLEXITY_FLAG;
	private int     EXPIRATION_PASSWORD; 
	private Date    DATE_START_PASS; 
	private Date    DATE_END_PASS  ;
	private char    BLOCK_ACCESS  ;
	private char    LANGUAGE_CODE  ;
	private String  LAST_4_PWD ;
	
	
	
	
	public USER_PARAM() {
		
		USER_TYPE="t1";
		
		NUMBER_OF_TRIES = 0;
		NUMBER_OF_TRIES_ALLOWED = 0;
		NBRE_SESSION_ALLOWED = 0;
		NBRE_SEESION_CONNECTED = 0;
		LENGTH_PASSWORD = 0;
		EXPIRATION_PASSWORD = 0;	
		FIRST_CONNECTION='d';
		COMPLEXITY_FLAG='d';
		BLOCK_ACCESS='d';
		LANGUAGE_CODE='d';
	}



	

	public Long getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(Long uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getUSER_CODE() {
		return USER_CODE;
	}
	public void setUSER_CODE(String uSER_CODE) {
		USER_CODE = uSER_CODE;
	}
	public String getUSER_NAME() {
		return USER_NAME;
	}
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	public String getUSER_TYPE() {
		return USER_TYPE;
	}
	public void setUSER_TYPE(String uSER_TYPE) {
		USER_TYPE = uSER_TYPE;
	}
	public String getUSER_PASSWORD() {
		return USER_PASSWORD;
	}
	public void setUSER_PASSWORD(String uSER_PASSWORD) {
		USER_PASSWORD = uSER_PASSWORD;
	}
	public String getUSER_BANK_CODE() {
		return USER_BANK_CODE;
	}
	public void setUSER_BANK_CODE(String uSER_BANK_CODE) {
		USER_BANK_CODE = uSER_BANK_CODE;
	}
	public String getUSER_BRANCH_CODE() {
		return USER_BRANCH_CODE;
	}
	public void setUSER_BRANCH_CODE(String uSER_BRANCH_CODE) {
		USER_BRANCH_CODE = uSER_BRANCH_CODE;
	}
	public int getNUMBER_OF_TRIES() {
		return NUMBER_OF_TRIES;
	}
	public void setNUMBER_OF_TRIES(int nUMBER_OF_TRIES) {
		NUMBER_OF_TRIES = nUMBER_OF_TRIES;
	}
	public int getNUMBER_OF_TRIES_ALLOWED() {
		return NUMBER_OF_TRIES_ALLOWED;
	}
	public void setNUMBER_OF_TRIES_ALLOWED(int nUMBER_OF_TRIES_ALLOWED) {
		NUMBER_OF_TRIES_ALLOWED = nUMBER_OF_TRIES_ALLOWED;
	}
	public String getIP_ADDRESS_MANG() {
		return IP_ADDRESS_MANG;
	}
	public void setIP_ADDRESS_MANG(String iP_ADDRESS_MANG) {
		IP_ADDRESS_MANG = iP_ADDRESS_MANG;
	}
	public String getIP_ADDRESS() {
		return IP_ADDRESS;
	}
	public void setIP_ADDRESS(String iP_ADDRESS) {
		IP_ADDRESS = iP_ADDRESS;
	}
	public String getCONNECTED() {
		return CONNECTED;
	}
	public void setCONNECTED(String cONNECTED) {
		CONNECTED = cONNECTED;
	}
	public char getFIRST_CONNECTION() {
		return FIRST_CONNECTION;
	}
	public void setFIRST_CONNECTION(char fIRST_CONNECTION) {
		FIRST_CONNECTION = fIRST_CONNECTION;
	}
	public int getNBRE_SESSION_ALLOWED() {
		return NBRE_SESSION_ALLOWED;
	}
	public void setNBRE_SESSION_ALLOWED(int nBRE_SESSION_ALLOWED) {
		NBRE_SESSION_ALLOWED = nBRE_SESSION_ALLOWED;
	}
	public int getNBRE_SEESION_CONNECTED() {
		return NBRE_SEESION_CONNECTED;
	}
	public void setNBRE_SEESION_CONNECTED(int nBRE_SEESION_CONNECTED) {
		NBRE_SEESION_CONNECTED = nBRE_SEESION_CONNECTED;
	}
	public int getLENGTH_PASSWORD() {
		return LENGTH_PASSWORD;
	}
	public void setLENGTH_PASSWORD(int lENGTH_PASSWORD) {
		LENGTH_PASSWORD = lENGTH_PASSWORD;
	}
	public char getCOMPLEXITY_FLAG() {
		return COMPLEXITY_FLAG;
	}
	public void setCOMPLEXITY_FLAG(char cOMPLEXITY_FLAG) {
		COMPLEXITY_FLAG = cOMPLEXITY_FLAG;
	}
	public int getEXPIRATION_PASSWORD() {
		return EXPIRATION_PASSWORD;
	}
	public void setEXPIRATION_PASSWORD(int eXPIRATION_PASSWORD) {
		EXPIRATION_PASSWORD = eXPIRATION_PASSWORD;
	}
	public Date getDATE_START_PASS() {
		return DATE_START_PASS;
	}
	public void setDATE_START_PASS(Date dATE_START_PASS) {
		DATE_START_PASS = dATE_START_PASS;
	}
	public Date getDATE_END_PASS() {
		return DATE_END_PASS;
	}
	public void setDATE_END_PASS(Date dATE_END_PASS) {
		DATE_END_PASS = dATE_END_PASS;
	}
	public char getBLOCK_ACCESS() {
		return BLOCK_ACCESS;
	}
	public void setBLOCK_ACCESS(char bLOCK_ACCESS) {
		BLOCK_ACCESS = bLOCK_ACCESS;
	}
	public char getLANGUAGE_CODE() {
		return LANGUAGE_CODE;
	}
	public void setLANGUAGE_CODE(char lANGUAGE_CODE) {
		LANGUAGE_CODE = lANGUAGE_CODE;
	}
	public String getLAST_4_PWD() {
		return LAST_4_PWD;
	}
	public void setLAST_4_PWD(String lAST_4_PWD) {
		LAST_4_PWD = lAST_4_PWD;
	}





	
	public String toString() {
		return "USER_PARAM [USER_ID=" + USER_ID + ", USER_CODE=" + USER_CODE + ", USER_NAME=" + USER_NAME
				+ ", USER_TYPE=" + USER_TYPE + ", USER_PASSWORD=" + USER_PASSWORD + ", USER_BANK_CODE=" + USER_BANK_CODE
				+ ", USER_BRANCH_CODE=" + USER_BRANCH_CODE + ", NUMBER_OF_TRIES=" + NUMBER_OF_TRIES
				+ ", NUMBER_OF_TRIES_ALLOWED=" + NUMBER_OF_TRIES_ALLOWED + ", IP_ADDRESS_MANG=" + IP_ADDRESS_MANG
				+ ", IP_ADDRESS=" + IP_ADDRESS + ", CONNECTED=" + CONNECTED + ", FIRST_CONNECTION=" + FIRST_CONNECTION
				+ ", NBRE_SESSION_ALLOWED=" + NBRE_SESSION_ALLOWED + ", NBRE_SEESION_CONNECTED="
				+ NBRE_SEESION_CONNECTED + ", LENGTH_PASSWORD=" + LENGTH_PASSWORD + ", COMPLEXITY_FLAG="
				+ COMPLEXITY_FLAG + ", EXPIRATION_PASSWORD=" + EXPIRATION_PASSWORD + ", DATE_START_PASS="
				+ DATE_START_PASS + ", DATE_END_PASS=" + DATE_END_PASS + ", BLOCK_ACCESS=" + BLOCK_ACCESS
				+ ", LANGUAGE_CODE=" + LANGUAGE_CODE + ", LAST_4_PWD=" + LAST_4_PWD + "]";
	}
	
	
	
	
	
}
