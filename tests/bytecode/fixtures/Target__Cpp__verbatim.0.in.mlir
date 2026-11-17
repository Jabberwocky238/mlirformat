"builtin.module"() ({
  "emitc.verbatim"() <{value = "#ifdef __cplusplus"}> : () -> () loc("<stdin>":2:3)
  "emitc.verbatim"() <{value = "extern \22C\22 {"}> : () -> () loc("<stdin>":3:3)
  "emitc.verbatim"() <{value = "#endif  // __cplusplus"}> : () -> () loc("<stdin>":4:3)
  "emitc.verbatim"() <{value = "#ifdef __cplusplus"}> : () -> () loc("<stdin>":5:3)
  "emitc.verbatim"() <{value = "}  // extern \22C\22"}> : () -> () loc("<stdin>":6:3)
  "emitc.verbatim"() <{value = "#endif  // __cplusplus"}> : () -> () loc("<stdin>":7:3)
  "emitc.verbatim"() <{value = "typedef int32_t i32;"}> : () -> () loc("<stdin>":8:3)
  "emitc.verbatim"() <{value = "typedef float f32;"}> : () -> () loc("<stdin>":9:3)
  "emitc.func"() <{function_type = (f32) -> (), sym_name = "func"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":11:8)):
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.array<3x7xi32> loc("<stdin>":12:10)
    "emitc.verbatim"(%arg0) <{value = "{}"}> : (f32) -> () loc("<stdin>":13:5)
    "emitc.verbatim"(%arg0) <{value = "{} {{a"}> : (f32) -> () loc("<stdin>":14:5)
    "emitc.verbatim"(%arg0) <{value = "#pragma my var={} property"}> : (f32) -> () loc("<stdin>":15:5)
    "emitc.verbatim"(%0) <{value = "#pragma my2 var={} property"}> : (!emitc.array<3x7xi32>) -> () loc("<stdin>":16:5)
    "emitc.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
