package com.er453r.hxtave.nodes;

import com.er453r.hxtave.prototypes.Node;
import com.er453r.hxtave.prototypes.NodeBase;
import com.er453r.parser.prototypes.Token;

class SpaceNode extends NodeBase implements Token implements Node{
	private static inline var SPACE_REGEX:String = " ";

	public function new(){
		super(SPACE_REGEX);
	}

	public function getInstance(statement:String):Token{
		return new SpaceNode();
	}
}
