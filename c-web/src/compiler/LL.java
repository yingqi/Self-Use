package compiler;
import java.util.ArrayList;


public class LL {
	public Expr parse(ArrayList<Lex> lexs) throws Exception {
		Expr head = new Expr("program", 0, lexs.size() - 1);
		Expr expr = new Expr("stmt-seq", 0, lexs.size() - 1);
		head.sons.add(expr);
		stmt_seq(expr, lexs);
		return head;
	}

	public int stmt_seq(Expr expr, ArrayList<Lex> lexs) throws Exception {
		Expr expr_stmt = new Expr("statement", expr.startkey, expr.endkey);
		expr.sons.add(expr_stmt);
		int key = stmt(expr_stmt, lexs);
		key++;
		Expr expr_seq1 = new Expr("stmt-seq1", key, expr.endkey);
		expr.sons.add(expr_seq1);
		key = stmt_seq1(expr_seq1, lexs);
		return key;
	}

	public int stmt_seq1(Expr expr, ArrayList<Lex> lexs) throws Exception {
		int key = expr.startkey;
		if (key<lexs.size()&&lexs.get(key).attribute.equals(";")) {
			key++;
			Expr expr_stmt = new Expr("statement", expr.startkey, expr.endkey);
			expr.sons.add(expr_stmt);
			key = stmt(expr_stmt, lexs);
			key++;
			Expr expr_seq1 = new Expr("stmt-seq1", key, expr.endkey);
			expr.sons.add(expr_seq1);
			key = stmt_seq1(expr_seq1, lexs);
		}
		return key;
	}

	public int stmt(Expr expr, ArrayList<Lex> lexs) throws Exception {
		int key = expr.startkey;
		if (lexs.get(expr.startkey).attribute.equals("if")) {

			Expr expr_if = new Expr("if-statement", expr.startkey, expr.endkey);
			expr.sons.add(expr_if);
			key = if_stmt(expr_if, lexs);
		} else if (lexs.get(expr.startkey).attribute.equals("repeat")) {

			Expr expr_repeat = new Expr("repeat-statement", expr.startkey,
					expr.endkey);
			expr.sons.add(expr_repeat);
			key = repeat_stmt(expr_repeat, lexs);
		} else if (lexs.get(expr.startkey).attribute.equals("identifier")
				&& lexs.get(expr.startkey + 1).attribute.equals(":=")) {

			Expr expr_assign = new Expr("assign-statement", expr.startkey,
					expr.endkey);
			expr.sons.add(expr_assign);
			key = assign_stmt(expr_assign, lexs);
		} else if (lexs.get(expr.startkey).attribute.equals("read")
				&& lexs.get(expr.startkey + 1).attribute.equals("identifier")) {

			Expr expr_read = new Expr("read-statement", expr.startkey,
					expr.endkey);
			expr.sons.add(expr_read);
			key = read_stmt(expr_read, lexs);
		} else if (lexs.get(expr.startkey).attribute.equals("write")) {

			Expr expr_write = new Expr("write-statement", expr.startkey,
					expr.endkey);
			expr.sons.add(expr_write);
			key = write_stmt(expr_write, lexs);
		} else {
			throw new Exception("Error parsing Statement");
		}
		return key;
	}

	public int if_stmt(Expr expr, ArrayList<Lex> lexs) throws Exception {
		int key = expr.startkey;
		while (lexs.get(key).attribute != "then" && key < expr.endkey) {
			key++;
		}
		if (!lexs.get(key).equals("then")) {
			throw new Exception("Not Complete if-statement");
		}
		int key_then = key;
		while (lexs.get(key).attribute != "end" && key < expr.endkey) {
			key++;
		}
		if (!lexs.get(key).equals("end")) {
			throw new Exception("Not Complete if-statement");
		}
		int key_end = key;
		int key_else = -1;
		for (int i = key_then + 1; i < key_end; i++) {
			if (lexs.get(i).equals("else")) {
				key_else = i;
			}
		}
		if (key_else == -1) {
			int key_if = expr.startkey;
			Expr expr_exp = new Expr("exp", key_if + 1, key_then - 1);
			Expr expr_seq = new Expr("stmt_seq", key_then + 1, key_end - 1);
			expr.sons.add(expr_exp);
			expr.sons.add(expr_seq);
			exp(expr_exp, lexs);
			stmt_seq(expr_seq, lexs);
		} else {
			int key_if = expr.startkey;
			Expr expr_exp = new Expr("exp", key_if + 1, key_then - 1);
			Expr expr_seq1 = new Expr("stmt_seq", key_then + 1, key_else - 1);
			Expr expr_seq2 = new Expr("stmt_seq", key_else + 1, key_end - 1);
			expr.sons.add(expr_exp);
			expr.sons.add(expr_seq1);
			expr.sons.add(expr_seq2);
			exp(expr_exp, lexs);
			stmt_seq(expr_seq1, lexs);
			stmt_seq(expr_seq2, lexs);
		}
		return key;
	}

	public int repeat_stmt(Expr expr, ArrayList<Lex> lexs) throws Exception {
		int key = expr.startkey;
		int key_repeat = key;
		while (lexs.get(key).attribute != "until" && key < expr.endkey) {
			key++;
		}
		if (!lexs.get(key).equals("until")) {
			throw new Exception("Not Complete repeat-statement");
		}
		int key_until = key;
		Expr expr_seq = new Expr("stmt_seq", key_repeat + 1, key_until - 1);
		expr.sons.add(expr_seq);
		stmt_seq(expr_seq, lexs);
		Expr expr_exp = new Expr("exp", key_until + 1, expr.endkey - 1);
		expr.sons.add(expr_exp);
		exp(expr_exp, lexs);
		key = expr.endkey;
		return key;
	}

	public int assign_stmt(Expr expr, ArrayList<Lex> lexs) throws Exception {
		int key = expr.startkey + 2;
		Expr expr_exp = new Expr("exp", key, expr.endkey);
		expr.sons.add(expr_exp);
		exp(expr_exp, lexs);
		key = expr.endkey;
		return key;
	}

	public int read_stmt(Expr expr, ArrayList<Lex> lexs) {
		expr.endkey = expr.startkey + 1;
		return expr.endkey;
	}

	public int write_stmt(Expr expr, ArrayList<Lex> lexs) throws Exception {
		int key = expr.startkey + 1;
		Expr expr_exp = new Expr("exp", key, expr.endkey);
		expr.sons.add(expr_exp);
		exp(expr_exp, lexs);
		key = expr.endkey;
		return key;
	}

	public int exp(Expr expr, ArrayList<Lex> lexs) throws Exception {
		int key = expr.startkey;
		while (!(lexs.get(key).attribute.equals("<") || lexs.get(key).attribute
				.equals("=")) && key < expr.endkey) {
			key++;
		}
		if (!(lexs.get(key).attribute.equals("<") || lexs.get(key).attribute
				.equals("="))) {
			Expr s_exp = new Expr("s-exp", expr.startkey, expr.endkey);
			expr.sons.add(s_exp);
			key = s_exp(s_exp, lexs);
		} else {
			Expr s_exp1 = new Expr("s-exp", expr.startkey, key - 1);
			Expr s_exp2 = new Expr("s-exp", key + 1, expr.endkey);
			expr.sons.add(s_exp1);
			expr.sons.add(s_exp2);
			key = s_exp(s_exp1, lexs);
			key = s_exp(s_exp2, lexs);
		}
		key = expr.endkey;
		return key;
	}

	public int s_exp(Expr expr, ArrayList<Lex> lexs) throws Exception {
		Expr expr_term = new Expr("term", expr.startkey, expr.endkey);
		expr.sons.add(expr_term);
		int key = term(expr_term, lexs);
		key++;
		Expr s_exp1 = new Expr("s-exp1", key, expr.endkey);
		expr.sons.add(s_exp1);
		key = s_exp1(s_exp1, lexs);
		return key;
	}

	public int s_exp1(Expr expr, ArrayList<Lex> lexs) throws Exception {
		int key = expr.startkey;
		if (key<lexs.size()&&lexs.get(key).attribute.equals("+")
				|| lexs.get(key).attribute.equals("-")) {
			Expr expr_add = new Expr("addop", expr.startkey, expr.startkey);
			expr.sons.add(expr_add);
			key++;
			Expr expr_term = new Expr("term", key, expr.endkey);
			expr.sons.add(expr_term);
			key = term(expr_term, lexs);
			key++;
			Expr s_exp1 = new Expr("s-exp1", key, expr.endkey);
			expr.sons.add(s_exp1);
			key = s_exp1(s_exp1, lexs);
		}
		return key;
	}

	public int term(Expr expr, ArrayList<Lex> lexs) throws Exception {
		Expr expr_fact = new Expr("factor", expr.startkey, expr.endkey);
		expr.sons.add(expr_fact);
		int key = fact(expr_fact, lexs);
		key++;
		Expr term1 = new Expr("term1", key, expr.endkey);
		expr.sons.add(term1);
		key = term1(term1, lexs);
		return key;
	}

	public int term1(Expr expr, ArrayList<Lex> lexs) throws Exception {
		int key = expr.startkey;
		if (key<lexs.size()&&lexs.get(key).attribute.equals("*")
				|| lexs.get(key).attribute.equals("/")) {
			Expr expr_mul = new Expr("mulop", expr.startkey, expr.startkey);
			expr.sons.add(expr_mul);
			key++;
			Expr expr_fact = new Expr("factor", key, expr.endkey);
			expr.sons.add(expr_fact);
			key = fact(expr_fact, lexs);
			key++;
			Expr term1 = new Expr("term1", key, expr.endkey);
			expr.sons.add(term1);
			key = term1(term1, lexs);
		}
		return key;
	}

	public int fact(Expr expr, ArrayList<Lex> lexs) throws Exception {
		int key = expr.startkey;
		if (lexs.get(expr.startkey).equals("number")) {
			Expr expr_num = new Expr("number", expr.startkey, expr.startkey);
			expr.sons.add(expr_num);
		} else if (lexs.get(expr.startkey).equals("identifier")) {
			Expr expr_iden = new Expr("identifier", expr.startkey,
					expr.startkey);
			expr.sons.add(expr_iden);
		} else if (lexs.get(expr.startkey).equals("(")
				&& lexs.get(expr.endkey).equals(")")) {
			Expr expr_exp = new Expr("exp", expr.startkey + 1, expr.endkey - 1);
			expr.sons.add(expr_exp);
			exp(expr_exp, lexs);
		} else {
			throw new Exception("Error Parsing factor!");
		}
		key = expr.endkey;
		return key;
	}

}
