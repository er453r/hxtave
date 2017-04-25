package com.er453r.hxtave;

import Type;
import com.er453r.utils.Log;
import com.er453r.hxtave.tokens.Semicolon;
import com.er453r.hxtave.tokens.Whitespace;
import Array;
import com.er453r.parser.Token;
import com.er453r.parser.TokenConsumer;

class Branch implements TokenConsumer {
	private var token:Token;
	private var tokens:Array<Token> = [];

	public function new(){}

	public function addToken(token:Token){
		if(Std.is(token, Whitespace)){
			Log.debug("Ignoring whitespace");

			return;
		}

		if(Std.is(token, Semicolon)){
			Log.debug("Semicolon terminates existing expression");

			if(this.token != null)
				tokens.push(this.token);

			this.token = null;

			return;
		}

		if(Std.is(token, TokenConsumer)){
			Log.debug("New consumer appeared");

			cast(token, TokenConsumer).addToken(this.token);

			this.token = token;

			return;
		}

		if(this.token == null){
			Log.debug("Addding BinaryOperator token");

			this.token = token;

			return;
		}

		if(Std.is(this.token, TokenConsumer)){
			Log.debug("Adding to existing consumer");

			cast(this.token, TokenConsumer).addToken(token);

			return;
		}

		throw "Do not know what to do with" + Type.typeof(token);
	}
}
