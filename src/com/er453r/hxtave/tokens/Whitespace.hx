package com.er453r.hxtave.tokens;

import com.er453r.parser.Token;

class Whitespace implements Token{
	private static var WHITESPACE_REGEX:String = "[\n\r\t ]";

	public function new(){}

	public function regEx(){
		return WHITESPACE_REGEX;
	}

	public function getInstance(statement:String):Token{
		return new Whitespace();
	}
}
