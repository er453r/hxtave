package com.er453r.hxtave.tokens;

import com.er453r.parser.Token;

class Multiply implements Token{
	private static var MULTIPLY_REGEX:String = "\\*";

	public function new(){}

	public function regEx(){
		return MULTIPLY_REGEX;
	}
}
