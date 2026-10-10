"builtin.module"() ({
  "func.func"() <{function_type = () -> f32, res_attrs = [{test.erase_this_result}], sym_name = "f", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (f32, f32), res_attrs = [{test.erase_this_result}, {test.A}], sym_name = "f", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (f32, f32), res_attrs = [{test.A}, {test.erase_this_result}], sym_name = "f", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (f32, f32, f32), res_attrs = [{test.A}, {test.erase_this_result}, {test.B}], sym_name = "f", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (f32, f32, f32, f32), res_attrs = [{test.A}, {test.erase_this_result}, {test.erase_this_result}, {test.B}], sym_name = "f", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (f32, f32, f32, f32, f32), res_attrs = [{test.A}, {test.erase_this_result}, {test.B}, {test.erase_this_result}, {test.C}], sym_name = "f", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (tensor<1xf32>, f32, tensor<2xf32>, f32, tensor<3xf32>), res_attrs = [{}, {test.erase_this_result}, {}, {test.erase_this_result}, {}], sym_name = "f", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "llvm_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

