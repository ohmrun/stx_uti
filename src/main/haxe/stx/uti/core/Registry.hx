package stx.uti.core;

@:forward(iterator,push,length,map)abstract Registry(Array<Class<stx.uti.core.Schemata>>){
  static var instance(get,null) : Array<Class<stx.uti.core.Schemata>>;
  function get_instance(){
    return __.option(instance).def(
      () -> instance = []
    );
  }
  public function new(){
    this = instance;
  }
}