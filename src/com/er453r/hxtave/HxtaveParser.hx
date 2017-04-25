package com.er453r.hxtave;

import com.er453r.hxtave.tokens.Space;
import com.er453r.hxtave.tokens.Semicolon;
import com.er453r.hxtave.tokens.BinaryOperator;
import com.er453r.hxtave.tokens.Newline;
import com.er453r.hxtave.tokens.Constant;
import com.er453r.parser.Parser;

class HxtaveParser extends Parser{
	public function new() {
		super([
			new Constant(),
			new Newline(),
			new Space(),
			new BinaryOperator(),
			new Semicolon()
		], new Branch());
	}
}
