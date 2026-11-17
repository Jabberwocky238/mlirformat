"builtin.module"() ({
  "emitc.include"() <{include = "myheader.h"}> : () -> () loc("<stdin>":2:3)
  "emitc.include"() <{include = "myheader.h", is_standard_include}> : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> (), sym_name = "test_include"}> ({
    "emitc.include"() <{include = "myheader.h"}> : () -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = () -> (), sym_name = "test_foo_print"}> ({
    %15 = "emitc.call_opaque"() <{args = [dense<[0, 1]> : tensor<2xi32>], callee = "foo::constant"}> : () -> i32 loc("<stdin>":9:11)
    %16 = "emitc.call_opaque"(%15) <{args = [dense<[0, 1]> : tensor<2xi32>, 0 : index], callee = "foo::op_and_attr"}> : (i32) -> i32 loc("<stdin>":10:11)
    %17 = "emitc.call_opaque"(%16) <{args = [0 : index, dense<[0, 1]> : tensor<2xi32>], callee = "foo::op_and_attr"}> : (i32) -> i32 loc("<stdin>":11:11)
    "emitc.call_opaque"(%17) <{callee = "foo::print"}> : (i32) -> () loc("<stdin>":12:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (i32) -> i32, sym_name = "test_single_return"}> ({
  ^bb0(%arg8: i32 loc("<stdin>":16:8)):
    "func.return"(%arg8) : (i32) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = () -> (i32, i32), sym_name = "test_multiple_return"}> ({
    %13:2 = "emitc.call_opaque"() <{callee = "foo::blah"}> : () -> (i32, i32) loc("<stdin>":20:13)
    %14 = "func.call"(%13#0) <{callee = @test_single_return}> : (i32) -> i32 loc("<stdin>":21:11)
    "func.return"(%14, %13#1) : (i32, i32) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":19:3)
  "func.func"() <{function_type = () -> (), sym_name = "test_float"}> ({
    %12 = "emitc.call_opaque"() <{args = [dense<[0.000000e+00, 1.000000e+00]> : tensor<2xf32>], callee = "foo::constant"}> : () -> f32 loc("<stdin>":25:11)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":24:3)
  "func.func"() <{function_type = () -> (), sym_name = "test_uint"}> ({
    %10 = "emitc.call_opaque"() <{args = [dense<[0, 1]> : tensor<2xui32>], callee = "foo::constant"}> : () -> ui32 loc("<stdin>":29:11)
    %11 = "emitc.call_opaque"() <{args = [dense<[0, 1]> : tensor<2xui64>], callee = "foo::constant"}> : () -> ui64 loc("<stdin>":30:11)
    "func.return"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (i64) -> i64, sym_name = "test_plus_int"}> ({
  ^bb0(%arg7: i64 loc("<stdin>":34:8)):
    %9 = "emitc.call_opaque"(%arg7, %arg7) <{args = [0 : index, 1 : index], callee = "mhlo::add"}> : (i64, i64) -> i64 loc("<stdin>":35:10)
    "func.return"(%9) : (i64) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":33:3)
  "func.func"() <{function_type = (tensor<2xf64>) -> tensor<2xf32>, sym_name = "mixed_types"}> ({
  ^bb0(%arg6: tensor<2xf64> loc("<stdin>":39:8)):
    %8 = "emitc.call_opaque"(%arg6) <{args = [0 : index], callee = "foo::mixed_types"}> : (tensor<2xf64>) -> tensor<2xf32> loc("<stdin>":40:10)
    "func.return"(%8) : (tensor<2xf32>) -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":38:3)
  "func.func"() <{function_type = (tensor<ui32>) -> tensor<ui64>, sym_name = "mhlo_convert"}> ({
  ^bb0(%arg5: tensor<ui32> loc("<stdin>":44:8)):
    %7 = "emitc.call_opaque"(%arg5) <{args = [0 : index], callee = "mhlo::convert"}> : (tensor<ui32>) -> tensor<ui64> loc("<stdin>":45:10)
    "func.return"(%7) : (tensor<ui64>) -> () loc("<stdin>":46:5)
  }) : () -> () loc("<stdin>":43:3)
  "func.func"() <{function_type = (!emitc.opaque<"bool">, !emitc.opaque<"char">) -> !emitc.opaque<"status_t">, sym_name = "opaque_types"}> ({
  ^bb0(%arg3: !emitc.opaque<"bool"> loc("<stdin>":49:8), %arg4: !emitc.opaque<"char"> loc("<stdin>":49:38)):
    %4 = "emitc.call_opaque"(%arg3, %arg4) <{callee = "a"}> : (!emitc.opaque<"bool">, !emitc.opaque<"char">) -> !emitc.opaque<"int"> loc("<stdin>":50:10)
    %5 = "emitc.call_opaque"(%4) <{callee = "b"}> : (!emitc.opaque<"int">) -> !emitc.opaque<"char"> loc("<stdin>":51:10)
    %6 = "emitc.call_opaque"(%4, %5) <{callee = "c"}> : (!emitc.opaque<"int">, !emitc.opaque<"char">) -> !emitc.opaque<"status_t"> loc("<stdin>":52:10)
    "func.return"(%6) : (!emitc.opaque<"status_t">) -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":48:3)
  "func.func"() <{function_type = () -> (), sym_name = "address_of"}> ({
    %2 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32> loc("<stdin>":56:10)
    %3 = "emitc.address_of"(%2) : (!emitc.lvalue<i32>) -> !emitc.ptr<i32> loc("<stdin>":57:10)
    "func.return"() : () -> () loc("<stdin>":58:5)
  }) : () -> () loc("<stdin>":55:3)
  "func.func"() <{function_type = (!emitc.ptr<i32>) -> (), sym_name = "dereference"}> ({
  ^bb0(%arg2: !emitc.ptr<i32> loc("<stdin>":61:8)):
    %0 = "emitc.dereference"(%arg2) : (!emitc.ptr<i32>) -> !emitc.lvalue<i32> loc("<stdin>":62:10)
    %1 = "emitc.load"(%0) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":63:10)
    "func.return"() : () -> () loc("<stdin>":64:5)
  }) : () -> () loc("<stdin>":60:3)
  "func.func"() <{function_type = (!emitc.array<3xi32>, !emitc.array<10x20xf32>) -> (), sym_name = "array_type"}> ({
  ^bb0(%arg0: !emitc.array<3xi32> loc("<stdin>":67:8), %arg1: !emitc.array<10x20xf32> loc("<stdin>":67:36)):
    "func.return"() : () -> () loc("<stdin>":68:5)
  }) : () -> () loc("<stdin>":66:3)
  "func.func"() <{function_type = () -> (), sym_name = "call_opaque_with_template_arg"}> ({
    "emitc.call_opaque"() <{callee = "init_tile", template_args = [512 : index]}> : () -> () loc("<stdin>":71:5)
    "func.return"() : () -> () loc("<stdin>":72:5)
  }) : () -> () loc("<stdin>":70:3)
}) : () -> () loc("<stdin>":1:1)
