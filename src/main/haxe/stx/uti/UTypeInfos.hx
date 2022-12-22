package stx.uti;

typedef UTypeInfosDef = {
  final path:UPath;
  final module:UPath;
  final file:Null<String>;
  final params:UTypeParams;
  final ?doc:Null<String>;
  final isPrivate:Bool;
  final platforms:UPlatforms;
  final meta:UMetaData;
};

@:forward abstract UTypeInfos(UTypeInfosDef) from UTypeInfosDef to UTypeInfosDef{
  public function new(self) this = self;
  @:noUsing static public function lift(self:UTypeInfosDef):UTypeInfos return new UTypeInfos(self);

  @:noUsing static public function make(path,module,file,params,doc,isPrivate,platforms,meta){
    return lift({
      path      : path,
      module    : module,
      file      : file,
      params    : params,
      doc       : doc,
      isPrivate : isPrivate,
      platforms : platforms,
      meta      : meta
    });
  }
  static public function fromCtypeInfos(self:CTypeInfos){
    return lift({
      path      : self.path,
      module    : self.module,
      file      : self.file,
      params    : self.params,
      doc       : self.doc,
      isPrivate : self.isPrivate,
      platforms : self.platforms,
      meta      : UMetaData.fromCMetaData(self.meta)
    });
  } 
  public function prj():UTypeInfosDef return this;
  private var self(get,never):UTypeInfos;
  private function get_self():UTypeInfos return lift(this);
}