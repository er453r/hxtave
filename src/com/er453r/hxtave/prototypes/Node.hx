package com.er453r.hxtave.prototypes;

import com.er453r.parser.prototypes.Token;

interface Node extends Token{
	public function hasValue():Bool;
	public function value(context:Context):Variable;
	public function acceptsNodes():Bool;
	public function addNode(node:Node):Void;
}
