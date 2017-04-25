package com.er453r.hxtave.nodes;

import com.er453r.parser.prototypes.Token;

class SemicolonNode implements Token{
	private static var SEMICOLON_REGEX:String = ";";

	public function new(){}

	public function regEx(){
		return SEMICOLON_REGEX;
	}

	public function getInstance(statement:String):Token{
		return new SemicolonNode();
	}
}
