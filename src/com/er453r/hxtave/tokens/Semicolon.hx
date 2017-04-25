package com.er453r.hxtave.tokens;

import com.er453r.parser.Token;

class Semicolon implements Token{
	private static var SEMICOLON_REGEX:String = ";";

	public function new(){}

	public function regEx(){
		return SEMICOLON_REGEX;
	}

	public function getInstance(statement:String):Token{
		return new Semicolon();
	}
}
