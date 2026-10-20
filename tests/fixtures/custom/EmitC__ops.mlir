module {
  emitc.include <"test.h">
  emitc.include "test.h"
  func.func @f(%arg0: i32, %arg1: !emitc.opaque<"int32_t">) {
    %0 = emitc.call_opaque "blah"() : () -> i64
    emitc.call_opaque "foo"(%0) {args = [0 : index, dense<[0, 1]> : tensor<2xi32>, 0 : index]} : (i64) -> ()
    return
  }
  emitc.declare_func @func
  emitc.func @func(%arg0: i32) {
    call_opaque "foo"(%arg0) : (i32) -> ()
    return
  }
  emitc.func @return_i32() -> i32 attributes {specifiers = ["static", "inline"]} {
    %0 = call_opaque "foo"() : () -> i32
    return %0 : i32
  }
  emitc.func @call() -> i32 {
    %0 = call @return_i32() : () -> i32
    return %0 : i32
  }
  emitc.func private @extern(i32) attributes {specifiers = ["extern"]}
  func.func @cast(%arg0: i32) {
    %0 = emitc.cast %arg0 : i32 to f32
    return
  }
  func.func @cast_array_to_pointer(%arg0: !emitc.array<3xi32>) {
    %0 = emitc.cast %arg0 : !emitc.array<3xi32> to !emitc.ptr<i32>
    return
  }
  func.func @c() {
    %0 = "emitc.constant"() <{value = 42 : i32}> : () -> i32
    %1 = "emitc.constant"() <{value = 42 : index}> : () -> !emitc.size_t
    %2 = "emitc.constant"() <{value = 42 : index}> : () -> !emitc.ssize_t
    %3 = "emitc.constant"() <{value = 42 : index}> : () -> !emitc.ptrdiff_t
    return
  }
  func.func @a() {
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %1 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %2 = emitc.apply "&"(%0) : (!emitc.lvalue<i32>) -> !emitc.ptr<i32>
    %3 = emitc.apply "&"(%1) : (!emitc.lvalue<i32>) -> !emitc.ptr<i32>
    return
  }
  func.func @add_int(%arg0: i32, %arg1: i32) {
    %0 = emitc.add %arg0, %arg1 : (i32, i32) -> i32
    return
  }
  func.func @add_pointer(%arg0: !emitc.ptr<f32>, %arg1: i32, %arg2: !emitc.opaque<"unsigned int">) {
    %0 = emitc.add %arg0, %arg1 : (!emitc.ptr<f32>, i32) -> !emitc.ptr<f32>
    %1 = emitc.add %arg0, %arg2 : (!emitc.ptr<f32>, !emitc.opaque<"unsigned int">) -> !emitc.ptr<f32>
    return
  }
  func.func @bitwise(%arg0: i32, %arg1: i32) {
    %0 = emitc.bitwise_and %arg0, %arg1 : (i32, i32) -> i32
    %1 = emitc.bitwise_left_shift %arg0, %arg1 : (i32, i32) -> i32
    %2 = emitc.bitwise_not %arg0 : (i32) -> i32
    %3 = emitc.bitwise_or %arg0, %arg1 : (i32, i32) -> i32
    %4 = emitc.bitwise_right_shift %arg0, %arg1 : (i32, i32) -> i32
    %5 = emitc.bitwise_xor %arg0, %arg1 : (i32, i32) -> i32
    return
  }
  func.func @cond(%arg0: i1, %arg1: i32, %arg2: i32) {
    %0 = emitc.conditional %arg0, %arg1, %arg2 : i32
    return
  }
  func.func @div_int(%arg0: i32, %arg1: i32) {
    %0 = emitc.div %arg0, %arg1 : (i32, i32) -> i32
    return
  }
  func.func @div_float(%arg0: f32, %arg1: f32) {
    %0 = emitc.div %arg0, %arg1 : (f32, f32) -> f32
    return
  }
  func.func @mul_int(%arg0: i32, %arg1: i32) {
    %0 = emitc.mul %arg0, %arg1 : (i32, i32) -> i32
    return
  }
  func.func @mul_float(%arg0: f32, %arg1: f32) {
    %0 = emitc.mul %arg0, %arg1 : (f32, f32) -> f32
    return
  }
  func.func @rem(%arg0: i32, %arg1: i32) {
    %0 = emitc.rem %arg0, %arg1 : (i32, i32) -> i32
    return
  }
  func.func @sub_int(%arg0: i32, %arg1: i32) {
    %0 = emitc.sub %arg0, %arg1 : (i32, i32) -> i32
    return
  }
  func.func @sub_pointer(%arg0: !emitc.ptr<f32>, %arg1: i32, %arg2: !emitc.opaque<"unsigned int">, %arg3: !emitc.ptr<f32>) {
    %0 = emitc.sub %arg0, %arg1 : (!emitc.ptr<f32>, i32) -> !emitc.ptr<f32>
    %1 = emitc.sub %arg0, %arg2 : (!emitc.ptr<f32>, !emitc.opaque<"unsigned int">) -> !emitc.ptr<f32>
    %2 = emitc.sub %arg0, %arg3 : (!emitc.ptr<f32>, !emitc.ptr<f32>) -> !emitc.opaque<"ptrdiff_t">
    %3 = emitc.sub %arg0, %arg3 : (!emitc.ptr<f32>, !emitc.ptr<f32>) -> i32
    %4 = emitc.sub %arg0, %arg3 : (!emitc.ptr<f32>, !emitc.ptr<f32>) -> !emitc.ptrdiff_t
    return
  }
  func.func @cmp(%arg0: i32, %arg1: f32, %arg2: i64, %arg3: f64, %arg4: !emitc.opaque<"unsigned">, %arg5: !emitc.opaque<"std::valarray<int>">, %arg6: !emitc.opaque<"custom">) {
    %0 = emitc.cmp eq, %arg0, %arg0 : (i32, i32) -> i1
    %1 = emitc.cmp eq, %arg0, %arg0 : (i32, i32) -> i1
    %2 = emitc.cmp ne, %arg1, %arg1 : (f32, f32) -> i1
    %3 = emitc.cmp ne, %arg1, %arg1 : (f32, f32) -> i1
    %4 = emitc.cmp lt, %arg2, %arg2 : (i64, i64) -> i1
    %5 = emitc.cmp lt, %arg2, %arg2 : (i64, i64) -> i1
    %6 = emitc.cmp le, %arg3, %arg3 : (f64, f64) -> i1
    %7 = emitc.cmp le, %arg3, %arg3 : (f64, f64) -> i1
    %8 = emitc.cmp gt, %arg4, %arg4 : (!emitc.opaque<"unsigned">, !emitc.opaque<"unsigned">) -> i1
    %9 = emitc.cmp gt, %arg4, %arg4 : (!emitc.opaque<"unsigned">, !emitc.opaque<"unsigned">) -> i1
    %10 = emitc.cmp ge, %arg5, %arg5 : (!emitc.opaque<"std::valarray<int>">, !emitc.opaque<"std::valarray<int>">) -> !emitc.opaque<"std::valarray<bool>">
    %11 = emitc.cmp ge, %arg5, %arg5 : (!emitc.opaque<"std::valarray<int>">, !emitc.opaque<"std::valarray<int>">) -> !emitc.opaque<"std::valarray<bool>">
    %12 = emitc.cmp three_way, %arg6, %arg6 : (!emitc.opaque<"custom">, !emitc.opaque<"custom">) -> !emitc.opaque<"custom">
    %13 = emitc.cmp three_way, %arg6, %arg6 : (!emitc.opaque<"custom">, !emitc.opaque<"custom">) -> !emitc.opaque<"custom">
    return
  }
  func.func @logical(%arg0: i32, %arg1: i32) {
    %0 = emitc.logical_and %arg0, %arg1 : i32, i32
    %1 = emitc.logical_not %arg0 : i32
    %2 = emitc.logical_or %arg0, %arg1 : i32, i32
    return
  }
  func.func @unary(%arg0: i32) {
    %0 = emitc.unary_minus %arg0 : (i32) -> i32
    %1 = emitc.unary_plus %arg0 : (i32) -> i32
    return
  }
  func.func @test_if(%arg0: i1, %arg1: f32) {
    emitc.if %arg0 {
      %0 = call_opaque "func_const"(%arg1) : (f32) -> i32
    }
    return
  }
  func.func @test_if_explicit_yield(%arg0: i1, %arg1: f32) {
    emitc.if %arg0 {
      %0 = call_opaque "func_const"(%arg1) : (f32) -> i32
    }
    return
  }
  func.func @test_if_else(%arg0: i1, %arg1: f32) {
    emitc.if %arg0 {
      %0 = call_opaque "func_true"(%arg1) : (f32) -> i32
    } else {
      %0 = call_opaque "func_false"(%arg1) : (f32) -> i32
    }
    return
  }
  func.func @test_assign(%arg0: f32) {
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<f32>
    emitc.assign %arg0 : f32 to %0 : <f32>
    return
  }
  func.func @test_expression(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: f32, %arg4: f32) -> i32 {
    %0 = "emitc.constant"() <{value = 7 : i32}> : () -> i32
    %1 = emitc.expression %arg1, %0 : (i32, i32) -> i32 {
      %3 = rem %arg1, %0 : (i32, i32) -> i32
      yield %3 : i32
    }
    %2 = emitc.expression %arg0, %arg1, %arg2, %arg3, %arg4, %1 : (i32, i32, i32, f32, f32, i32) -> i32 {
      %3 = add %arg0, %arg1 : (i32, i32) -> i32
      %4 = call_opaque "bar"(%3, %arg2, %1) : (i32, i32, i32) -> i32
      %5 = mul %arg3, %arg4 : (f32, f32) -> f32
      %6 = cast %5 : f32 to i32
      %7 = sub %4, %6 : (i32, i32) -> i32
      yield %7 : i32
    }
    return %2 : i32
  }
  func.func @test_expression_multiple_uses(%arg0: i32, %arg1: i32) -> i32 {
    %0 = emitc.expression %arg0, %arg1 : (i32, i32) -> i32 {
      %1 = rem %arg0, %arg1 : (i32, i32) -> i32
      %2 = add %1, %arg0 : (i32, i32) -> i32
      %3 = mul %2, %1 : (i32, i32) -> i32
      yield %3 : i32
    }
    return %0 : i32
  }
  func.func @test_for(%arg0: index, %arg1: index, %arg2: index) {
    emitc.for %arg3 = %arg0 to %arg1 step %arg2 {
      %0 = call_opaque "func_const"(%arg3) : (index) -> i32
    }
    return
  }
  func.func @test_for_explicit_yield(%arg0: index, %arg1: index, %arg2: index) {
    emitc.for %arg3 = %arg0 to %arg1 step %arg2 {
      %0 = call_opaque "func_const"(%arg3) : (index) -> i32
    }
    return
  }
  func.func @test_for_not_index_induction(%arg0: i16, %arg1: i16, %arg2: i16) {
    emitc.for %arg3 = %arg0 to %arg1 step %arg2  : i16 {
      %0 = call_opaque "func_const"(%arg3) : (i16) -> i32
    }
    return
  }
  func.func @test_subscript(%arg0: !emitc.array<2x3xf32>, %arg1: !emitc.ptr<i32>, %arg2: !emitc.opaque<"std::map<char, int>">, %arg3: index, %arg4: i32, %arg5: !emitc.opaque<"char">) {
    %0 = emitc.subscript %arg0[%arg3, %arg4] : (!emitc.array<2x3xf32>, index, i32) -> !emitc.lvalue<f32>
    %1 = emitc.subscript %arg1[%arg3] : (!emitc.ptr<i32>, index) -> !emitc.lvalue<i32>
    %2 = emitc.subscript %arg2[%arg5] : (!emitc.opaque<"std::map<char, int>">, !emitc.opaque<"char">) -> !emitc.lvalue<!emitc.opaque<"int">>
    return
  }
  emitc.verbatim "#ifdef __cplusplus"
  emitc.verbatim "extern \22C\22 {"
  emitc.verbatim "#endif  // __cplusplus"
  emitc.verbatim "#ifdef __cplusplus"
  emitc.verbatim "}  // extern \22C\22"
  emitc.verbatim "#endif  // __cplusplus"
  emitc.verbatim "typedef int32_t i32;"
  emitc.verbatim "typedef float f32;"
  emitc.verbatim "{} {  }"
  func.func @test_verbatim(%arg0: !emitc.ptr<i32>, %arg1: i32, %arg2: !emitc.array<3x!emitc.ptr<i32>>) {
    %0 = "emitc.variable"() <{value = #emitc.opaque<"1">}> : () -> !emitc.lvalue<i32>
    emitc.verbatim "++{};" args %0 : !emitc.lvalue<i32>
    emitc.verbatim "*{}[0] = 1;" args %arg2 : !emitc.array<3x!emitc.ptr<i32>>
    emitc.verbatim "{} + {};" args %arg0, %arg1 : !emitc.ptr<i32>, i32
    emitc.verbatim "b"
    %1 = "emitc.constant"() <{value = 42 : i32}> : () -> i32
    return
  }
  emitc.global @uninit : i32
  emitc.global @myglobal_int : i32 = 4
  emitc.global extern @external_linkage : i32
  emitc.global static @internal_linkage : i32
  emitc.global @myglobal : !emitc.array<2xf32> = dense<4.000000e+00>
  emitc.global const @myconstant : !emitc.array<2xi16> = dense<2>
  func.func @use_global(%arg0: index) -> f32 {
    %0 = emitc.get_global @myglobal : !emitc.array<2xf32>
    %1 = emitc.subscript %0[%arg0] : (!emitc.array<2xf32>, index) -> !emitc.lvalue<f32>
    %2 = emitc.load %1 : <f32>
    return %2 : f32
  }
  func.func @assign_global(%arg0: i32) {
    %0 = emitc.get_global @myglobal_int : !emitc.lvalue<i32>
    emitc.assign %arg0 : i32 to %0 : <i32>
    return
  }
  func.func @member_access(%arg0: !emitc.lvalue<!emitc.opaque<"mystruct">>, %arg1: !emitc.lvalue<!emitc.opaque<"mystruct_ptr">>, %arg2: !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) {
    %0 = "emitc.member"(%arg0) <{member = "a"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32>
    %1 = "emitc.member"(%arg0) <{member = "b"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.array<2xi32>
    %2 = "emitc.member_of_ptr"(%arg1) <{member = "a"}> : (!emitc.lvalue<!emitc.opaque<"mystruct_ptr">>) -> !emitc.lvalue<i32>
    %3 = "emitc.member_of_ptr"(%arg1) <{member = "b"}> : (!emitc.lvalue<!emitc.opaque<"mystruct_ptr">>) -> !emitc.array<2xi32>
    %4 = "emitc.member_of_ptr"(%arg2) <{member = "a"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32>
    %5 = "emitc.member_of_ptr"(%arg2) <{member = "b"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.array<2xi32>
    return
  }
  func.func @switch() {
    %0 = "emitc.constant"() <{value = 1 : index}> : () -> !emitc.ptrdiff_t
    emitc.switch %0 : !emitc.ptrdiff_t 
    case 1 {
      %1 = call_opaque "func_b"() : () -> i32
      yield
    }
    case 2 {
      %1 = call_opaque "func_a"() : () -> i32
      yield
    }
    default {
      %1 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      call_opaque "func2"(%1) : (f32) -> ()
    }
    return
  }
  emitc.class final @finalClass {
    emitc.field @fieldName0 : !emitc.array<1xf32>
    emitc.field @fieldName1 : !emitc.array<1xf32>
    emitc.func @execute() {
      %0 = "emitc.constant"() <{value = 0 : index}> : () -> !emitc.size_t
      %1 = get_field @fieldName0 : !emitc.array<1xf32>
      %2 = get_field @fieldName1 : !emitc.array<1xf32>
      %3 = subscript %1[%0] : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
      return
    }
  }
  func.func @do(%arg0: !emitc.ptr<i32>) {
    %0 = emitc.literal "1" : i32
    %1 = emitc.literal "2" : i32
    %2 = emitc.literal "3" : i32
    emitc.do {
      verbatim "printf(\22%d\22, *{});" args %arg0 : !emitc.ptr<i32>
    } while {
      %3 = expression %0, %1, %2 : (i32, i32, i32) -> i1 {
        %4 = add %0, %1 : (i32, i32) -> i32
        %5 = cmp eq, %4, %2 : (i32, i32) -> i1
        yield %5 : i1
      }
      yield %3 : i1
    }
    return
  }
  func.func @address_of(%arg0: !emitc.lvalue<i32>) {
    %0 = emitc.address_of %arg0 : !emitc.lvalue<i32>
    return
  }
  func.func @dereference(%arg0: !emitc.ptr<i32>) {
    %0 = emitc.dereference %arg0 : !emitc.ptr<i32>
    return
  }
}

