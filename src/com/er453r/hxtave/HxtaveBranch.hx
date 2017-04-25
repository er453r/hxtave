package com.er453r.hxtave;

import com.er453r.parser.Token;
import com.er453r.parser.TokenConsumer;

class HxtaveBranch implements TokenConsumer {
	private var tokens:Array<Token> = [];

	public function new() {}

	public function addToken(token:Token){
		tokens.push(token);
	}
}
