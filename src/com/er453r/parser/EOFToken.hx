package com.er453r.parser;

import com.er453r.parser.prototypes.Token;

class EOFToken implements Token{
	public function new(){}

	public function regEx(){
		return null;
	}

	public function getInstance(statement:String):Token{
		return new EOFToken();
	}
}
