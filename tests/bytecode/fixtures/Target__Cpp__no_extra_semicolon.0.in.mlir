"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "no_extra_semicolon"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":3:8)):
    "emitc.if"(%arg0) ({
      "emitc.include"() <{include = "myheader.h"}> : () -> () loc("<stdin>":5:7)
      "emitc.if"(%arg0) ({
        "emitc.yield"() : () -> () loc("<stdin>":7:9)
      }, {
      }) : (i1) -> () loc("<stdin>":6:7)
      "emitc.verbatim"() <{value = "return;"}> : () -> () loc("<stdin>":10:7)
      "emitc.yield"() : () -> () loc("<stdin>":11:7)
    }, {
    }) : (i1) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
