package stx.uti;

typedef UAbstractLinkDef = {t:UType, field:Null<String>};

abstract UAbstractLink(UAbstractLinkDef) from UAbstractLinkDef to UAbstractLinkDef{
  public function new(self) this = self;
  static public inline function lift(self:UAbstractLinkDef):UAbstractLink return new UAbstractLink(self);

  static public function fromCAbstractLink(self:{t:CType, field:Null<String>}){
    return lift({
      t : UType.fromCType(self.t),
      field : self.field
    });
  }
  public function prj():UAbstractLinkDef return this;
  private var self(get,never):UAbstractLink;
  private function get_self():UAbstractLink return lift(this);
}