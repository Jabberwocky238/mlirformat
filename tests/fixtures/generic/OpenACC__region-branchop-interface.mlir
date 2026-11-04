"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "last_mod_openacc_parallel"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "memref.store"(%0, %arg0) {tag_name = "parallel_region"} : (f32, memref<f32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    %1 = "memref.load"(%arg0) {tag = "acc_parallel_after"} : (memref<f32>) -> f32
    "func.return"(%arg0) {tag = "acc_parallel_return"} : (memref<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "last_mod_openacc_serial"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "memref.store"(%0, %arg0) {tag_name = "serial_region"} : (f32, memref<f32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    %1 = "memref.load"(%arg0) {tag = "acc_serial_after"} : (memref<f32>) -> f32
    "func.return"(%arg0) {tag = "acc_serial_return"} : (memref<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "last_mod_openacc_kernels"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "memref.store"(%0, %arg0) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %1 = "memref.load"(%arg0) {tag = "acc_kernels_before"} : (memref<f32>) -> f32
    "acc.kernels"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "acc.terminator"() : () -> ()
    }) : () -> ()
    %2 = "memref.load"(%arg0) {tag = "acc_kernels_after"} : (memref<f32>) -> f32
    "func.return"(%arg0) : (memref<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, memref<f32>) -> memref<f32>, sym_name = "last_mod_openacc_data"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: memref<f32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "memref.store"(%0, %arg0) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %1 = "memref.load"(%arg0) {tag = "acc_data_before"} : (memref<f32>) -> f32
    "acc.data"() <{defaultAttr = #acc<defaultvalue none>, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "acc.terminator"() : () -> ()
    }) : () -> ()
    %2 = "memref.load"(%arg0) {tag = "acc_data_after"} : (memref<f32>) -> f32
    "func.return"(%arg0) : (memref<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, memref<f32>) -> memref<f32>, sym_name = "last_mod_openacc_host_data"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: memref<f32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "memref.store"(%0, %arg0) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %1 = "memref.load"(%arg0) {tag = "acc_host_before"} : (memref<f32>) -> f32
    %2 = "acc.use_device"(%arg1) <{dataClause = #acc<data_clause acc_use_device>, implicit = false, modifiers = #acc<data_clause_modifier none>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, structured = true, varType = tensor<f32>}> : (memref<f32>) -> memref<f32>
    "acc.host_data"(%2) <{operandSegmentSizes = array<i32: 0, 1>}> ({
      "acc.terminator"() : () -> ()
    }) : (memref<f32>) -> ()
    %3 = "memref.load"(%arg0) {tag = "acc_host_after"} : (memref<f32>) -> f32
    "func.return"(%arg0) : (memref<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "last_mod_openacc_loop"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "memref.store"(%0, %arg0) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %1 = "memref.load"(%arg0) {tag = "acc_loop_before"} : (memref<f32>) -> f32
    %2 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    "acc.loop"(%3, %4, %3) <{auto_ = [#acc.device_type<none>], operandSegmentSizes = array<i32: 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg1: i32):
      "memref.store"(%2, %arg0) {tag_name = "loop_region"} : (f32, memref<f32>) -> ()
      %7 = "memref.load"(%arg0) {tag = "acc_loop_inside"} : (memref<f32>) -> f32
      "acc.yield"() : () -> ()
    }) : (i32, i32, i32) -> ()
    %5 = "memref.load"(%arg0) {tag = "acc_loop_after"} : (memref<f32>) -> f32
    "memref.store"(%0, %arg0) {tag_name = "post_loop"} : (f32, memref<f32>) -> ()
    %6 = "memref.load"(%arg0) {tag = "acc_loop_post"} : (memref<f32>) -> f32
    "func.return"(%arg0) {tag = "acc_loop_return"} : (memref<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "last_mod_openacc_loop_unstructured"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%0, %arg0) {tag_name = "pre"} : (f32, memref<f32>) -> ()
    %2 = "memref.load"(%arg0) {tag = "acc_loop_unstructured_before"} : (memref<f32>) -> f32
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %5 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    "acc.loop"() <{auto_ = [#acc.device_type<none>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, unstructured}> ({
      "cf.br"(%3)[^bb1] : (i32) -> ()
    ^bb1(%7: i32):  // 2 preds: ^bb0, ^bb2
      %8 = "arith.cmpi"(%7, %4) <{predicate = 0 : i64}> : (i32, i32) -> i1
      "cf.cond_br"(%8)[^bb3, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb2:  // pred: ^bb1
      %9 = "arith.addi"(%7, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %10 = "arith.cmpi"(%9, %5) <{predicate = 0 : i64}> : (i32, i32) -> i1
      "cf.cond_br"(%10, %9)[^bb4, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (i1, i32) -> ()
    ^bb3:  // pred: ^bb1
      "memref.store"(%1, %arg0) {tag_name = "loop_unstructured_early"} : (f32, memref<f32>) -> ()
      "acc.yield"() : () -> ()
    ^bb4:  // pred: ^bb2
      "memref.store"(%1, %arg0) {tag_name = "loop_unstructured_normal"} : (f32, memref<f32>) -> ()
      "acc.yield"() : () -> ()
    }) : () -> ()
    %6 = "memref.load"(%arg0) {tag = "acc_loop_unstructured_after"} : (memref<f32>) -> f32
    "func.return"(%arg0) : (memref<f32>) -> ()
  }) : () -> ()
}) : () -> ()

