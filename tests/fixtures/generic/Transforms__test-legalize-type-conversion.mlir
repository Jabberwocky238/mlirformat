"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> (), sym_name = "test_valid_arg_materialization"}> ({
  ^bb0(%arg0: i64):
    "foo.return"(%arg0) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_transitive_use_materialization"}> ({
    %0 = "test.another_type_producer"() : () -> f32
    "foo.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_valid_result_legalization"}> ({
    %0 = "test.type_producer"() : () -> f32
    "foo.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_signature_conversion_undo"}> ({
    "test.signature_conversion_undo"() ({
    ^bb0(%arg0: f32):
      "test.type_consumer"(%arg0) : (f32) -> ()
      "test.return"(%arg0) : (f32) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_block_argument_not_converted"}> ({
    "test.unsupported_block_arg_type"() ({
    ^bb0(%arg0: index):
      "test.return"(%arg0) : (index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "recursive_type_conversion"}> ({
    %0 = "test.type_producer"() : () -> !test.test_rec<something, test_rec<something>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "unsupported_func_op_interface", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_signature_conversion_no_converter"}> ({
    "test.signature_conversion_no_converter"() ({
    ^bb0(%arg0: f32):
      "test.replace_with_legal_op"(%arg0) : (f32) -> ()
      "test.return"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, i1) -> (), sym_name = "test_unstructured_cf_conversion"}> ({
  ^bb0(%arg0: f32, %arg1: i1):
    "test.foo"(%arg0) : (f32) -> ()
    "cf.br"(%arg0)[^bb1] : (f32) -> ()
  ^bb1(%0: f32):  // 2 preds: ^bb0, ^bb1
    "cf.cond_br"(%arg1, %0, %0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, f32, f32) -> ()
  ^bb2(%1: f32):  // pred: ^bb1
    "test.bar"(%1) : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "cuda_events"}> ({
    "gpu.func"() <{function_type = (memref<?xi32>, i32) -> (), kernel, workgroup_attributions = 1 : i64}> ({
    ^bb0(%arg0: memref<?xi32>, %arg1: i32, %arg2: memref<512xi32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "memref.load"(%arg0, %0) : (memref<?xi32>, index) -> i32
      "memref.store"(%1, %arg0, %0) : (i32, memref<?xi32>, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "func_with_workgroup_args"} : () -> ()
  }) : () -> ()
}) : () -> ()

