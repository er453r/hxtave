package com.er453r.parser;

interface Token {
	public function regEx():String;
	public function getInstance(statement:String):Token;
}
