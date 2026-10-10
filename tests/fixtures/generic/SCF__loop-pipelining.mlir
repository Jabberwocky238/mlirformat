"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "simple_pipeline"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index):
      %4 = "memref.load"(%arg0, %arg2) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %5 = "arith.addf"(%4, %3) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      "memref.store"(%5, %arg1, %arg2) {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) {__test_pipelining_loop__} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "iteration_lt_stage"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index):
      %4 = "memref.load"(%arg0, %arg2) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %5 = "arith.addf"(%4, %3) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 3 : i64} : (f32, f32) -> f32
      "memref.store"(%5, %arg1, %arg2) {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 3 : i64} : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) {__test_pipelining_loop__} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "simple_pipeline_region"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index):
      %4 = "scf.execute_region"() ({
        %7 = "memref.load"(%arg0, %arg2) : (memref<?xf32>, index) -> f32
        "scf.yield"(%7) : (f32) -> ()
      }) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : () -> f32
      %5 = "scf.execute_region"() ({
        %6 = "arith.addf"(%4, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.yield"(%6) : (f32) -> ()
      }) {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : () -> f32
      "memref.store"(%5, %arg1, %arg2) {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) {__test_pipelining_loop__} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "simple_pipeline_step"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 3 : index}> : () -> index
    %2 = "arith.constant"() <{value = 11 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index):
      %4 = "memref.load"(%arg0, %arg2) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %5 = "arith.addf"(%4, %3) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 2 : i64} : (f32, f32) -> f32
      "memref.store"(%5, %arg1, %arg2) {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 2 : i64} : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) {__test_pipelining_loop__} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "three_stage"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index):
      %4 = "memref.load"(%arg0, %arg2) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %5 = "arith.addf"(%4, %3) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      "memref.store"(%5, %arg1, %arg2) {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 2 : i64} : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) {__test_pipelining_loop__} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "long_liverange"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index):
      %4 = "memref.load"(%arg0, %arg2) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %5 = "arith.addf"(%4, %3) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 4 : i64} : (f32, f32) -> f32
      "memref.store"(%5, %arg1, %arg2) {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 4 : i64} : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) {__test_pipelining_loop__} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "multiple_uses"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index):
      %4 = "memref.load"(%arg0, %arg2) {__test_pipelining_op_order__ = 3 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %5 = "arith.addf"(%4, %3) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      %6 = "arith.mulf"(%5, %4) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 2 : i64} : (f32, f32) -> f32
      "memref.store"(%6, %arg1, %arg2) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 3 : i64} : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) {__test_pipelining_loop__} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "region_multiple_uses"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index):
      %4 = "memref.load"(%arg0, %arg2) {__test_pipelining_op_order__ = 3 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %5 = "arith.addf"(%4, %3) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      %6 = "scf.execute_region"() ({
        %7 = "arith.mulf"(%5, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.yield"(%7) : (f32) -> ()
      }) {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 2 : i64} : () -> f32
      "memref.store"(%6, %arg1, %arg2) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 3 : i64} : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) {__test_pipelining_loop__} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "loop_carried"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "scf.for"(%0, %2, %1, %3) ({
    ^bb0(%arg2: index, %arg3: f32):
      %5 = "memref.load"(%arg0, %arg2) {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %6 = "arith.addf"(%5, %arg3) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      "scf.yield"(%6) : (f32) -> ()
    }) {__test_pipelining_loop__} : (index, index, index, f32) -> f32
    "memref.store"(%4, %arg1, %0) : (f32, memref<?xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> f32, sym_name = "backedge_different_stage"}> ({
  ^bb0(%arg0: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %4 = "scf.for"(%0, %2, %1, %3) ({
    ^bb0(%arg1: index, %arg2: f32):
      %5 = "memref.load"(%arg0, %arg1) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %6 = "arith.addf"(%5, %arg2) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      %7 = "arith.mulf"(%3, %6) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 2 : i64} : (f32, f32) -> f32
      "scf.yield"(%7) : (f32) -> ()
    }) {__test_pipelining_loop__} : (index, index, index, f32) -> f32
    "func.return"(%4) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> f32, sym_name = "region_backedge_different_stage"}> ({
  ^bb0(%arg0: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %4 = "scf.for"(%0, %2, %1, %3) ({
    ^bb0(%arg1: index, %arg2: f32):
      %5 = "scf.execute_region"() ({
        %9 = "memref.load"(%arg0, %arg1) : (memref<?xf32>, index) -> f32
        "scf.yield"(%9) : (f32) -> ()
      }) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : () -> f32
      %6 = "scf.execute_region"() ({
        %8 = "arith.addf"(%5, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.yield"(%8) : (f32) -> ()
      }) {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : () -> f32
      %7 = "arith.mulf"(%3, %6) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 2 : i64} : (f32, f32) -> f32
      "scf.yield"(%7) : (f32) -> ()
    }) {__test_pipelining_loop__} : (index, index, index, f32) -> f32
    "func.return"(%4) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> f32, sym_name = "backedge_same_stage"}> ({
  ^bb0(%arg0: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %4 = "scf.for"(%0, %2, %1, %3) ({
    ^bb0(%arg1: index, %arg2: f32):
      %5 = "memref.load"(%arg0, %arg1) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %6 = "arith.addf"(%5, %arg2) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      %7 = "arith.mulf"(%3, %6) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      "scf.yield"(%7) : (f32) -> ()
    }) {__test_pipelining_loop__} : (index, index, index, f32) -> f32
    "func.return"(%4) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0)>
#map1 = affine_map<(d0) -> (d0 mod 2)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>, memref<?xf32>, f32) -> (), sym_name = "pipeline_op_with_region"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>, %arg2: memref<?xf32>, %arg3: f32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x8xf32>
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x8xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg4: index):
      %5 = "memref.subview"(%arg0, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 8>, static_strides = array<i64: 1>}> {__test_pipelining_op_order__ = 3 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> memref<8xf32, #map>
      %6 = "memref.subview"(%arg1, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 8>, static_strides = array<i64: 1>}> {__test_pipelining_op_order__ = 4 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> memref<8xf32, #map>
      %7 = "affine.apply"(%arg4) <{map = #map1}> {__test_pipelining_op_order__ = 5 : i64, __test_pipelining_stage__ = 0 : i64} : (index) -> index
      %8 = "memref.subview"(%3, %7) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 1, 8>, static_strides = array<i64: 1, 1>}> {__test_pipelining_op_order__ = 6 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<2x8xf32>, index) -> memref<8xf32, #map>
      %9 = "memref.subview"(%4, %7) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 1, 8>, static_strides = array<i64: 1, 1>}> {__test_pipelining_op_order__ = 7 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<2x8xf32>, index) -> memref<8xf32, #map>
      "memref.copy"(%5, %8) {__test_pipelining_op_order__ = 8 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<8xf32, #map>, memref<8xf32, #map>) -> ()
      "memref.copy"(%6, %9) {__test_pipelining_op_order__ = 9 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<8xf32, #map>, memref<8xf32, #map>) -> ()
      %10 = "memref.subview"(%arg2, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 8>, static_strides = array<i64: 1>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : (memref<?xf32>, index) -> memref<8xf32, #map>
      %11 = "arith.addf"(%arg3, %arg3) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      "linalg.generic"(%8, %9, %11, %10) <{indexing_maps = [#map2, #map2, #map3, #map2], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
      ^bb0(%arg5: f32, %arg6: f32, %arg7: f32, %arg8: f32):
        %12 = "arith.addf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %13 = "arith.addf"(%12, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %14 = "arith.addf"(%11, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %15 = "arith.addf"(%arg7, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%15) : (f32) -> ()
      }) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 1 : i64} : (memref<8xf32, #map>, memref<8xf32, #map>, f32, memref<8xf32, #map>) -> ()
      "scf.yield"() : () -> ()
    }) {__test_pipelining_loop__} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> f32, sym_name = "backedge_mix_order"}> ({
  ^bb0(%arg0: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %4 = "scf.for"(%0, %2, %1, %3) ({
    ^bb0(%arg1: index, %arg2: f32):
      %5 = "memref.load"(%arg0, %arg1) {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %6 = "arith.mulf"(%arg2, %5) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      %7 = "arith.addi"(%arg1, %1) <{overflowFlags = #arith.overflow<none>}> {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : (index, index) -> index
      %8 = "memref.load"(%arg0, %7) {__test_pipelining_op_order__ = 3 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %9 = "arith.mulf"(%8, %6) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 4 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      "scf.yield"(%9) : (f32) -> ()
    }) {__test_pipelining_loop__} : (index, index, index, f32) -> f32
    "func.return"(%4) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "distance_1_use"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "scf.for"(%0, %2, %1, %0) ({
    ^bb0(%arg2: index, %arg3: index):
      %5 = "memref.load"(%arg0, %arg3) {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %6 = "arith.addi"(%arg3, %1) <{overflowFlags = #arith.overflow<none>}> {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 0 : i64} : (index, index) -> index
      "memref.store"(%5, %arg1, %arg3) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 2 : i64} : (f32, memref<?xf32>, index) -> ()
      "scf.yield"(%6) : (index) -> ()
    }) {__test_pipelining_loop__} : (index, index, index, index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>, index) -> (), sym_name = "stage_0_value_escape"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %3 = "scf.for"(%0, %arg2, %1, %2) ({
    ^bb0(%arg3: index, %arg4: f32):
      %4 = "memref.load"(%arg0, %arg3) {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %5 = "arith.addf"(%4, %arg4) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      "memref.store"(%5, %arg1, %0) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 2 : i64} : (f32, memref<?xf32>, index) -> ()
      "scf.yield"(%5) : (f32) -> ()
    }) {__test_pipelining_loop__} : (index, index, index, f32) -> f32
    "memref.store"(%3, %arg1, %1) : (f32, memref<?xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>, index, index, index) -> (), sym_name = "dynamic_loop"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "scf.for"(%arg2, %arg3, %arg4) ({
    ^bb0(%arg5: index):
      %1 = "memref.load"(%arg0, %arg5) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %2 = "arith.addf"(%1, %0) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      "memref.store"(%2, %arg1, %arg5) {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 2 : i64} : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) {__test_pipelining_loop__} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>, index, index, index) -> (), sym_name = "dynamic_loop_result"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 3.300000e+01 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "scf.for"(%arg2, %arg3, %arg4, %0) ({
    ^bb0(%arg5: index, %arg6: f32):
      %4 = "memref.load"(%arg0, %arg5) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %5 = "arith.addf"(%4, %arg6) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      %6 = "arith.mulf"(%5, %1) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      "scf.yield"(%6) : (f32) -> ()
    }) {__test_pipelining_loop__} : (index, index, index, f32) -> f32
    "memref.store"(%3, %arg1, %2) : (f32, memref<?xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> f32, sym_name = "yield_constant_loop"}> ({
  ^bb0(%arg0: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %5 = "scf.for"(%0, %2, %1, %4) ({
    ^bb0(%arg1: index, %arg2: f32):
      %6 = "memref.load"(%arg0, %arg1) {__test_pipelining_op_order__ = 3 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %7 = "arith.addf"(%6, %arg2) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      %8 = "arith.mulf"(%3, %7) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      "memref.store"(%8, %arg0, %arg1) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, memref<?xf32>, index) -> ()
      "scf.yield"(%3) : (f32) -> ()
    }) {__test_pipelining_loop__} : (index, index, index, f32) -> f32
    "func.return"(%5) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "invalid_schedule"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index):
      %4 = "memref.load"(%arg0, %arg2) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %5 = "arith.addf"(%4, %3) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 2 : i64} : (f32, f32) -> f32
      "memref.store"(%5, %arg1, %arg2) {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) {__test_pipelining_loop__} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "invalid_schedule2"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "scf.for"(%0, %2, %1, %0) ({
    ^bb0(%arg2: index, %arg3: index):
      %5 = "memref.load"(%arg0, %arg3) {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %6 = "arith.addi"(%arg3, %1) <{overflowFlags = #arith.overflow<none>}> {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : (index, index) -> index
      "memref.store"(%5, %arg1, %arg3) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 2 : i64} : (f32, memref<?xf32>, index) -> ()
      "scf.yield"(%6) : (index) -> ()
    }) {__test_pipelining_loop__} : (index, index, index, index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>, index) -> (), sym_name = "invalid_schedule3"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "scf.for"(%0, %2, %1, %0) ({
    ^bb0(%arg3: index, %arg4: index):
      %4 = "arith.cmpi"(%arg2, %2) <{predicate = 2 : i64}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 0 : i64} : (index, index) -> i1
      %5 = "scf.if"(%4) ({
        %8 = "arith.addi"(%arg4, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "scf.yield"(%8) : (index) -> ()
      }, {
        "scf.yield"(%arg4) : (index) -> ()
      }) {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 0 : i64} : (i1) -> index
      %6 = "memref.load"(%arg0, %5) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %7 = "arith.addi"(%5, %1) <{overflowFlags = #arith.overflow<none>}> {__test_pipelining_op_order__ = 3 : i64, __test_pipelining_stage__ = 1 : i64} : (index, index) -> index
      "memref.store"(%6, %arg1, %5) {__test_pipelining_op_order__ = 4 : i64, __test_pipelining_stage__ = 2 : i64} : (f32, memref<?xf32>, index) -> ()
      "scf.yield"(%7) : (index) -> ()
    }) {__test_pipelining_loop__} : (index, index, index, index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "invalid_loop_step"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "scf.for"(%0, %0, %0) ({
    ^bb0(%arg2: index):
      %2 = "memref.load"(%arg0, %arg2) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32
      %3 = "arith.addf"(%2, %1) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32
      "memref.store"(%3, %arg1, %arg2) {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) {__test_pipelining_loop__} : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

