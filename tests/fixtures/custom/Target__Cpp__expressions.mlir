module {
  func.func @single_expression(%arg0: i32, %arg1: i32, %arg2: i32) -> i1 {
    %0 = emitc.expression %arg0, %arg1, %arg2 : (i32, i32, i32) -> i1 {
      %1 = "emitc.constant"() <{value = 42 : i32}> : () -> i32
      %2 = mul %arg0, %1 : (i32, i32) -> i32
      %3 = sub %2, %arg1 : (i32, i32) -> i32
      %4 = cmp lt, %3, %arg2 : (i32, i32) -> i1
      yield %4 : i1
    }
    return %0 : i1
  }
  func.func @single_use(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) -> i32 {
    %0 = emitc.literal "M_PI" : i32
    %1 = emitc.expression %arg0, %arg1, %arg2, %arg3, %0 : (i32, i32, i32, i32, i32) -> i1 {
      %4 = mul %arg0, %0 : (i32, i32) -> i32
      %5 = call_opaque "bar"(%4, %arg2)  : (i32, i32) -> i32
      %6 = sub %5, %arg3 : (i32, i32) -> i32
      %7 = cmp lt, %6, %arg1 : (i32, i32) -> i1
      yield %7 : i1
    }
    %2 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    emitc.if %1 {
      assign %arg0 : i32 to %2 : <i32>
    } else {
      assign %arg0 : i32 to %2 : <i32>
    }
    %3 = emitc.load %2 : <i32>
    return %3 : i32
  }
  func.func @do_not_inline(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %0 = emitc.expression %arg0, %arg1, %arg2 : (i32, i32, i32) -> i32 {
      %1 = add %arg0, %arg1 : (i32, i32) -> i32
      %2 = mul %1, %arg2 : (i32, i32) -> i32
      yield %2 : i32
    }
    return %0 : i32
  }
  func.func @parentheses_for_low_precedence(%arg0: i32, %arg1: i32, %arg2: i32) -> f32 {
    %0 = emitc.expression %arg0, %arg1, %arg2 : (i32, i32, i32) -> f32 {
      %1 = add %arg0, %arg1 : (i32, i32) -> i32
      %2 = mul %1, %arg2 : (i32, i32) -> i32
      %3 = cast %2 : i32 to f32
      yield %3 : f32
    }
    return %0 : f32
  }
  func.func @inline_cast_pure(%arg0: i32) -> f32 {
    %0 = emitc.expression %arg0 : (i32) -> f32 {
      %1 = cast %arg0 {pure} : i32 to f32
      yield %1 : f32
    }
    return %0 : f32
  }
  func.func @do_not_inline_cast_without_pure(%arg0: i32) -> f32 {
    %0 = emitc.expression %arg0 : (i32) -> f32 {
      %1 = cast %arg0 : i32 to f32
      yield %1 : f32
    }
    return %0 : f32
  }
  func.func @parentheses_for_same_precedence(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %0 = emitc.expression %arg0, %arg1, %arg2 : (i32, i32, i32) -> i32 {
      %1 = mul %arg0, %arg1 : (i32, i32) -> i32
      %2 = div %arg2, %1 : (i32, i32) -> i32
      yield %2 : i32
    }
    return %0 : i32
  }
  func.func @user_with_expression_trait(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %0 = "emitc.constant"() <{value = 0 : i32}> : () -> i32
    %1 = emitc.expression %arg0, %arg1, %arg2 : (i32, i32, i32) -> i32 {
      %12 = mul %arg0, %arg1 : (i32, i32) -> i32
      %13 = div %arg2, %12 : (i32, i32) -> i32
      yield %13 : i32
    }
    %2 = emitc.expression %arg0, %arg1, %arg2 : (i32, i32, i32) -> i32 {
      %12 = mul %arg0, %arg1 : (i32, i32) -> i32
      %13 = div %arg2, %12 : (i32, i32) -> i32
      yield %13 : i32
    }
    %3 = emitc.expression %arg0, %arg1, %arg2 : (i32, i32, i32) -> i32 {
      %12 = mul %arg0, %arg1 : (i32, i32) -> i32
      %13 = div %arg2, %12 : (i32, i32) -> i32
      yield %13 : i32
    }
    %4 = emitc.expression %arg0, %arg1, %arg2 : (i32, i32, i32) -> i32 {
      %12 = mul %arg0, %arg1 : (i32, i32) -> i32
      %13 = div %arg2, %12 : (i32, i32) -> i32
      yield %13 : i32
    }
    %5 = emitc.expression %arg0, %arg1, %arg2 : (i32, i32, i32) -> i32 {
      %12 = mul %arg0, %arg1 : (i32, i32) -> i32
      %13 = div %arg2, %12 : (i32, i32) -> i32
      yield %13 : i32
    }
    %6 = emitc.expression %arg0, %arg1, %arg2 : (i32, i32, i32) -> i32 {
      %12 = mul %arg0, %arg1 : (i32, i32) -> i32
      %13 = div %arg2, %12 : (i32, i32) -> i32
      yield %13 : i32
    }
    %7 = emitc.cast %1 : i32 to i1
    %8 = emitc.add %2, %0 : (i32, i32) -> i32
    %9 = emitc.call_opaque "bar"(%3, %0)  : (i32, i32) -> i32
    %10 = emitc.conditional %7, %4, %0 : i32
    %11 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    emitc.assign %5 : i32 to %11 : <i32>
    return %6 : i32
  }
  func.func @multiple_uses(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) -> i32 {
    %0 = emitc.expression %arg0, %arg1, %arg2, %arg3 : (i32, i32, i32, i32) -> i1 {
      %4 = mul %arg0, %arg1 : (i32, i32) -> i32
      %5 = call_opaque "bar"(%4, %arg2)  : (i32, i32) -> i32
      %6 = sub %5, %4 : (i32, i32) -> i32
      %7 = cmp lt, %6, %arg3 : (i32, i32) -> i1
      yield %7 : i1
    }
    %1 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    emitc.if %0 {
      assign %arg0 : i32 to %1 : <i32>
    } else {
      assign %arg0 : i32 to %1 : <i32>
    }
    %2 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i1>
    emitc.assign %0 : i1 to %2 : <i1>
    %3 = emitc.load %1 : <i32>
    return %3 : i32
  }
  func.func @different_expressions(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) -> i32 {
    %0 = emitc.expression %arg2, %arg3 : (i32, i32) -> i32 {
      %5 = rem %arg2, %arg3 : (i32, i32) -> i32
      yield %5 : i32
    }
    %1 = emitc.expression %arg0, %arg1, %0 : (i32, i32, i32) -> i32 {
      %5 = mul %arg0, %arg1 : (i32, i32) -> i32
      %6 = call_opaque "bar"(%0, %5)  : (i32, i32) -> i32
      yield %6 : i32
    }
    %2 = emitc.expression %arg1, %1, %arg3 : (i32, i32, i32) -> i1 {
      %5 = sub %1, %arg3 : (i32, i32) -> i32
      %6 = cmp lt, %5, %arg1 : (i32, i32) -> i1
      yield %6 : i1
    }
    %3 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    emitc.if %2 {
      assign %arg0 : i32 to %3 : <i32>
    } else {
      assign %arg0 : i32 to %3 : <i32>
    }
    %4 = emitc.load %3 : <i32>
    return %4 : i32
  }
  func.func @expression_with_address_taken(%arg0: i32, %arg1: i32, %arg2: !emitc.ptr<i32>) -> i1 {
    %0 = "emitc.variable"() <{value = 42 : i32}> : () -> !emitc.lvalue<i32>
    %1 = emitc.expression %arg1, %arg2, %0 : (i32, !emitc.ptr<i32>, !emitc.lvalue<i32>) -> i1 {
      %2 = address_of %0 : !emitc.lvalue<i32>
      %3 = sub %2, %arg1 : (!emitc.ptr<i32>, i32) -> !emitc.ptr<i32>
      %4 = cmp lt, %3, %arg2 : (!emitc.ptr<i32>, !emitc.ptr<i32>) -> i1
      yield %4 : i1
    }
    return %1 : i1
  }
  func.func @expression_with_subscript(%arg0: !emitc.array<4x8xi32>, %arg1: i32, %arg2: i32) -> i32 {
    %0 = emitc.expression %arg0, %arg1, %arg2 : (!emitc.array<4x8xi32>, i32, i32) -> i32 {
      %1 = add %arg1, %arg2 : (i32, i32) -> i32
      %2 = mul %1, %arg2 : (i32, i32) -> i32
      %3 = subscript %arg0[%1, %2] : (!emitc.array<4x8xi32>, i32, i32) -> !emitc.lvalue<i32>
      %4 = load %3 : <i32>
      yield %4 : i32
    }
    return %0 : i32
  }
  func.func @expression_with_subscript_user(%arg0: !emitc.ptr<!emitc.opaque<"void">>) -> i32 {
    %0 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %1 = emitc.expression %arg0 : (!emitc.ptr<!emitc.opaque<"void">>) -> !emitc.ptr<i32> {
      %4 = cast %arg0 : !emitc.ptr<!emitc.opaque<"void">> to !emitc.ptr<i32>
      yield %4 : !emitc.ptr<i32>
    }
    %2 = emitc.subscript %1[%0] : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %3 = emitc.load %2 : <i32>
    return %3 : i32
  }
  emitc.func @expression_with_load(%arg0: i32, %arg1: i32, %arg2: !emitc.ptr<i32>) -> i1 {
    %0 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "emitc.variable"() <{value = #emitc.opaque<"42">}> : () -> !emitc.lvalue<i32>
    %2 = subscript %arg2[%0] : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %3 = expression %arg0, %arg1, %1, %2 : (i32, i32, !emitc.lvalue<i32>, !emitc.lvalue<i32>) -> i1 {
      %4 = load %1 : <i32>
      %5 = add %4, %arg1 : (i32, i32) -> i32
      %6 = load %2 : <i32>
      %7 = add %6, %arg0 : (i32, i32) -> i32
      %8 = cmp lt, %5, %7 : (i32, i32) -> i1
      yield %8 : i1
    }
    return %3 : i1
  }
  emitc.func @expression_with_load_and_call(%arg0: !emitc.ptr<i32>) -> i1 {
    %0 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %1 = subscript %arg0[%0] : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %2 = expression %1 : (!emitc.lvalue<i32>) -> i1 {
      %3 = load %1 : <i32>
      %4 = load %1 : <i32>
      %5 = load %1 : <i32>
      %6 = call_opaque "bar"(%3)  : (i32) -> i32
      %7 = add %5, %6 : (i32, i32) -> i32
      %8 = cmp lt, %7, %4 : (i32, i32) -> i1
      yield %8 : i1
    }
    return %2 : i1
  }
  emitc.func @expression_with_call_opaque_with_args_array(%arg0: i32, %arg1: i32) {
    %0 = expression %arg0, %arg1 : (i32, i32) -> i1 {
      %1 = cmp lt, %arg0, %arg1 : (i32, i32) -> i1
      %2 = call_opaque "f"(%1) <{args = [0 : index]}> : (i1) -> i1
      yield %2 : i1
    }
    return
  }
  emitc.func @inline_side_effects_into_assign(%arg0: i32, %arg1: !emitc.ptr<i32>) {
    %0 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "emitc.variable"() <{value = #emitc.opaque<"42">}> : () -> !emitc.lvalue<i32>
    %2 = subscript %arg1[%0] : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %3 = expression %arg0, %1, %2 : (i32, !emitc.lvalue<i32>, !emitc.lvalue<i32>) -> i32 {
      %4 = load %1 : <i32>
      %5 = mul %4, %arg0 : (i32, i32) -> i32
      %6 = load %2 : <i32>
      %7 = add %5, %6 : (i32, i32) -> i32
      yield %7 : i32
    }
    assign %3 : i32 to %1 : <i32>
    return
  }
  emitc.func @do_not_inline_side_effects_into_assign(%arg0: i32, %arg1: !emitc.ptr<i32>) {
    %0 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "emitc.variable"() <{value = #emitc.opaque<"42">}> : () -> !emitc.lvalue<i32>
    %2 = subscript %arg1[%0] : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %3 = expression %arg0, %1 : (i32, !emitc.lvalue<i32>) -> i32 {
      %4 = load %1 : <i32>
      %5 = mul %4, %arg0 : (i32, i32) -> i32
      yield %5 : i32
    }
    assign %3 : i32 to %2 : <i32>
    return
  }
  emitc.func @do_not_inline_non_preceding_side_effects(%arg0: i32, %arg1: !emitc.ptr<i32>) -> i32 {
    %0 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "emitc.variable"() <{value = #emitc.opaque<"42">}> : () -> !emitc.lvalue<i32>
    %2 = subscript %arg1[%0] : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %3 = expression %arg0, %1 : (i32, !emitc.lvalue<i32>) -> i32 {
      %4 = load %1 : <i32>
      %5 = mul %4, %arg0 : (i32, i32) -> i32
      yield %5 : i32
    }
    assign %arg0 : i32 to %2 : <i32>
    return %3 : i32
  }
  func.func @inline_side_effects_into_if(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %1 = emitc.expression %arg0, %arg1, %arg2 : (i32, i32, i32) -> i1 {
      %3 = call_opaque "bar"(%arg0, %arg1)  : (i32, i32) -> i32
      %4 = cmp lt, %3, %arg2 : (i32, i32) -> i1
      yield %4 : i1
    }
    emitc.if %1 {
      assign %arg0 : i32 to %0 : <i32>
    } else {
      assign %arg1 : i32 to %0 : <i32>
    }
    %2 = emitc.load %0 : <i32>
    return %2 : i32
  }
  func.func @inline_side_effects_into_switch(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = emitc.expression %arg0, %arg1, %arg2 : (i32, i32, i32) -> i32 {
      %1 = call_opaque "bar"(%arg0, %arg1)  : (i32, i32) -> i32
      %2 = add %1, %arg2 : (i32, i32) -> i32
      yield %2 : i32
    }
    emitc.switch %0 : i32 
    case 2 {
      %1 = call_opaque "func_b"()  : () -> i32
      yield
    }
    case 5 {
      %1 = call_opaque "func_a"()  : () -> i32
      yield
    }
    default {
      %1 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      call_opaque "func2"(%1)  : (f32) -> ()
    }
    return
  }
  func.func @member(%arg0: !emitc.opaque<"mystruct">, %arg1: i32, %arg2: index) {
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.opaque<"mystruct">>
    emitc.assign %arg0 : !emitc.opaque<"mystruct"> to %0 : <!emitc.opaque<"mystruct">>
    %1 = emitc.expression %0 : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32> {
      %6 = "emitc.member"(%0) <{member = "a"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32>
      yield %6 : !emitc.lvalue<i32>
    }
    emitc.assign %arg1 : i32 to %1 : <i32>
    %2 = emitc.expression %0 : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> i32 {
      %6 = "emitc.member"(%0) <{member = "b"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32>
      %7 = load %6 : <i32>
      yield %7 : i32
    }
    %3 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    emitc.assign %2 : i32 to %3 : <i32>
    %4 = emitc.expression %arg2, %0 : (index, !emitc.lvalue<!emitc.opaque<"mystruct">>) -> i32 {
      %6 = "emitc.member"(%0) <{member = "c"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.array<2xi32>
      %7 = subscript %6[%arg2] : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
      %8 = load %7 : <i32>
      yield %8 : i32
    }
    emitc.assign %4 : i32 to %3 : <i32>
    %5 = emitc.expression %arg2, %0 : (index, !emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32> {
      %6 = "emitc.member"(%0) <{member = "d"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.array<2xi32>
      %7 = subscript %6[%arg2] : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
      yield %7 : !emitc.lvalue<i32>
    }
    emitc.assign %arg1 : i32 to %5 : <i32>
    return
  }
  func.func @member_of_pointer(%arg0: !emitc.ptr<!emitc.opaque<"mystruct">>, %arg1: i32, %arg2: index) {
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>
    emitc.assign %arg0 : !emitc.ptr<!emitc.opaque<"mystruct">> to %0 : <!emitc.ptr<!emitc.opaque<"mystruct">>>
    %1 = emitc.expression %0 : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32> {
      %6 = "emitc.member_of_ptr"(%0) <{member = "a"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32>
      yield %6 : !emitc.lvalue<i32>
    }
    emitc.assign %arg1 : i32 to %1 : <i32>
    %2 = emitc.expression %0 : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> i32 {
      %6 = "emitc.member_of_ptr"(%0) <{member = "b"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32>
      %7 = load %6 : <i32>
      yield %7 : i32
    }
    %3 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    emitc.assign %2 : i32 to %3 : <i32>
    %4 = emitc.expression %arg2, %0 : (index, !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> i32 {
      %6 = "emitc.member_of_ptr"(%0) <{member = "c"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.array<2xi32>
      %7 = subscript %6[%arg2] : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
      %8 = load %7 : <i32>
      yield %8 : i32
    }
    emitc.assign %4 : i32 to %3 : <i32>
    %5 = emitc.expression %arg2, %0 : (index, !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32> {
      %6 = "emitc.member_of_ptr"(%0) <{member = "d"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.array<2xi32>
      %7 = subscript %6[%arg2] : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
      yield %7 : !emitc.lvalue<i32>
    }
    emitc.assign %arg1 : i32 to %5 : <i32>
    return
  }
  func.func @expression_with_literal(%arg0: f32) -> f32 {
    %0 = emitc.expression %arg0 : (f32) -> f32 {
      %1 = literal "M_PI" : f32
      %2 = add %arg0, %1 : (f32, f32) -> f32
      yield %2 : f32
    }
    return %0 : f32
  }
  func.func @expression_tree(%arg0: !emitc.array<2000xi32>, %arg1: i32, %arg2: i32, %arg3: index) -> i1 {
    %0 = emitc.expression %arg0, %arg3 : (!emitc.array<2000xi32>, index) -> !emitc.lvalue<i32> {
      %2 = "emitc.constant"() <{value = 42 : index}> : () -> index
      %3 = mul %arg3, %2 : (index, index) -> index
      %4 = subscript %arg0[%3] : (!emitc.array<2000xi32>, index) -> !emitc.lvalue<i32>
      yield %4 : !emitc.lvalue<i32>
    }
    %1 = emitc.expression %0, %arg1, %arg2 : (!emitc.lvalue<i32>, i32, i32) -> i1 {
      %2 = load %0 : <i32>
      %3 = sub %2, %arg1 : (i32, i32) -> i32
      %4 = cmp lt, %3, %arg2 : (i32, i32) -> i1
      yield %4 : i1
    }
    return %1 : i1
  }
}

