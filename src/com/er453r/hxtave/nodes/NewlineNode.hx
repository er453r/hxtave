package com.er453r.hxtave.nodes;

import com.er453r.parser.prototypes.Token;

class NewlineNode implements Token{
	private static var NEWLINE_REGEX:String = "\n";

	public function new(){}

	public function regEx(){
		return NEWLINE_REGEX;
	}

	public function getInstance(statement:String):Token{
		return new NewlineNode();
	}
}
