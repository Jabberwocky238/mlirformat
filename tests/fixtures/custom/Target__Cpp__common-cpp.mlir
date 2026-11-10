module {
  emitc.include "myheader.h"
  emitc.include <"myheader.h">
  func.func @test_include() {
    emitc.include "myheader.h"
    return
  }
  func.func @test_foo_print() {
    %0 = emitc.call_opaque "foo::constant"() <{args = [dense<[0, 1]> : tensor<2xi32>]}> : () -> i32
    %1 = emitc.call_opaque "foo::op_and_attr"(%0) <{args = [dense<[0, 1]> : tensor<2xi32>, 0 : index]}> : (i32) -> i32
    %2 = emitc.call_opaque "foo::op_and_attr"(%1) <{args = [0 : index, dense<[0, 1]> : tensor<2xi32>]}> : (i32) -> i32
    emitc.call_opaque "foo::print"(%2)  : (i32) -> ()
    return
  }
  func.func @test_single_return(%arg0: i32) -> i32 {
    return %arg0 : i32
  }
  func.func @test_multiple_return() -> (i32, i32) {
    %0:2 = emitc.call_opaque "foo::blah"()  : () -> (i32, i32)
    %1 = call @test_single_return(%0#0) : (i32) -> i32
    return %1, %0#1 : i32, i32
  }
  func.func @test_float() {
    %0 = emitc.call_opaque "foo::constant"() <{args = [dense<[0.000000e+00, 1.000000e+00]> : tensor<2xf32>]}> : () -> f32
    return
  }
  func.func @test_uint() {
    %0 = emitc.call_opaque "foo::constant"() <{args = [dense<[0, 1]> : tensor<2xui32>]}> : () -> ui32
    %1 = emitc.call_opaque "foo::constant"() <{args = [dense<[0, 1]> : tensor<2xui64>]}> : () -> ui64
    return
  }
  func.func @test_plus_int(%arg0: i64) -> i64 {
    %0 = emitc.call_opaque "mhlo::add"(%arg0, %arg0) <{args = [0 : index, 1 : index]}> : (i64, i64) -> i64
    return %0 : i64
  }
  func.func @mixed_types(%arg0: tensor<2xf64>) -> tensor<2xf32> {
    %0 = emitc.call_opaque "foo::mixed_types"(%arg0) <{args = [0 : index]}> : (tensor<2xf64>) -> tensor<2xf32>
    return %0 : tensor<2xf32>
  }
  func.func @mhlo_convert(%arg0: tensor<ui32>) -> tensor<ui64> {
    %0 = emitc.call_opaque "mhlo::convert"(%arg0) <{args = [0 : index]}> : (tensor<ui32>) -> tensor<ui64>
    return %0 : tensor<ui64>
  }
  func.func @opaque_types(%arg0: !emitc.opaque<"bool">, %arg1: !emitc.opaque<"char">) -> !emitc.opaque<"status_t"> {
    %0 = emitc.call_opaque "a"(%arg0, %arg1)  : (!emitc.opaque<"bool">, !emitc.opaque<"char">) -> !emitc.opaque<"int">
    %1 = emitc.call_opaque "b"(%0)  : (!emitc.opaque<"int">) -> !emitc.opaque<"char">
    %2 = emitc.call_opaque "c"(%0, %1)  : (!emitc.opaque<"int">, !emitc.opaque<"char">) -> !emitc.opaque<"status_t">
    return %2 : !emitc.opaque<"status_t">
  }
  func.func @address_of() {
    %0 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %1 = emitc.address_of %0 : !emitc.lvalue<i32>
    return
  }
  func.func @dereference(%arg0: !emitc.ptr<i32>) {
    %0 = emitc.dereference %arg0 : !emitc.ptr<i32>
    %1 = emitc.load %0 : <i32>
    return
  }
  func.func @array_type(%arg0: !emitc.array<3xi32>, %arg1: !emitc.array<10x20xf32>) {
    return
  }
  func.func @call_opaque_with_template_arg() {
    emitc.call_opaque "init_tile"() <{template_args = [512 : index]}> : () -> ()
    return
  }
}

