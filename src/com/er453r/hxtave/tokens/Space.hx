package com.er453r.hxtave.tokens;

import com.er453r.parser.Token;

class Space implements Token{
	private static var SPACE_REGEX:String = " ";

	public function new(){}

	public function regEx(){
		return SPACE_REGEX;
	}

	public function getInstance(statement:String):Token{
		return new Space();
	}
}
