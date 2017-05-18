package com.er453r.hxtave;

import com.er453r.hxtave.nodes.SpaceNode;
import com.er453r.hxtave.nodes.SemicolonNode;
import com.er453r.hxtave.nodes.BinaryOperatorNode;
import com.er453r.hxtave.nodes.NewlineNode;
import com.er453r.hxtave.nodes.ConstantNode;
import com.er453r.parser.Parser;

class HxtaveParser extends Parser{
	private var mainBranch:Branch = new Branch();

	public function new() {
		super([
			new ConstantNode(),
			new NewlineNode(),
			new SpaceNode(),
			new BinaryOperatorNode(),
			new SemicolonNode()
		], mainBranch);
	}

	public function run(){
		mainBranch.run(new Context());
	}
}
