package stx.uti;

enum URightsSum {
  URNormal;
  URNo;
  URCall(m:String);
  URMethod;
  URDynamic;
  URInline;
}
abstract URights(URightsSum) from URightsSum to URightsSum{
  public function new(self) this = self;
  static public function lift(self:URightsSum):URights return new URights(self);

  static public function fromCRights(self:CRights){
    return switch self {
      case RNormal    :   URNormal;
      case RNo        :   URNo;
      case RCall(m)   :   URCall(m);
      case RMethod    :   URMethod;
      case RDynamic   :   URDynamic;
      case RInline    :   URInline;
    }
  }
  public function prj():URightsSum return this;
  private var self(get,never):URights;
  private function get_self():URights return lift(this);
}