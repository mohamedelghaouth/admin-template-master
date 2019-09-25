package app.model;

import java.util.ArrayList;
import java.util.HashMap;

public class Functionalities {
	
	private   ArrayList<String> FUNCTIONALITIES;
	
	private static Functionalities Functionalities=new Functionalities();

	private Functionalities() 
		{
			FUNCTIONALITIES=new ArrayList<String>();
			
			FUNCTIONALITIES.add("lister_users");		
			FUNCTIONALITIES.add("lister_roles");		
		}

	public static Functionalities getInctance() 
		{
			if (Functionalities==null) return new Functionalities();
			return Functionalities;
		}

	
	public ArrayList<String> getFUNCTIONALITIES() {
		return FUNCTIONALITIES;
	}

	public void setFUNCTIONALITIES(ArrayList<String> fUNCTIONALITIES) {
		FUNCTIONALITIES = fUNCTIONALITIES;
	}

	
	
	
}
