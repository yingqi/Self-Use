package compiler;
import java.util.ArrayList;


public class Compiler {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		ArrayList<Lex> lexs1 = LexTest("read ad");
		ArrayList<Lex> lexs2 = LexTest("i*i");
		LL ll = new LL();
		System.out.println("LL Analysis on \"read ad\".");
		output(ll.parse(lexs1));
		SF sf = new SF();
		System.out.println("SF Analysis on \"i*i\".");
		output(sf.parse(lexs2));
	}
	
	public static ArrayList<Lex> LexTest(String testString) throws Exception{
		LexicalAnalysis la = new LexicalAnalysis();
		ArrayList<Lex> lexs=la.getToken(testString);
		for(Lex lex:lexs){
			System.out.println(lex.lex+"  Attribute: "+lex.attribute);
		}
		return lexs;
	}
	
	public static void output(Expr head){
		ArrayList<Expr> output = new ArrayList<Expr>();
		f_traversal(head,output);	
	}
	
	public static void f_traversal(Expr head ,ArrayList<Expr> output){
		output.add(head);
		System.out.println(head.attribute);
		for(Expr expr:head.sons){
			f_traversal(expr, output);
		}
	}
}
