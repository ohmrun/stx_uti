package stx.uti;

typedef UEnumArgumentDef = {name:String, opt:Bool, t:UType};

@:forward abstract UEnumArgument(UEnumArgumentDef) from UEnumArgumentDef to UEnumArgumentDef{
  public function new(self) this = self;
  @:noUsing static public function lift(self:UEnumArgumentDef):UEnumArgument return new UEnumArgument(self);

  static public function fromCEnumArgument(self:{name : String, opt : Bool, t : CType}){
    return lift({
      name  : self.name,
      opt   : self.opt,
      t     : UType.fromCType(self.t)  
    });
  }
  public function prj():UEnumArgumentDef return this;
  private var self(get,never):UEnumArgument;
  private function get_self():UEnumArgument return lift(this);
}