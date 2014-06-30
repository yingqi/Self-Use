package compiler;
import java.util.ArrayList;
import java.util.Stack;

public class SF {
	public Expr parse(ArrayList<Lex> lexs) throws Exception {
		Expr head = null;
		Stack<Expr> opndStack = new Stack<Expr>();
		Stack<Lex> optrStack = new Stack<Lex>();
		optrStack.add(new Lex("#"));
		lexs.add(new Lex("#"));
		int i = 0;
		while (i < lexs.size()) {
			Lex now = lexs.get(i);
			if (now.attribute.equals("identifier")) {
				Expr expr = new Expr("identifier");
				expr.value = now.lex;
				opndStack.push(expr);
				i++;
			} else if (compare(optrStack.peek().attribute, now.attribute) == 1) {
				Expr expr1 = opndStack.pop();
				Expr expr2 = opndStack.pop();
				Expr exprFather = new Expr(optrStack.pop().attribute);
				exprFather.sons.add(expr1);
				exprFather.sons.add(expr2);
				head = exprFather;
				i++;
			} else if (compare(optrStack.peek().attribute, now.attribute) == -1) {
				optrStack.push(now);
				i++;
			} else if (compare(optrStack.peek().attribute, now.attribute) == 0) {
				if (now.attribute.equals(")")) {
					optrStack.pop();
					i++;
				} else if (now.attribute.equals("#") && i == lexs.size() - 1) {
					return head;
				} else {
					throw new Exception("Error in \"=\"");
				}
			} else if (compare(optrStack.peek().attribute, now.attribute) == 2) {
				throw new Exception("Error input!");
			} else {
				throw new Exception("Other error!");
			}
		}
		return head;
	}

	private int compare(String first, String second) {
		int row = 0, col = 0;
		int sf[][] = new int[][] { { 1, 1, -1, -1, -1, -1, 1, 1 },
				{ 1, 1, -1, -1, -1, -1, 1, 1 }, { 1, 1, 1, 1, -1, -1, 1, 1 },
				{ 1, 1, 1, 1, -1, -1, 1, 1 }, { 1, 1, 1, 1, 2, 2, 1, 1 },
				{ -1, -1, -1, -1, -1, -1, 0, 2 }, { 1, 1, 1, 1, 2, 2, 1, 1 },
				{ -1, -1, -1, -1, -1, -1, 2, 0 } };
		String[] lexStrings = { "+", "-", "*", "/", "identifier", "(", ")", "#" };
		for (int i = 0; i < 8; i++) {
			if (lexStrings[i].equals(first)) {
				row = i;
			}
			if (lexStrings[i].equals(second)) {
				col = i;
			}
		}
		return sf[row][col];
	}
}
