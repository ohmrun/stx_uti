package stx.uti;

typedef UTypedefDef = UTypeInfosDef & {
  var type:UType;
  var types:Map<String, UType>; // by platform

};
abstract UTypedef(UTypedefDef) from UTypedefDef to UTypedefDef{
  public function new(self) this = self;
  @:noUsing static public function lift(self:UTypedefDef):UTypedef return new UTypedef(self);

  static public function fromCTypedef(self:CTypedef):UTypedef{
    var types = new Map();
    for(key => val in self.types){
      types.set(key,UType.fromCType(val));
    }
    return lift({
      path      : self.path,
      module    : self.module,
      file      : self.file,
      params    : self.params,
      doc       : self.doc,
      isPrivate : self.isPrivate,
      platforms : self.platforms,
      meta      : UMetaData.fromCMetaData(self.meta),
      
      type  : UType.fromCType(self.type),
      types : types
    });
  }
  public function prj():UTypedefDef return this;
  private var self(get,never):UTypedef;
  private function get_self():UTypedef return lift(this);
}