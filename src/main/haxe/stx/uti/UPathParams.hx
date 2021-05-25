package stx.uti;

typedef UPathParamsDef = {
  var path:UPath;
  var params:Array<UType>;
};
abstract UPathParams(UPathParamsDef) from UPathParamsDef to UPathParamsDef{
  public function new(self) this = self;
  static public function lift(self:UPathParamsDef):UPathParams return new UPathParams(self);

  static public function fromCPathParams(self:CPathParams){
    return lift({
      path    : self.path,
      params  : self.params.map(UType.fromCType)
    });
  }
  public function prj():UPathParamsDef return this;
  private var self(get,never):UPathParams;
  private function get_self():UPathParams return lift(this);
}