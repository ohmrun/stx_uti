package stx;


using stx.Pico;
using stx.Nano;
using stx.Log;

typedef UPath             = String;
typedef UPlatforms        = Cluster<String>;
typedef UFunctionArgument = stx.uti.UFunctionArgument;
typedef UType             = stx.uti.UType;
typedef UTypeSum          = stx.uti.UType.UTypeSum;
typedef UPathParams       = stx.uti.UPathParams;
typedef UPathParamsDef    = stx.uti.UPathParams.UPathParamsDef;
typedef UTypeParams       = Cluster<String>;
typedef URights           = stx.uti.URights;  
typedef URightsSum        = stx.uti.URights.URightsSum;  
typedef UMetaDataDef      = stx.uti.UMetaData.UMetaDataDef;
typedef UMetaData         = stx.uti.UMetaData;
typedef UClassField       = stx.uti.UClassField;  
typedef UClassFieldDef    = stx.uti.UClassField.UClassFieldDef;  
typedef UTypeInfos        = stx.uti.UTypeInfos;  
typedef UTypeInfosDef     = stx.uti.UTypeInfos.UTypeInfosDef;  
typedef UClassdef         = stx.uti.UClassdef;
typedef UClassdefDef      = stx.uti.UClassdef.UClassdefDef;
typedef UEnumField        = stx.uti.UEnumField;
typedef UEnumFieldDef     = stx.uti.UEnumField.UEnumFieldDef;
typedef UAbstractdef      = stx.uti.UAbstractdef; 
typedef UAbstractdefDef   = stx.uti.UAbstractdef.UAbstractdefDef; 
typedef UEnumdef          = stx.uti.UEnumdef; 
typedef UEnumdefDef       = stx.uti.UEnumdef.UEnumdefDef; 
typedef UTypeRoot         = Cluster<UTypeTree>;
typedef UTypeTree         = stx.uti.UTypeTree;
typedef UTypeTreeSum      = stx.uti.UTypeTree.UTypeTreeSum;
typedef UTypedef          = stx.uti.UTypedef;
typedef UTypedefDef       = stx.uti.UTypedef.UTypedefDef;
typedef UAbstractLinkDef  = stx.uti.UAbstractLink.UAbstractLinkDef;
typedef UAbstractLink     = stx.uti.UAbstractLink;

class Uti{
  static public function uti(wildcard:Wildcard){
    #if macro
      //__.log()("macro bake");
      return stx.UtiRuntime.instance;//Need to call any build macros after stx_build plugin is called.
    #else
      //__.log()("runtime bake");
      return new stx.uti.UtiMacrotime();//If this isn't built that's most likely some other error.
    #end
  }
}
class UtiRuntime{
  static public var instance(get,null) : UtiRuntime;
  static function get_instance(){
    return __.option(instance).def(
      () -> instance = new UtiRuntime()
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
}

// class LiftUtiRuntime{
//   #if macro
//   static inline public function nominal(self:UtiRuntime,o:haxe.macro.Expr){
//     return haxe.macro.TypeTools.toString(haxe.macro.Context.typeof(o));
//   }
//   #end
// }
// class LiftUtiRuntime2{
//   #if !macro
//   static inline public macro function nominal(self:haxe.macro.Expr.ExprOf<UtiRuntime>,e:haxe.macro.Expr){
//     final id = haxe.macro.TypeTools.toString(haxe.macro.Context.typeof(e));
//     return macro $v{id};
//   }
//   #end
// }