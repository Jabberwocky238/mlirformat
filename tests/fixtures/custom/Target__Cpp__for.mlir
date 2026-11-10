module {
  func.func @test_for(%arg0: index, %arg1: index, %arg2: index) {
    %0 = emitc.expression %arg0, %arg1 : (index, index) -> index {
      %3 = add %arg0, %arg1 : (index, index) -> index
      yield %3 : index
    }
    %1 = emitc.expression %arg1, %arg2 : (index, index) -> index {
      %3 = mul %arg1, %arg2 : (index, index) -> index
      yield %3 : index
    }
    %2 = emitc.expression %arg0, %arg2 : (index, index) -> index {
      %3 = div %arg0, %arg2 : (index, index) -> index
      yield %3 : index
    }
    emitc.for %arg3 = %0 to %1 step %2 {
      %3 = call_opaque "f"()  : () -> i32
    }
    return
  }
  func.func @test_for_yield() {
    %0 = "emitc.constant"() <{value = 0 : index}> : () -> index
    %1 = "emitc.constant"() <{value = 10 : index}> : () -> index
    %2 = "emitc.constant"() <{value = 1 : index}> : () -> index
    %3 = "emitc.constant"() <{value = 0 : i32}> : () -> i32
    %4 = "emitc.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %5 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %6 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<f32>
    %7 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %8 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<f32>
    emitc.assign %3 : i32 to %7 : <i32>
    emitc.assign %4 : f32 to %8 : <f32>
    emitc.for %arg0 = %0 to %1 step %2 {
      %11 = load %7 : <i32>
      %12 = call_opaque "add"(%11, %arg0)  : (i32, index) -> i32
      %13 = load %8 : <f32>
      %14 = call_opaque "mul"(%13, %arg0)  : (f32, index) -> f32
      assign %12 : i32 to %7 : <i32>
      assign %14 : f32 to %8 : <f32>
    }
    %9 = emitc.load %7 : <i32>
    emitc.assign %9 : i32 to %5 : <i32>
    %10 = emitc.load %8 : <f32>
    emitc.assign %10 : f32 to %6 : <f32>
    return
  }
  func.func @test_for_yield_2() {
    %0 = emitc.literal "0" : index
    %1 = emitc.literal "10" : index
    %2 = emitc.literal "1" : index
    %3 = emitc.literal "0" : i32
    %4 = emitc.literal "M_PI" : f32
    %5 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %6 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<f32>
    %7 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %8 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<f32>
    emitc.assign %3 : i32 to %7 : <i32>
    emitc.assign %4 : f32 to %8 : <f32>
    emitc.for %arg0 = %0 to %1 step %2 {
      %11 = load %7 : <i32>
      %12 = call_opaque "add"(%11, %arg0)  : (i32, index) -> i32
      %13 = load %8 : <f32>
      %14 = call_opaque "mul"(%13, %arg0)  : (f32, index) -> f32
      assign %12 : i32 to %7 : <i32>
      assign %14 : f32 to %8 : <f32>
    }
    %9 = emitc.load %7 : <i32>
    emitc.assign %9 : i32 to %5 : <i32>
    %10 = emitc.load %8 : <f32>
    emitc.assign %10 : f32 to %6 : <f32>
    return
  }
}

