package com.er453r.hxtave.nodes;

import com.er453r.hxtave.prototypes.NodeBase;
import com.er453r.parser.prototypes.Token;

class NewlineNode extends NodeBase{
	private static inline var NEWLINE_REGEX:String = "\n";

	public function new(){
		super(NEWLINE_REGEX);
	}

	override public function getInstance(statement:String):Token{
		return new NewlineNode();
	}
}
