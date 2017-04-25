package com.er453r.hxtave.tokens;

import com.er453r.parser.Token;

class Newline implements Token{
	private static var NEWLINE_REGEX:String = "\n";

	public function new(){}

	public function regEx(){
		return NEWLINE_REGEX;
	}

	public function getInstance(statement:String):Token{
		return new Newline();
	}
}
