module {
  emitc.verbatim "#ifdef __cplusplus"
  emitc.verbatim "extern \22C\22 {"
  emitc.verbatim "#endif  // __cplusplus"
  emitc.verbatim "#ifdef __cplusplus"
  emitc.verbatim "}  // extern \22C\22"
  emitc.verbatim "#endif  // __cplusplus"
  emitc.verbatim "typedef int32_t i32;"
  emitc.verbatim "typedef float f32;"
  emitc.func @func(%arg0: f32) {
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.array<3x7xi32>
    verbatim "{}" args %arg0 : f32
    verbatim "{} {{a" args %arg0 : f32
    verbatim "#pragma my var={} property" args %arg0 : f32
    verbatim "#pragma my2 var={} property" args %0 : !emitc.array<3x7xi32>
    return
  }
}

