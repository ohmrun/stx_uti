package stx.uti;

using stx.Nano;
using stx.Log;
using stx.Bake;

class Plugin{
  static public macro function use(){
    //#if (test||debug)
    __.log().info('stx.uti.Plugin.use');
    final bake = __.bake();
    __.option(bake).def(
      () -> {
        throw '`-lib bake` should be used first';
      }
    );
    final main = bake.get_main();
    __.log().info(_ -> _.pure(main));
    // final main = bake.args.lfold(
    //   (next,memo:Option<Option<String>>) -> {
    //     return switch([next,memo]){
    //       case ['-main',None] : Some(None);
    //       case [x,Some(None)] : Some(Some(x));
    //       default             : memo;
    //     }
    //   },
    //   None
    // ).fudge().fudge();

    return macro {};
  }
}