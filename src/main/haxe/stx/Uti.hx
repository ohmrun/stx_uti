package stx;


using stx.Pico;
using stx.Nano;
using stx.Log;

#if macro
  import haxe.macro.Type;
  import haxe.macro.Expr;
  import haxe.macro.Context;
  import haxe.macro.Compiler;
#end

#if macro
typedef UtiBootLift       = stx.uti.term.UtiBoot.UtiBootLift;
#end
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
      return stx.uti.term.UtiBoot.instance;//Need to call any build macros after stx_build plugin is called.
    #else
      //__.log()("runtime bake");
      return new stx.uti.term.UtiMain();//If this isn't built that's most likely some other error.
    #end
  }
  #if macro
  static public function entype(o:Expr){
    trace('entype in boot context');
    trace(o);
    return macro {};
  }
  #else
  static public macro function entype(o:Dynamic){
    trace('entype in main context');
    trace(o);
    return macro {};
  }
  #end
}
class LiftUtiBoot{
  #if macro
  // static inline public function nominal(self:UtiBoot,o){
  //   return haxe.macro.TypeTools.toString(haxe.macro.Context.typeof(o));
  // }
  #end
}
// class LiftUtiBoot2{
//   #if !macro
//   static inline public macro function nominal(self:haxe.macro.Expr.ExprOf<UtiBoot>,e:haxe.macro.Expr){
//     final id = haxe.macro.TypeTools.toString(haxe.macro.Context.typeof(e));
//     return macro $v{id};
//   }
//   #end
// }