module {
  func.func @single_expression(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) -> i1 {
    %0 = "emitc.constant"() <{value = 42 : i32}> : () -> i32
    %1 = emitc.mul %arg0, %0 : (i32, i32) -> i32
    %2 = emitc.sub %1, %arg2 : (i32, i32) -> i32
    %3 = emitc.cmp lt, %2, %arg3 : (i32, i32) -> i1
    return %3 : i1
  }
  func.func @multiple_expressions(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) -> (i32, i32) {
    %0 = emitc.mul %arg0, %arg1 : (i32, i32) -> i32
    %1 = emitc.sub %0, %arg2 : (i32, i32) -> i32
    %2 = emitc.add %arg1, %arg3 : (i32, i32) -> i32
    %3 = emitc.div %2, %arg2 : (i32, i32) -> i32
    return %1, %3 : i32, i32
  }
  func.func @expression_with_call(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) -> i1 {
    %0 = emitc.mul %arg0, %arg1 : (i32, i32) -> i32
    %1 = emitc.call_opaque "foo"(%0, %arg2) : (i32, i32) -> i32
    %2 = emitc.cmp lt, %1, %arg1 : (i32, i32) -> i1
    return %2 : i1
  }
  func.func @expression_with_dereference(%arg0: i32, %arg1: i32, %arg2: !emitc.ptr<i32>) -> i1 {
    %0 = emitc.mul %arg0, %arg1 : (i32, i32) -> i32
    %1 = emitc.apply "*"(%arg2) : (!emitc.ptr<i32>) -> i32
    %2 = emitc.cmp lt, %0, %1 : (i32, i32) -> i1
    return %2 : i1
  }
  func.func @expression_with_address_taken(%arg0: i32, %arg1: i32, %arg2: !emitc.ptr<i32>) -> i1 {
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %1 = emitc.apply "&"(%0) : (!emitc.lvalue<i32>) -> !emitc.ptr<i32>
    %2 = emitc.add %1, %arg1 : (!emitc.ptr<i32>, i32) -> !emitc.ptr<i32>
    %3 = emitc.cmp lt, %2, %arg2 : (!emitc.ptr<i32>, !emitc.ptr<i32>) -> i1
    return %3 : i1
  }
  func.func @no_nested_expression(%arg0: i32, %arg1: i32) -> i1 {
    %0 = emitc.expression %arg0, %arg1 : (i32, i32) -> i1 {
      %1 = cmp lt, %arg0, %arg1 : (i32, i32) -> i1
      yield %1 : i1
    }
    return %0 : i1
  }
  func.func @single_result_requirement() -> (i32, i32) {
    %0:2 = emitc.call_opaque "foo"() : () -> (i32, i32)
    return %0#0, %0#1 : i32, i32
  }
  func.func @expression_with_load(%arg0: i32, %arg1: !emitc.ptr<i32>) -> i1 {
    %0 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "emitc.variable"() <{value = #emitc.opaque<"42">}> : () -> !emitc.lvalue<i32>
    %2 = emitc.load %1 : <i32>
    %3 = emitc.subscript %arg1[%0] : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %4 = emitc.load %3 : <i32>
    %5 = emitc.add %2, %4 : (i32, i32) -> i32
    %6 = emitc.cmp lt, %5, %arg0 : (i32, i32) -> i1
    return %6 : i1
  }
  func.func @opaque_type_expression(%arg0: i32, %arg1: !emitc.opaque<"T0">, %arg2: i32) -> i1 {
    %0 = "emitc.constant"() <{value = #emitc.opaque<"V">}> : () -> !emitc.opaque<"T1">
    %1 = emitc.mul %arg0, %0 : (i32, !emitc.opaque<"T1">) -> i32
    %2 = emitc.sub %1, %arg1 : (i32, !emitc.opaque<"T0">) -> i32
    %3 = emitc.cmp lt, %2, %arg2 : (i32, i32) -> i1
    return %3 : i1
  }
  func.func @expression_with_constant(%arg0: i32) -> i32 {
    %0 = "emitc.constant"() <{value = 42 : i32}> : () -> i32
    %1 = emitc.mul %arg0, %0 : (i32, i32) -> i32
    return %1 : i32
  }
}

