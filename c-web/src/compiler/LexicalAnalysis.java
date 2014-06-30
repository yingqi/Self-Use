package compiler;
import java.util.ArrayList;

public class LexicalAnalysis {

	public  ArrayList<Lex> getToken(String raw) throws Exception {
		ArrayList<Lex> result = new ArrayList<Lex>();
		
		int i = 0, linenumber = 1;
		while (raw!=null&&i < raw.length()) {
			if (raw.charAt(i) <= 57 && raw.charAt(i) >= 48) {
				i = parseNumber(raw, i, result, linenumber);
			} else if ((raw.charAt(i) <= 90 && raw.charAt(i) >= 65)
					|| (raw.charAt(i) <= 122 && raw.charAt(i) >= 97)) {
				i = parseLetter(raw, i, result, linenumber);
			} else if (raw.charAt(i) == 32 || raw.charAt(i) == 9) {
				i++;
			} else if (raw.charAt(i) == 13) {
				i++;
				linenumber += 1;
			} else if (raw.charAt(i) == 43) {
				i++;
				Lex t = new Lex();
				t.attribute = "+";
				t.lex = "+";
				t.lineNumber = linenumber;
				result.add(t);
			} else if (raw.charAt(i) == 45) {
				i++;
				Lex t = new Lex();
				t.attribute = "-";
				t.lex = "-";
				t.lineNumber = linenumber;
				result.add(t);
			} else if (raw.charAt(i) == 42) {
				i++;
				Lex t = new Lex();
				t.attribute = "*";
				t.lex = "*";
				t.lineNumber = linenumber;
				result.add(t);
			} else if (raw.charAt(i) == 47) {
				i++;
				Lex t = new Lex();
				t.attribute = "/";
				t.lex = "/";
				t.lineNumber = linenumber;
				result.add(t);
			} else if (raw.charAt(i) == 61) {
				i++;
				Lex t = new Lex();
				t.attribute = "=";
				t.lex = "=";
				t.lineNumber = linenumber;
				result.add(t);
			} else if (raw.charAt(i) == 60) {
				i++;
				Lex t = new Lex();
				t.attribute = "<";
				t.lex = "<";
				t.lineNumber = linenumber;
				result.add(t);
			} else if (raw.charAt(i) == 58 && raw.charAt(i + 1) == 61) {
				Lex t = new Lex();
				t.attribute = ":=";
				t.lex = ":=";
				t.lineNumber = linenumber;
				result.add(t);
				i += 2;
			} else if (raw.charAt(i) == 59) {
				i++;
				Lex t = new Lex();
				t.attribute = ";";
				t.lex = ";";
				t.lineNumber = linenumber;
				result.add(t);
			}else if (raw.charAt(i) == 40) {
				i++;
				Lex t = new Lex();
				t.attribute = "(";
				t.lex = "(";
				t.lineNumber = linenumber;
				result.add(t);
			} else if (raw.charAt(i) == 41) {
				i++;
				Lex t = new Lex();
				t.attribute = ")";
				t.lex = ")";
				t.lineNumber = linenumber;
				result.add(t);
			}else if (raw.charAt(i) == 123) {
				i = parseComment(raw, i + 1, result, linenumber);
			}else {
				throw new Exception("Illegeal Input!");
			}
		}
		return result;
	}

	public  int parseComment(String raw, int i, ArrayList<Lex> result,
			int linenumber) throws Exception {
		while (raw.charAt(i) != 125 && i < raw.length()) {
			if (raw.charAt(i) == 123) {
				throw new Exception("Double \"{\" Found!");
			}
			i++;
		}
		if (raw.charAt(i) == 125) {
			i++;
		} else {
			throw new Exception("Only \"{\" Found!");
		}
		return i;
	}

	public  int parseNumber(String raw, int i, ArrayList<Lex> result,
			int linenumber) {
		String temp = "";
		while (i<raw.length()&&raw.charAt(i) <= 57 && raw.charAt(i) >= 48) {
			temp += raw.charAt(i);
			i++;
		}
		String attribute = "number";
		Lex t = new Lex();
		t.attribute = attribute;
		t.lex = temp;
		t.lineNumber = linenumber;
		result.add(t);
		return i;
	}

	public  int parseLetter(String raw, int i, ArrayList<Lex> result,
			int linenumber) {
		String temp = "";
		while ((raw.charAt(i) <= 90 && raw.charAt(i) >= 65 )
				|| (raw.charAt(i) <= 122 && raw.charAt(i) >= 97)) {
			temp += raw.charAt(i);
			i++;
			if(i>=raw.length()){
				break;
			}
		}
		String attribute = null;
		if (temp.equals("if")) {
			attribute = "if";
		} else if (temp.equals("then")) {
			attribute = "then";
		} else if (temp.equals("else")) {
			attribute = "else";
		} else if (temp.equals("end")) {
			attribute = "end";
		} else if (temp.equals("repeat")) {
			attribute = "repeat";
		} else if (temp.equals("until")) {
			attribute = "until";
		} else if (temp.equals("read")) {
			attribute = "read";
		} else if (temp.equals("while")) {
			attribute = "while";
		} else {
			attribute = "identifier";
		}
		Lex t = new Lex();
		t.attribute = attribute;
		t.lex = temp;
		t.lineNumber = linenumber;
		result.add(t);
		return i;
	}
}
