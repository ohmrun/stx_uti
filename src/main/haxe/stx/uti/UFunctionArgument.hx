package stx.uti;

typedef UFunctionArgumentDef = {name:String, opt:Bool, t:UType, ?value:String};

@:forward abstract UFunctionArgument(UFunctionArgumentDef) from UFunctionArgumentDef to UFunctionArgumentDef{
  public function new(self) this = self;
  static public function lift(self:UFunctionArgumentDef):UFunctionArgument return new UFunctionArgument(self);

  static public inline function make(name,opt,t,?value){
    return lift({
      name  : name,
      opt   : opt,
      t     : t,
      value : value
    });
  }
  static public inline function fromCFunctionArgument(self:CFunctionArgument){
    return make(self.name,self.opt,UType.fromCType(self.t),self.value);
  }

  public function prj():UFunctionArgumentDef return this;
  private var self(get,never):UFunctionArgument;
  private function get_self():UFunctionArgument return lift(this);
}