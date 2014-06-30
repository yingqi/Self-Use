package compiler;
import java.util.ArrayList;


public class Expr {
	public ArrayList<Expr> sons;
	public String attribute;
	public String value;
	public int startkey;
	public int endkey;
	public Expr(String attribute,int startkey,int endkey) {
		this.attribute = attribute;
		sons = new ArrayList<Expr>();
		this.startkey = startkey;
		this.endkey = endkey;
	}
	public Expr(String attribute) {
		this.attribute = attribute;
		sons = new ArrayList<Expr>();
	}
}
