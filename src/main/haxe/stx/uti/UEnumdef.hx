package stx.uti;

typedef UEnumdefDef = UTypeInfosDef & {
  var isExtern:Bool;
  var constructors:Cluster<UEnumField>;
};
abstract UEnumdef(UEnumdefDef) from UEnumdefDef to UEnumdefDef{
  public function new(self) this = self;
  static public function lift(self:UEnumdefDef):UEnumdef return new UEnumdef(self);

  static public function fromCEnumdef(self:CEnumdef){
    return lift({
      path      : self.path,
      module    : self.module,
      file      : self.file,
      params    : self.params,
      doc       : self.doc,
      isPrivate : self.isPrivate,
      platforms : self.platforms,
      meta      : UMetaData.fromCMetaData(self.meta),

      isExtern  : self.isExtern,
      constructors : self.constructors.map(UEnumField.fromCEnumField)
    });
  }
  public function prj():UEnumdefDef return this;
  private var self(get,never):UEnumdef;
  private function get_self():UEnumdef return lift(this);
}