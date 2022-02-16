package stx.uti;

typedef UAbstractdefDef = UTypeInfosDef & {
  var to:Cluster<{t:UType, field:Null<String>}>;
  var from:Cluster<{t:UType, field:Null<String>}>;
  var impl:UClassdef;//TODO More than in macros?
  var athis:UType;
};
abstract UAbstractdef(UAbstractdefDef) from UAbstractdefDef to UAbstractdefDef{
  public function new(self) this = self;
  static public function lift(self:UAbstractdefDef):UAbstractdef return new UAbstractdef(self);
  static public function make(to,from,impl,athis,infos:UTypeInfos){
    return lift({
      to          : to,
      from        : from,
      impl        : impl,
      athis       : athis,

      path        : infos.path,
      module      : infos.module,
      file        : infos.file,
      params      : infos.params,
      doc         : infos.doc,
      isPrivate   : infos.isPrivate,
      platforms   : infos.platforms,
      meta        : infos.meta,
    });
  }
  static public function fromCAbstractdef(self:CAbstractdef){
    return lift({
        to          : self.to.map(UAbstractLink.fromCAbstractLink),
        from        : self.from.map(UAbstractLink.fromCAbstractLink),
        impl        : UClassdef.fromCClassdef(self.impl),
        athis       : UType.fromCType(self.athis),
  
        path        : self.path,
        module      : self.module,
        file        : self.file,
        params      : self.params,
        doc         : self.doc,
        isPrivate   : self.isPrivate,
        platforms   : self.platforms,
        meta        : UMetaData.fromCMetaData(self.meta),
    });
  }
  public function prj():UAbstractdefDef return this;
  private var self(get,never):UAbstractdef;
  private function get_self():UAbstractdef return lift(this);
}