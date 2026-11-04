"builtin.module"() ({
  "emitc.verbatim"() <{value = "#ifdef __cplusplus"}> : () -> ()
  "emitc.verbatim"() <{value = "extern \22C\22 {"}> : () -> ()
  "emitc.verbatim"() <{value = "#endif  // __cplusplus"}> : () -> ()
  "emitc.verbatim"() <{value = "#ifdef __cplusplus"}> : () -> ()
  "emitc.verbatim"() <{value = "}  // extern \22C\22"}> : () -> ()
  "emitc.verbatim"() <{value = "#endif  // __cplusplus"}> : () -> ()
  "emitc.verbatim"() <{value = "typedef int32_t i32;"}> : () -> ()
  "emitc.verbatim"() <{value = "typedef float f32;"}> : () -> ()
  "emitc.func"() <{function_type = (f32) -> (), sym_name = "func"}> ({
  ^bb0(%arg0: f32):
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.array<3x7xi32>
    "emitc.verbatim"(%arg0) <{value = "{}"}> : (f32) -> ()
    "emitc.verbatim"(%arg0) <{value = "{} {{a"}> : (f32) -> ()
    "emitc.verbatim"(%arg0) <{value = "#pragma my var={} property"}> : (f32) -> ()
    "emitc.verbatim"(%0) <{value = "#pragma my2 var={} property"}> : (!emitc.array<3x7xi32>) -> ()
    "emitc.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

