package com.er453r.hxtave.tokens;

import com.er453r.parser.Token;

class Add implements Token{
	private static var ADD_REGEX:String = "\\+";

	public function new(){}

	public function regEx(){
		return ADD_REGEX;
	}
}
