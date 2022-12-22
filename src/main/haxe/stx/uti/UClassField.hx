package stx.uti;


typedef UClassFieldDef = {
  var name        : String;
  var type        : UType;
  var isPublic    : Bool;
  var isFinal     : Bool;
  var isOverride  : Bool;
  var doc         : Null<String>;
  var get         : URights;
  var set         : URights;
  var params      : UTypeParams;
  var platforms   : UPlatforms;
  var meta        : UMetaData ;
  var line        : Null<Int>;
  var overloads   : Null<Cluster<UClassField>>;
  var expr        : Null<String>;
};
abstract UClassField(UClassFieldDef) from UClassFieldDef to UClassFieldDef{
  public function new(self) this = self;
  @:noUsing static public function lift(self:UClassFieldDef):UClassField return new UClassField(self);

  @:noUsing static public function make(name,type,isPublic,isFinal,isOverride,doc,get,set,params,platforms,meta,line,overloads,expr){
    return lift({
      name        : name, 
      type        : type, 
      isPublic    : isPublic, 
      isFinal     : isFinal, 
      isOverride  : isOverride, 
      doc         : doc, 
      get         : get, 
      set         : set, 
      params      : params, 
      platforms   : platforms, 
      meta        : meta, 
      line        : line, 
      overloads   : overloads, 
      expr        : expr 
    });
  }
  static public function fromCClassField(self:CClassField){
      return lift({
        name        : self.name, 
        type        : UType.fromCType(self.type), 
        isPublic    : self.isPublic, 
        isFinal     : self.isFinal, 
        isOverride  : self.isOverride, 
        doc         : self.doc, 
        get         : URights.fromCRights(self.get), 
        set         : URights.fromCRights(self.set), 
        params      : self.params, 
        platforms   : self.platforms, 
        meta        : UMetaData.fromCMetaData(self.meta),
        line        : self.line, 
        overloads   : __.option(self.overloads).map(arr -> arr.map(UClassField.fromCClassField)).defv(null), 
        expr        : self.expr 
      });
  }
  public function prj():UClassFieldDef return this;
  private var self(get,never):UClassField;
  private function get_self():UClassField return lift(this);
}