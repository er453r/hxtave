package com.er453r.parser.prototypes;

interface Token {
	public function regEx():String;
	public function getInstance(statement:String):Token;
}
