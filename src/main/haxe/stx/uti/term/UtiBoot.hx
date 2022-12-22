package stx.uti.term;

@:using(stx.uti.term.UtiBoot.UtiBootLift)
class UtiBoot{
  static public var instance(get,null) : UtiBoot;
  static function get_instance(){
    return __.option(instance).def(
      () -> instance = new UtiBoot()
    );
  }
  private static var initialized : Bool = false;
  static public function initialize(){
   if(!initialized){
     initialized = true;
   } 
  }
  public function new(){

  }
  public function type(data:Dynamic):Option<UType>{
    return null;
  }
}
class UtiBootLift{
  // #if macro
  // static inline public macro function nominal(e:Expr){
  //   trace(haxe.macro.Context.typeof(e));
  //   return macro {};
  // }
  // #else
  // static inline public function nominal(self:UtiBoot,o){
  
  // }
  // #end
}