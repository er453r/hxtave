package com.er453r.parser;

import EReg;

class Parser {
	private static inline var NEW_LINE:String = "\n";

	private var tokens:Array<Token>;

	public function new(tokens:Array<Token> ){
		this.tokens = tokens;
	}

	public function parse(statement:String){
		var position:UInt = 0;
		var column:UInt = 1;
		var line:UInt = 1;

		while(position < statement.length){
			var found:Bool = false;

			for(token in tokens){
				var regex:EReg = new EReg(token.regEx(), "");

				if(regex.matchSub(statement, position) && regex.matchedLeft().length == position){
					var match:String = regex.matched(0);

					// update position over lines
					var newLinePosition:Int = match.indexOf(NEW_LINE);

					if(newLinePosition > -1){
						line++;
						column = match.length - newLinePosition;
					}
					else
						column += match.length;

					position += match.length;

					found = true;

					break;
				}
			}

			if(!found)
				throw new LexerError('Unknown character: "${statement.substr(position, 1)}"', column, line);
		}
	}
}
