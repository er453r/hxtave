package com.er453r.parser;

import com.er453r.parser.EOFToken;
import com.er453r.parser.prototypes.Token;
import com.er453r.parser.prototypes.TokenConsumer;

class Parser {
	private static inline var NEW_LINE:String = "\n";

	private var tokens:Array<Token>;
	private var tokenConsumer:TokenConsumer;

	public function new(tokens:Array<Token>, tokenConsumer:TokenConsumer){
		this.tokens = tokens;
		this.tokenConsumer = tokenConsumer;
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

					try{
						tokenConsumer.addToken(token.getInstance(match));
					}
					catch(error:String){
						throw new ParserException(error +  ': "${statement.substr(position, 8)}"', column, line);
					}

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
				throw new ParserException('Unknown character: "${statement.substr(position, 8)}"', column, line);
		}

		tokenConsumer.addToken(new EOFToken());
	}
}
