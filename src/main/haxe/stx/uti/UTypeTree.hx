package stx.uti;

enum UTypeTreeSum {
  UPackage(name:String, full:String, subs:Cluster<UTypeTree>);
  UClassdecl(c:UClassdef);
  UEnumdecl(e:UEnumdef);
  UTypedecl(t:UTypedef);
  UAbstractdecl(a:UAbstractdef);
}
abstract UTypeTree(UTypeTreeSum) from UTypeTreeSum to UTypeTreeSum{
  public function new(self) this = self;
  @:noUsing static public function lift(self:UTypeTreeSum):UTypeTree return new UTypeTree(self);

  static public function fromCTypeTree(self:CTypeTree){
    return switch(self){
      case TPackage(name, full, subs) : UPackage(name,full,subs.map(fromCTypeTree));
      case TClassdecl(c)              : UClassdecl(UClassdef.fromCClassdef(c));
      case TEnumdecl(e)               : UEnumdecl(UEnumdef.fromCEnumdef(e));
      case TTypedecl(t)               : UTypedecl(stx.uti.UTypedef.fromCTypedef(t));
      case TAbstractdecl(a)           : UAbstractdecl(UAbstractdef.fromCAbstractdef(a));
    }
  }
  public function prj():UTypeTreeSum return this;
  private var self(get,never):UTypeTree;
  private function get_self():UTypeTree return lift(this);
}