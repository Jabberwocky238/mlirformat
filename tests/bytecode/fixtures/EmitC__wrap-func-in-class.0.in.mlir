"builtin.module"() ({
  "emitc.func"() <{function_type = (!emitc.array<1xf32>) -> (), sym_name = "foo"}> ({
  ^bb0(%arg0: !emitc.array<1xf32> loc("<stdin>":3:8)):
    "emitc.call_opaque"(%arg0) <{callee = "bar"}> : (!emitc.array<1xf32>) -> () loc("<stdin>":4:5)
    "emitc.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
