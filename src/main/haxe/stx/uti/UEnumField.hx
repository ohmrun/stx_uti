package stx.uti;

typedef UEnumFieldDef = {
  var name:String;
  var args:Null<Cluster<UEnumArgument>>;
  var doc:String;
  var platforms:UPlatforms;
  var meta:UMetaData;
};
@:forward abstract UEnumField(UEnumFieldDef) from UEnumFieldDef to UEnumFieldDef{
  public function new(self) this = self;
  @:noUsing static public function lift(self:UEnumFieldDef):UEnumField return new UEnumField(self);

  static public function fromCEnumField(self:CEnumField){
    return lift({
      name      : self.name,
      args      : self.args.map(UEnumArgument.fromCEnumArgument),
      doc       : self.doc,
      platforms : self.platforms,
      meta      : UMetaData.fromCMetaData(self.meta)
    });
  }
  public function prj():UEnumFieldDef return this;
  private var self(get,never):UEnumField;
  private function get_self():UEnumField return lift(this);
}