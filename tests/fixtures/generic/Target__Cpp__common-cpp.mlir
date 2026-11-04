"builtin.module"() ({
  "emitc.include"() <{include = "myheader.h"}> : () -> ()
  "emitc.include"() <{include = "myheader.h", is_standard_include}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_include"}> ({
    "emitc.include"() <{include = "myheader.h"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_foo_print"}> ({
    %19 = "emitc.call_opaque"() <{args = [dense<[0, 1]> : tensor<2xi32>], callee = "foo::constant"}> : () -> i32
    %20 = "emitc.call_opaque"(%19) <{args = [dense<[0, 1]> : tensor<2xi32>, 0 : index], callee = "foo::op_and_attr"}> : (i32) -> i32
    %21 = "emitc.call_opaque"(%20) <{args = [0 : index, dense<[0, 1]> : tensor<2xi32>], callee = "foo::op_and_attr"}> : (i32) -> i32
    "emitc.call_opaque"(%21) <{callee = "foo::print"}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "test_single_return"}> ({
  ^bb0(%arg8: i32):
    "func.return"(%arg8) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i32, i32), sym_name = "test_multiple_return"}> ({
    %17:2 = "emitc.call_opaque"() <{callee = "foo::blah"}> : () -> (i32, i32)
    %18 = "func.call"(%17#0) <{callee = @test_single_return}> : (i32) -> i32
    "func.return"(%18, %17#1) : (i32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_float"}> ({
    %16 = "emitc.call_opaque"() <{args = [dense<[0.000000e+00, 1.000000e+00]> : tensor<2xf32>], callee = "foo::constant"}> : () -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_uint"}> ({
    %14 = "emitc.call_opaque"() <{args = [dense<[0, 1]> : tensor<2xui32>], callee = "foo::constant"}> : () -> ui32
    %15 = "emitc.call_opaque"() <{args = [dense<[0, 1]> : tensor<2xui64>], callee = "foo::constant"}> : () -> ui64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> i64, sym_name = "test_plus_int"}> ({
  ^bb0(%arg7: i64):
    %13 = "emitc.call_opaque"(%arg7, %arg7) <{args = [0 : index, 1 : index], callee = "mhlo::add"}> : (i64, i64) -> i64
    "func.return"(%13) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xf64>) -> tensor<2xf32>, sym_name = "mixed_types"}> ({
  ^bb0(%arg6: tensor<2xf64>):
    %12 = "emitc.call_opaque"(%arg6) <{args = [0 : index], callee = "foo::mixed_types"}> : (tensor<2xf64>) -> tensor<2xf32>
    "func.return"(%12) : (tensor<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<ui32>) -> tensor<ui64>, sym_name = "mhlo_convert"}> ({
  ^bb0(%arg5: tensor<ui32>):
    %11 = "emitc.call_opaque"(%arg5) <{args = [0 : index], callee = "mhlo::convert"}> : (tensor<ui32>) -> tensor<ui64>
    "func.return"(%11) : (tensor<ui64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.opaque<"bool">, !emitc.opaque<"char">) -> !emitc.opaque<"status_t">, sym_name = "opaque_types"}> ({
  ^bb0(%arg3: !emitc.opaque<"bool">, %arg4: !emitc.opaque<"char">):
    %8 = "emitc.call_opaque"(%arg3, %arg4) <{callee = "a"}> : (!emitc.opaque<"bool">, !emitc.opaque<"char">) -> !emitc.opaque<"int">
    %9 = "emitc.call_opaque"(%8) <{callee = "b"}> : (!emitc.opaque<"int">) -> !emitc.opaque<"char">
    %10 = "emitc.call_opaque"(%8, %9) <{callee = "c"}> : (!emitc.opaque<"int">, !emitc.opaque<"char">) -> !emitc.opaque<"status_t">
    "func.return"(%10) : (!emitc.opaque<"status_t">) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> !emitc.ptr<i32>, sym_name = "apply"}> ({
    %4 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %5 = "emitc.apply"(%4) <{applicableOperator = "&"}> : (!emitc.lvalue<i32>) -> !emitc.ptr<i32>
    %6 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %7 = "emitc.apply"(%5) <{applicableOperator = "*"}> : (!emitc.ptr<i32>) -> i32
    "emitc.assign"(%6, %7) : (!emitc.lvalue<i32>, i32) -> ()
    "func.return"(%5) : (!emitc.ptr<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "address_of"}> ({
    %2 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %3 = "emitc.address_of"(%2) : (!emitc.lvalue<i32>) -> !emitc.ptr<i32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.ptr<i32>) -> (), sym_name = "dereference"}> ({
  ^bb0(%arg2: !emitc.ptr<i32>):
    %0 = "emitc.dereference"(%arg2) : (!emitc.ptr<i32>) -> !emitc.lvalue<i32>
    %1 = "emitc.load"(%0) : (!emitc.lvalue<i32>) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.array<3xi32>, !emitc.array<10x20xf32>) -> (), sym_name = "array_type"}> ({
  ^bb0(%arg0: !emitc.array<3xi32>, %arg1: !emitc.array<10x20xf32>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "call_opaque_with_template_arg"}> ({
    "emitc.call_opaque"() <{callee = "init_tile", template_args = [512 : index]}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

