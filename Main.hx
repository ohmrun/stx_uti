using stx.Nano;
using stx.Uti;
using stx.Log;

class Main {
	static function main() {
		final log 			= __.log().global;
					log.level = TRACE;
					log.includes.push("**/*");

		#if stx.boot
				boot();
				var a 	= TestAbstract.unit();
				Uti.entype(a);
		#else
			var a = TestAbstract.unit();
			var b = __.uti();
			// var c = b.nominal(a);
			// trace(c);
		#end
	}
	static macro function boot(){
		var a 	= TestAbstract.unit();
		Uti.entype(a);
		return macro {};
	}
}
abstract TestAbstract(String) from String{
	@:noUsing static public function unit():TestAbstract{
		return "hello";
	}
}
