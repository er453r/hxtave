package com.er453r.parser;

class LexerError {
	public var message:String;
	public var column:UInt;
	public var line:UInt;

	public function new(message:String, column:UInt, line:UInt) {
		this.message = message;
		this.column = column;
		this.line = line;
	}
}
