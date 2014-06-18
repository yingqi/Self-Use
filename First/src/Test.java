
public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
    	try {
    	Class.forName("com.mysql.jdbc.Driver");
    	System.out.println("find driver");
    	} catch(ClassNotFoundException e){
    	System.out.println("can not find driver");
    	}

	}

}
