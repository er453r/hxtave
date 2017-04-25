package com.er453r.hxtave.tokens;

import com.er453r.parser.Token;

class Constant implements Token{
	private static var INTEGER_REGEX:String = "\\d+";

	private var variable:Variable;

	public function new(?statement:String){
		if(statement != null)
			variable = new Variable(Std.parseFloat(statement));
	}

	public function regEx(){
		return INTEGER_REGEX;
	}

	public function getInstance(statement:String):Token{
		return new Constant(statement);
	}
}
