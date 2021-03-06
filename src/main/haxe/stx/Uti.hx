package stx;

typedef UPath             = String;
typedef UPlatforms        = Array<String>;
typedef UFunctionArgument = stx.uti.UFunctionArgument;
typedef UType             = stx.uti.UType;
typedef UTypeSum          = stx.uti.UType.UTypeSum;
typedef UPathParams       = stx.uti.UPathParams;
typedef UPathParamsDef    = stx.uti.UPathParams.UPathParamsDef;
typedef UTypeParams       = Array<String>;
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
typedef UTypeRoot         = Array<UTypeTree>;
typedef UTypeTree         = stx.uti.UTypeTree;
typedef UTypeTreeSum      = stx.uti.UTypeTree.UTypeTreeSum;
typedef UTypedef          = stx.uti.UTypedef;
typedef UTypedefDef       = stx.uti.UTypedef.UTypedefDef;
typedef UAbstractLinkDef  = stx.uti.UAbstractLink.UAbstractLinkDef;
typedef UAbstractLink     = stx.uti.UAbstractLink;

class Uti{
  private static var initialized                : Bool = false;
  static public function initialize(){
   if(!initialized){
     initialized = true;
   } 
  }
}