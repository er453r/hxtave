package com.er453r.hxtave.nodes;

import com.er453r.hxtave.prototypes.NodeBase;
import com.er453r.hxtave.prototypes.Node;
import com.er453r.parser.prototypes.Token;

class BinaryOperatorNode extends NodeBase implements Token implements Node{
	private static inline var ADD_REGEX:String = "[\\+\\*]";

	private var statement:String;

	private var left:Node;
	private var right:Node;

	public function new(?statement:String){
		super(ADD_REGEX, true, true);

		this.statement = statement;
	}

	public function getInstance(statement:String):Token{
		return new BinaryOperatorNode(statement);
	}

	override public function addNode(node:Node){
		if(left == null && node == null){
			left = new ConstantNode("0"); // TODO - can be static

			return;
		}

		if(left == null)
			left = node;
		else if(right == null)
			right = node;
		else if(right.acceptsNodes())
			right.addNode(node);
		else
			throw "Do not know how to handle " + Type.typeof(node);
	}
}
