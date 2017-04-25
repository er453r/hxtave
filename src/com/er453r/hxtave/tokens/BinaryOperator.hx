package com.er453r.hxtave.tokens;

import com.er453r.parser.TokenConsumer;
import com.er453r.parser.Token;

class BinaryOperator implements Token implements TokenConsumer{
	private static var ADD_REGEX:String = "[\\+\\*]";

	public function new(){}

	public function regEx(){
		return ADD_REGEX;
	}

	public function getInstance(statement:String):Token{
		return new BinaryOperator();
	}

	public function addToken(token:Token){

	}
}
