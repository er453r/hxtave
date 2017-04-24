package com.er453r.hxtave;

import com.er453r.hxtave.tokens.Multiply;
import com.er453r.hxtave.tokens.Add;
import com.er453r.hxtave.tokens.Whitespace;
import com.er453r.hxtave.tokens.Constant;
import com.er453r.parser.Parser;

class HxtaveParser extends Parser{
	public function new() {
		super([
			new Constant(),
			new Whitespace(),
			new Add(),
			new Multiply()
		]);
	}
}
