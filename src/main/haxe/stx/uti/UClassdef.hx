package stx.uti;


typedef UClassdefDef = UTypeInfosDef & {
  var isExtern:Bool;
  var isFinal:Bool;
  var isInterface:Bool;
  var superClass:Null<UPathParams>;
  var interfaces:Array<UPathParams>;
  var fields:Array<UClassField>;
  var statics:Array<UClassField>;
  var tdynamic:Null<UType>;
};
abstract UClassdef(UClassdefDef) from UClassdefDef to UClassdefDef{
  public function new(self) this = self;
  static public function lift(self:UClassdefDef):UClassdef return new UClassdef(self);

  static public function fromCClassdef(self:CClassdef){
    return lift({
      path        : self.path,
      module      : self.module,
      file        : self.file,
      params      : self.params,
      doc         : self.doc,
      isPrivate   : self.isPrivate,
      platforms   : self.platforms,
      meta        : self.meta,

      isExtern    : self.isExtern,
      isFinal     : self.isFinal,
      isInterface : self.isInterface,
      superClass  : UPathParams.fromCPathParams(self.superClass),
      interfaces  : self.interfaces.map(UPathParams.fromCPathParams),
      fields      : self.fields.map(UClassField.fromCClassField),
      statics     : self.statics.map(UClassField.fromCClassField),
      tdynamic    : __.option(self.tdynamic).map(UType.fromCType).defv(null)
    });
  }
  public function prj():UClassdefDef return this;
  private var self(get,never):UClassdef;
  private function get_self():UClassdef return lift(this);
}