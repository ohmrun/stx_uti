using stx.Nano;
using stx.Uti;

class Main {
	static function main() {
		var a = TestAbstract.unit();
		var b = __.uti();
		var c = b.nominal(a);
		trace(c);
		
		test_typeof();
	}
	static macro function test_typeof(){
		var a = TestAbstract.unit();
		var b = __.uti();
		var d = b.nominal(a);
		trace(d);
		return macro {};
	}
}
abstract TestAbstract(String) from String{
	@:noUsing static public function unit():TestAbstract{
		return "hello";
	}
}
