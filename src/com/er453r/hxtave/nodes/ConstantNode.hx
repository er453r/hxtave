package com.er453r.hxtave.nodes;

import com.er453r.hxtave.prototypes.NodeBase;
import com.er453r.parser.prototypes.Token;

class ConstantNode extends NodeBase{
	private static inline var INTEGER_REGEX:String = "\\d+";

	private var variable:Variable;

	public function new(?statement:String){
		super(INTEGER_REGEX, true);

		variable = new Variable(Std.parseFloat(statement));
	}

	override public function getInstance(statement:String):Token{
		return new ConstantNode(statement);
	}

	override public function value(context:Context):Variable{
		return variable;
	}
}
