package com.er453r.hxtave.nodes;

import com.er453r.hxtave.prototypes.NodeBase;
import com.er453r.parser.prototypes.Token;

class SemicolonNode extends NodeBase{
	private static inline var SEMICOLON_REGEX:String = ";";

	public function new(){
		super(SEMICOLON_REGEX);
	}

	override public function getInstance(statement:String):Token{
		return new SemicolonNode();
	}
}
