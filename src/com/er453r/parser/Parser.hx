package com.er453r.parser;

import EReg;

class Parser {
	private var tokens:Array<Token>;

	public function new(tokens:Array<Token> ){
		this.tokens = tokens;
	}

	public function parse(statement:String){
		var currentPosition:UInt = 0;

		while(currentPosition < statement.length){
			var found:Bool = false;

			for(token in tokens){
				var regex:EReg = new EReg(token.regEx(), "");

				if(regex.matchSub(statement, currentPosition) && regex.matchedLeft().length == currentPosition){
					var match:String = regex.matched(0);

					currentPosition += match.length;

					found = true;

					break;
				}
			}

			if(!found)
				throw new LexerError('Unknown character: "${statement.substr(currentPosition, 1)}"', currentPosition, 1);
		}
	}
}
