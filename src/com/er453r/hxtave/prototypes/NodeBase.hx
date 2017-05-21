package com.er453r.hxtave.prototypes;

import com.er453r.parser.prototypes.Token;

class NodeBase implements Token implements Node{
	private var _regEx:String;
	private var _acceptsNodes:Bool;
	private var _hasValue:Bool;

	public function new(regEx:String, hasValue:Bool = false, acceptsNodes:Bool = false) {
		this._regEx = regEx;
		this._acceptsNodes = acceptsNodes;
		this._hasValue = hasValue;
	}

	public function hasValue():Bool{
		return _hasValue;
	}

	public function value(context:Context):Variable{
		return null;
	}

	public function acceptsNodes():Bool{
		return _acceptsNodes;
	}

	public function addNode(node:Node):Void{}

	public function regEx():String{
		return _regEx;
	}

	public function getInstance(statement:String):Token{
		return null;
	}
}
