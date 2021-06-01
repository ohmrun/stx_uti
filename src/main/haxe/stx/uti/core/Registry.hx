package stx.uti.core;

@:forward(iterator,push,length,map)abstract Registry(Array<Class<stx.uti.core.Schemata>>){
  static var instance : Array<Class<stx.uti.core.Schemata>>;
  public function new(){
    if(instance == null){
      instance = [];
    }
    this = instance;
  }
}