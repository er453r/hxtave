package com.er453r.hxtave.nodes;

import com.er453r.parser.prototypes.Token;

class SpaceNode implements Token{
	private static var SPACE_REGEX:String = " ";

	public function new(){}

	public function regEx(){
		return SPACE_REGEX;
	}

	public function getInstance(statement:String):Token{
		return new SpaceNode();
	}
}
