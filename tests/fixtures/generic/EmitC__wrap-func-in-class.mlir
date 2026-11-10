"builtin.module"() ({
  "emitc.func"() <{function_type = (!emitc.array<1xf32>) -> (), sym_name = "foo"}> ({
  ^bb0(%arg0: !emitc.array<1xf32>):
    "emitc.call_opaque"(%arg0) <{callee = "bar"}> : (!emitc.array<1xf32>) -> ()
    "emitc.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "emitc.func"() <{arg_attrs = [{emitc.name_hint = "another_feature"}, {emitc.name_hint = "some_feature"}, {emitc.name_hint = "output_0"}], function_type = (!emitc.array<1xf32>, !emitc.array<1xf32>, !emitc.array<1xf32>) -> (), sym_name = "model"}> ({
  ^bb0(%arg0: !emitc.array<1xf32>, %arg1: !emitc.array<1xf32>, %arg2: !emitc.array<1xf32>):
    %0 = "emitc.constant"() <{value = 0 : index}> : () -> !emitc.size_t
    %1 = "emitc.subscript"(%arg1, %0) : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
    %2 = "emitc.load"(%1) : (!emitc.lvalue<f32>) -> f32
    %3 = "emitc.subscript"(%arg0, %0) : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
    %4 = "emitc.load"(%3) : (!emitc.lvalue<f32>) -> f32
    %5 = "emitc.add"(%2, %4) : (f32, f32) -> f32
    %6 = "emitc.subscript"(%arg2, %0) : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
    "emitc.assign"(%6, %5) : (!emitc.lvalue<f32>, f32) -> ()
    "emitc.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "emitc.global"() <{const_specifier, initial_value = dense<0> : tensor<1xi8>, static_specifier, sym_name = "global_arr", type = !emitc.array<1xi8>}> : () -> ()
  "emitc.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    %0 = "emitc.get_global"() <{name = @global_arr}> : () -> !emitc.array<1xi8>
    "emitc.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "emitc.global"() <{const_specifier, initial_value = dense<0> : tensor<1xi8>, static_specifier, sym_name = "global_arr", type = !emitc.array<1xi8>}> : () -> ()
  "emitc.global"() <{const_specifier, initial_value = dense<0> : tensor<1xi8>, static_specifier, sym_name = "global_arr2", type = !emitc.array<1xi8>}> : () -> ()
  "emitc.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    %0 = "emitc.get_global"() <{name = @global_arr}> : () -> !emitc.array<1xi8>
    "emitc.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "emitc.global"() <{const_specifier, initial_value = dense<0> : tensor<1xi8>, static_specifier, sym_name = "global_arr1", type = !emitc.array<1xi8>}> : () -> ()
  "emitc.global"() <{const_specifier, initial_value = dense<0> : tensor<1xi8>, static_specifier, sym_name = "global_arr2", type = !emitc.array<1xi8>}> : () -> ()
  "emitc.global"() <{const_specifier, initial_value = dense<0> : tensor<1xi8>, static_specifier, sym_name = "global_arr3", type = !emitc.array<1xi8>}> : () -> ()
  "emitc.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    %1 = "emitc.get_global"() <{name = @global_arr1}> : () -> !emitc.array<1xi8>
    "emitc.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = () -> (), sym_name = "bar"}> ({
    %0 = "emitc.get_global"() <{name = @global_arr2}> : () -> !emitc.array<1xi8>
    "emitc.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "emitc.global"() <{const_specifier, initial_value = dense<0> : tensor<1xi8>, static_specifier, sym_name = "global_arr", type = !emitc.array<1xi8>}> : () -> ()
  "emitc.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    %1 = "emitc.get_global"() <{name = @global_arr}> : () -> !emitc.array<1xi8>
    "emitc.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = () -> (), sym_name = "bar"}> ({
    %0 = "emitc.get_global"() <{name = @global_arr}> : () -> !emitc.array<1xi8>
    "emitc.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "emitc.global"() <{const_specifier, initial_value = dense<0> : tensor<1xi8>, static_specifier, sym_name = "global_arr", type = !emitc.array<1xi8>}> : () -> ()
  "emitc.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    %0 = "emitc.get_global"() <{name = @global_arr}> : () -> !emitc.array<1xi8>
    %1 = "emitc.get_global"() <{name = @global_arr}> : () -> !emitc.array<1xi8>
    "emitc.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

