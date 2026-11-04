"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "no_extra_semicolon"}> ({
  ^bb0(%arg0: i1):
    "emitc.if"(%arg0) ({
      "emitc.include"() <{include = "myheader.h"}> : () -> ()
      "emitc.if"(%arg0) ({
        "emitc.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "emitc.verbatim"() <{value = "return;"}> : () -> ()
      "emitc.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

