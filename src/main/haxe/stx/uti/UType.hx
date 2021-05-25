package stx.uti;

enum UTypeSum{
  UUnknown;
  UEnum(name:UPath, params:Array<UType>);
  UClass(name:UPath, params:Array<UType>);
  UTypedef(name:UPath, params:Array<UType>);
  UFunction(args:Array<UFunctionArgument>, ret:UType);
  UAnonymous(fields:Array<UClassField>);
  UDynamic(?t:UType);
  UAbstract(name:UPath, params:Array<UType>);
}
abstract UType(UTypeSum) from UTypeSum to UTypeSum{
  public function new(self) this = self;
  static public function lift(self:UTypeSum):UType return new UType(self);

  static public function fromCType(self:CType){
    return switch self {
      case CUnknown                 : UUnknown;
      case CEnum(name, params)      : UEnum(name,params.map(fromCType));
      case CClass(name, params)     : UClass(name,params.map(fromCType));
      case CTypedef(name, params)   : UTypedef(name,params.map(fromCType));
      case CFunction(args, ret)     : UFunction(args.map(UFunctionArgument.fromCFunctionArgument),UType.fromCType(ret));
      case CAnonymous(fields)       : UAnonymous(fields.map(UClassField.fromCClassField));
      case CDynamic(t)              : UDynamic(fromCType(t));
      case CAbstract(name, params)  : UAbstract(name,params.map(fromCType));
    }
  }
  public function prj():UTypeSum return this;
  private var self(get,never):UType;
  private function get_self():UType return lift(this);
}