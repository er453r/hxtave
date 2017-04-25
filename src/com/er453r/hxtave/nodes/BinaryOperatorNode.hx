package com.er453r.hxtave.nodes;

import com.er453r.hxtave.prototypes.Node;
import com.er453r.parser.prototypes.TokenConsumer;
import com.er453r.parser.prototypes.Token;

class BinaryOperatorNode implements Token implements TokenConsumer{
	private static var ADD_REGEX:String = "[\\+\\*]";

	private var statement:String;

	private var left:Node;
	private var right:Node;

	public function new(?statement:String){
		this.statement = statement;

		/*switch(statement){
			case "+":
				trace("addition");
			case "*":
				trace("multiplication");
		}*/
	}

	public function regEx(){
		return ADD_REGEX;
	}

	public function getInstance(statement:String):Token{
		return new BinaryOperatorNode(statement);
	}

	public function addToken(token:Token){
		if(!Std.is(token, Node))
			throw "Binary operator expects a value node";

		var node = cast(token, Node);

		if(left == null)
			left = node;
		else if(right == null)
			right = node;
		else if(Std.is(right, TokenConsumer))
			cast(right, TokenConsumer).addToken(token);
		else
			throw "Do not know how to handle " + Type.typeof(token);
	}
}
