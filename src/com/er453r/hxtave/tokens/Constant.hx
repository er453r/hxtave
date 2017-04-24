package com.er453r.hxtave.tokens;

import com.er453r.parser.Token;

class Constant implements Token{
	private static var INTEGER_REGEX:String = "\\d+";

	public function new(){}

	public function regEx(){
		return INTEGER_REGEX;
	}
}
