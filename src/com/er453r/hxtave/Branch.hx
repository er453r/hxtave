package com.er453r.hxtave;

import com.er453r.parser.EOFToken;
import com.er453r.hxtave.nodes.ConstantNode;
import com.er453r.parser.prototypes.Token;
import com.er453r.parser.prototypes.TokenConsumer;

import com.er453r.hxtave.nodes.SpaceNode;
import com.er453r.hxtave.nodes.SemicolonNode;
import com.er453r.hxtave.nodes.NewlineNode;

import com.er453r.utils.Log;

class Branch implements TokenConsumer {
	private var tokens:Array<Token> = [];
	private var token:Token;

	public function new(){}

	private function name(token:Token):String{
		return Type.getClassName(Type.getClass(token)).split(".").pop();
	}

	public function addToken(token:Token){
		if(Std.is(token, SpaceNode)){
			Log.debug("Ignoring whitespace");

			return;
		}

		Log.debug('New ${name(token)}} appeared');

		if(Std.is(token, SemicolonNode) || Std.is(token, NewlineNode) || Std.is(token, EOFToken)){
			Log.debug("Semicolon/new line/EOF terminates existing expression");

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
			Log.debug("Addding token");

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

	public function run(context:Context){
		Log.debug('Running ${tokens.length} tokens');

		for(token in tokens){
			Log.debug('Running ${name(token)}}');

			if(Std.is(token, ConstantNode)){
				cast(token, ConstantNode).value(context);
			}
		}
	}
}
