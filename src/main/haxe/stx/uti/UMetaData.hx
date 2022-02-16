package stx.uti;


typedef UMetaDataDef = Cluster<{name:String, params:Cluster<String>}>;

@:forward abstract UMetaData(UMetaDataDef) from UMetaDataDef to UMetaDataDef{
  public function new(self) this = self;
  static public function lift(self:UMetaDataDef):UMetaData return new UMetaData(self);

  static public inline function fromCMetaData(self:CMetaData){
    return lift(self);
  }
  public function prj():UMetaDataDef return this;
  private var self(get,never):UMetaData;
  private function get_self():UMetaData return lift(this);
}