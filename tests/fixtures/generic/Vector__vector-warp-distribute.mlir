"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<4xf32>, vector<8xf32>) -> (), sym_name = "rewrite_warp_op_to_scf_if"}> ({
  ^bb0(%arg0: index, %arg1: vector<4xf32>, %arg2: vector<8xf32>):
    %0:2 = "gpu.warp_execute_on_lane_0"(%arg0, %arg1, %arg2) <{warp_size = 32 : i64}> ({
    ^bb0(%arg3: vector<128xf32>, %arg4: vector<256xf32>):
      %1 = "some_def"(%arg3) : (vector<128xf32>) -> vector<32xf32>
      %2 = "some_def"(%arg4) : (vector<256xf32>) -> vector<64xf32>
      "gpu.yield"(%1, %2) : (vector<32xf32>, vector<64xf32>) -> ()
    }) : (index, vector<4xf32>, vector<8xf32>) -> (vector<1xf32>, vector<2xf32>)
    "some_use"(%0#0) : (vector<1xf32>) -> ()
    "some_use"(%0#1) : (vector<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<1024xf32>, memref<1024xf32>, memref<1024xf32>, index) -> (), sym_name = "warp"}> ({
  ^bb0(%arg0: index, %arg1: memref<1024xf32>, %arg2: memref<1024xf32>, %arg3: memref<1024xf32>, %arg4: index):
    "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %0 = "memref.subview"(%arg1, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 128>, static_strides = array<i64: 1>}> : (memref<1024xf32>, index) -> memref<128xf32, strided<[1], offset: ?>>
      %1 = "memref.subview"(%arg2, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 128>, static_strides = array<i64: 1>}> : (memref<1024xf32>, index) -> memref<128xf32, strided<[1], offset: ?>>
      %2 = "memref.subview"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 128>, static_strides = array<i64: 1>}> : (memref<1024xf32>, index) -> memref<128xf32, strided<[1], offset: ?>>
      %3 = "arith.constant"() <{value = 0 : index}> : () -> index
      %4 = "arith.constant"() <{value = 32 : index}> : () -> index
      %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %6 = "vector.transfer_read"(%0, %3, %5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<128xf32, strided<[1], offset: ?>>, index, f32) -> vector<32xf32>
      %7 = "vector.transfer_read"(%0, %4, %5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<128xf32, strided<[1], offset: ?>>, index, f32) -> vector<32xf32>
      %8 = "vector.transfer_read"(%1, %3, %5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<128xf32, strided<[1], offset: ?>>, index, f32) -> vector<64xf32>
      %9 = "vector.transfer_read"(%1, %4, %5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<128xf32, strided<[1], offset: ?>>, index, f32) -> vector<64xf32>
      %10 = "arith.addf"(%6, %7) <{fastmath = #arith.fastmath<none>}> : (vector<32xf32>, vector<32xf32>) -> vector<32xf32>
      %11 = "arith.addf"(%8, %9) <{fastmath = #arith.fastmath<none>}> : (vector<64xf32>, vector<64xf32>) -> vector<64xf32>
      "vector.transfer_write"(%10, %2, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<32xf32>, memref<128xf32, strided<[1], offset: ?>>, index) -> ()
      "vector.transfer_write"(%11, %2, %4) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<64xf32>, memref<128xf32, strided<[1], offset: ?>>, index) -> ()
      "gpu.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<1024x1024xf32>, index) -> (), sym_name = "warp_extract"}> ({
  ^bb0(%arg0: index, %arg1: memref<1024x1024xf32>, %arg2: index):
    "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "test.dummy_op"() : () -> vector<1xf32>
      %2 = "test.dummy_op"() : () -> vector<1x1xf32>
      "vector.transfer_write"(%2, %arg1, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x1xf32>, memref<1024x1024xf32>, index, index) -> ()
      "vector.transfer_write"(%1, %arg1, %0, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map1}> : (vector<1xf32>, memref<1024x1024xf32>, index, index) -> ()
      "gpu.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<1024x1024xf32>, index) -> (), sym_name = "warp_extract_4_elems"}> ({
  ^bb0(%arg0: index, %arg1: memref<1024x1024xf32>, %arg2: index):
    "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "test.dummy_op"() : () -> vector<4xf32>
      %2 = "test.dummy_op"() : () -> vector<4x1xf32>
      "vector.transfer_write"(%2, %arg1, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x1xf32>, memref<1024x1024xf32>, index, index) -> ()
      "vector.transfer_write"(%1, %arg1, %0, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map1}> : (vector<4xf32>, memref<1024x1024xf32>, index, index) -> ()
      "gpu.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<1024x1024xf32>, index) -> (), sym_name = "warp_extract_5_elems"}> ({
  ^bb0(%arg0: index, %arg1: memref<1024x1024xf32>, %arg2: index):
    "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "test.dummy_op"() : () -> vector<5xf32>
      %2 = "test.dummy_op"() : () -> vector<5x1xf32>
      "vector.transfer_write"(%2, %arg1, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<5x1xf32>, memref<1024x1024xf32>, index, index) -> ()
      "vector.transfer_write"(%1, %arg1, %0, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map1}> : (vector<5xf32>, memref<1024x1024xf32>, index, index) -> ()
      "gpu.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<1024x1024xf32>, index) -> (), sym_name = "warp_extract_8_elems"}> ({
  ^bb0(%arg0: index, %arg1: memref<1024x1024xf32>, %arg2: index):
    "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "test.dummy_op"() : () -> vector<8xf32>
      %2 = "test.dummy_op"() : () -> vector<8x1xf32>
      "vector.transfer_write"(%2, %arg1, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<8x1xf32>, memref<1024x1024xf32>, index, index) -> ()
      "vector.transfer_write"(%1, %arg1, %0, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map1}> : (vector<8xf32>, memref<1024x1024xf32>, index, index) -> ()
      "gpu.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<1xf32>, sym_name = "warp_dead_result"}> ({
  ^bb0(%arg0: index):
    %0:3 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<32xf32>
      %2 = "some_def"() : () -> vector<32xf32>
      %3 = "some_def"() : () -> vector<32xf32>
      "gpu.yield"(%1, %2, %3) : (vector<32xf32>, vector<32xf32>, vector<32xf32>) -> ()
    }) : (index) -> (vector<1xf32>, vector<1xf32>, vector<1xf32>)
    "func.return"(%0#1) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<4xf32>) -> vector<4xf32>, sym_name = "warp_propagate_operand"}> ({
  ^bb0(%arg0: index, %arg1: vector<4xf32>):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0, %arg1) <{warp_size = 32 : i64}> ({
    ^bb0(%arg2: vector<128xf32>):
      "gpu.yield"(%arg2) : (vector<128xf32>) -> ()
    }) : (index, vector<4xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0 * 2)>
#map1 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<1024xf32>) -> (), sym_name = "warp_propagate_elementwise"}> ({
  ^bb0(%arg0: index, %arg1: memref<1024xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3:2 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %5 = "some_def"() : () -> vector<32xf32>
      %6 = "some_def"() : () -> vector<32xf32>
      %7 = "some_def"() : () -> vector<64xf32>
      %8 = "some_def"() : () -> vector<64xf32>
      %9 = "arith.addf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (vector<32xf32>, vector<32xf32>) -> vector<32xf32>
      %10 = "arith.addf"(%7, %8) <{fastmath = #arith.fastmath<none>}> : (vector<64xf32>, vector<64xf32>) -> vector<64xf32>
      "gpu.yield"(%9, %10) : (vector<32xf32>, vector<64xf32>) -> ()
    }) : (index) -> (vector<1xf32>, vector<2xf32>)
    %4 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
    "vector.transfer_write"(%3#0, %arg1, %arg0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (vector<1xf32>, memref<1024xf32>, index) -> ()
    "vector.transfer_write"(%3#1, %arg1, %4) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (vector<2xf32>, memref<1024xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "warp_propagate_scalar_arith"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> f32
      %2 = "some_def"() : () -> f32
      %3 = "arith.addf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "gpu.yield"(%3) : (f32) -> ()
    }) : (index) -> f32
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, i32) -> f32, sym_name = "warp_propagate_cast"}> ({
  ^bb0(%arg0: index, %arg1: i32):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "arith.sitofp"(%arg1) : (i32) -> f32
      "gpu.yield"(%1) : (f32) -> ()
    }) : (index) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<()[s0] -> (s0 * 2)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<1024xf32>, memref<1024xf32>) -> (), sym_name = "warp_propagate_read"}> ({
  ^bb0(%arg0: index, %arg1: memref<1024xf32>, %arg2: memref<1024xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3:2 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %5 = "vector.transfer_read"(%arg1, %0, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<1024xf32>, index, f32) -> vector<32xf32>
      %6 = "vector.transfer_read"(%arg1, %1, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<1024xf32>, index, f32) -> vector<64xf32>
      "gpu.yield"(%5, %6) : (vector<32xf32>, vector<64xf32>) -> ()
    }) : (index) -> (vector<1xf32>, vector<2xf32>)
    %4 = "affine.apply"(%arg0) <{map = #map1}> : (index) -> index
    "vector.transfer_write"(%3#0, %arg2, %arg0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<1xf32>, memref<1024xf32>, index) -> ()
    "vector.transfer_write"(%3#1, %arg2, %4) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<2xf32>, memref<1024xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "fold_vector_broadcast"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<1xf32>
      %2 = "vector.broadcast"(%1) : (vector<1xf32>) -> vector<32xf32>
      "gpu.yield"(%2) : (vector<32xf32>) -> ()
    }) : (index) -> vector<1xf32>
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (vector<1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "extract_vector_broadcast"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<1xf32>
      %2 = "vector.broadcast"(%1) : (vector<1xf32>) -> vector<64xf32>
      "gpu.yield"(%2) : (vector<64xf32>) -> ()
    }) : (index) -> vector<2xf32>
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "extract_scalar_vector_broadcast"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> f32
      %2 = "vector.broadcast"(%1) : (f32) -> vector<64xf32>
      "gpu.yield"(%2) : (vector<64xf32>) -> ()
    }) : (index) -> vector<2xf32>
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "warp_scf_for"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 128 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %4 = "some_def"() : () -> vector<128xf32>
      %5 = "scf.for"(%2, %0, %1, %4) ({
      ^bb0(%arg1: index, %arg2: vector<128xf32>):
        %6 = "arith.addi"(%arg1, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %7 = "some_def"(%6, %arg2) : (index, vector<128xf32>) -> vector<128xf32>
        "scf.yield"(%7) : (vector<128xf32>) -> ()
      }) : (index, index, index, vector<128xf32>) -> vector<128xf32>
      "gpu.yield"(%5) : (vector<128xf32>) -> ()
    }) : (index) -> vector<4xf32>
    "some_use"(%3) : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "warp_scf_for_use_from_above"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 128 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %4 = "some_def"() : () -> vector<128xf32>
      %5 = "some_def_above"() : () -> vector<128xf32>
      %6 = "scf.for"(%2, %0, %1, %4) ({
      ^bb0(%arg1: index, %arg2: vector<128xf32>):
        %7 = "some_def"(%arg2, %5) : (vector<128xf32>, vector<128xf32>) -> vector<128xf32>
        "scf.yield"(%7) : (vector<128xf32>) -> ()
      }) : (index, index, index, vector<128xf32>) -> vector<128xf32>
      "gpu.yield"(%6) : (vector<128xf32>) -> ()
    }) : (index) -> vector<4xf32>
    "some_use"(%3) : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "warp_scf_for_local_loop_bounds"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "gpu.warp_execute_on_lane_0"(%arg0, %arg1) <{warp_size = 32 : i64}> ({
    ^bb0(%arg2: index):
      %3 = "some_def"() : () -> vector<128xf32>
      %4 = "scf.for"(%1, %arg2, %0, %3) ({
      ^bb0(%arg3: index, %arg4: vector<128xf32>):
        %5 = "some_def"(%arg4) : (vector<128xf32>) -> vector<128xf32>
        "scf.yield"(%5) : (vector<128xf32>) -> ()
      }) : (index, index, index, vector<128xf32>) -> vector<128xf32>
      "gpu.yield"(%4) : (vector<128xf32>) -> ()
    }) : (index, index) -> vector<4xf32>
    "some_use"(%2) : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "warp_scf_for_swap"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 128 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3:2 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %4 = "some_def"() : () -> vector<128xf32>
      %5 = "some_def"() : () -> vector<128xf32>
      %6:2 = "scf.for"(%2, %0, %1, %4, %5) ({
      ^bb0(%arg1: index, %arg2: vector<128xf32>, %arg3: vector<128xf32>):
        %7 = "some_def"(%arg2) : (vector<128xf32>) -> vector<128xf32>
        %8 = "some_def"(%arg3) : (vector<128xf32>) -> vector<128xf32>
        "scf.yield"(%8, %7) : (vector<128xf32>, vector<128xf32>) -> ()
      }) : (index, index, index, vector<128xf32>, vector<128xf32>) -> (vector<128xf32>, vector<128xf32>)
      "gpu.yield"(%6#0, %6#1) : (vector<128xf32>, vector<128xf32>) -> ()
    }) : (index) -> (vector<4xf32>, vector<4xf32>)
    "some_use"(%3#0) : (vector<4xf32>) -> ()
    "some_use"(%3#1) : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "warp_scf_for_swap_no_yield"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 128 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      "scf.for"(%2, %0, %1) ({
      ^bb0(%arg1: index):
        "some_op"() : () -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "gpu.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<1xf32>, sym_name = "warp_scf_for_broadcasted_result"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 128 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %4 = "some_def"() : () -> vector<1xf32>
      %5 = "scf.for"(%2, %0, %1, %4) ({
      ^bb0(%arg1: index, %arg2: vector<1xf32>):
        %6 = "some_op"(%arg2) : (vector<1xf32>) -> vector<1xf32>
        "scf.yield"(%6) : (vector<1xf32>) -> ()
      }) : (index, index, index, vector<1xf32>) -> vector<1xf32>
      "gpu.yield"(%5) : (vector<1xf32>) -> ()
    }) : (index) -> vector<1xf32>
    "func.return"(%3) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<()[s0] -> (s0 * 128 + 128)>
#map2 = affine_map<()[s0] -> (s0 * 4 + 128)>
#map3 = affine_map<()[s0] -> (s0 * 4)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xf32>, memref<?xf32>) -> (), sym_name = "warp_scf_for_multiple_yield"}> ({
  ^bb0(%arg0: index, %arg1: memref<?xf32>, %arg2: memref<?xf32>):
    %0 = "arith.constant"() <{value = 256 : index}> : () -> index
    %1 = "arith.constant"() <{value = 128 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5:3 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %8 = "some_def"() : () -> vector<32xf32>
      %9 = "vector.transfer_read"(%arg2, %3, %4) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf32>, index, f32) -> vector<128xf32>
      %10 = "vector.transfer_read"(%arg2, %1, %4) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf32>, index, f32) -> vector<128xf32>
      %11:2 = "scf.for"(%3, %1, %2, %9, %10) ({
      ^bb0(%arg3: index, %arg4: vector<128xf32>, %arg5: vector<128xf32>):
        %12 = "affine.apply"(%arg3) <{map = #map1}> : (index) -> index
        %13 = "affine.apply"(%arg3) <{map = #map2}> : (index) -> index
        %14 = "vector.transfer_read"(%arg1, %12, %4) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf32>, index, f32) -> vector<128xf32>
        %15 = "vector.transfer_read"(%arg1, %13, %4) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf32>, index, f32) -> vector<128xf32>
        %16 = "arith.addf"(%14, %arg4) <{fastmath = #arith.fastmath<none>}> : (vector<128xf32>, vector<128xf32>) -> vector<128xf32>
        %17 = "arith.addf"(%15, %arg5) <{fastmath = #arith.fastmath<none>}> : (vector<128xf32>, vector<128xf32>) -> vector<128xf32>
        "scf.yield"(%16, %17) : (vector<128xf32>, vector<128xf32>) -> ()
      }) : (index, index, index, vector<128xf32>, vector<128xf32>) -> (vector<128xf32>, vector<128xf32>)
      "gpu.yield"(%8, %11#0, %11#1) : (vector<32xf32>, vector<128xf32>, vector<128xf32>) -> ()
    }) : (index) -> (vector<1xf32>, vector<4xf32>, vector<4xf32>)
    %6 = "affine.apply"(%arg0) <{map = #map3}> : (index) -> index
    "vector.transfer_write"(%5#1, %arg2, %6) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<4xf32>, memref<?xf32>, index) -> ()
    %7 = "affine.apply"(%arg0) <{map = #map2}> : (index) -> index
    "vector.transfer_write"(%5#2, %arg2, %7) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<4xf32>, memref<?xf32>, index) -> ()
    "some_use"(%5#0) : (vector<1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "warp_scf_for_unused_for_result"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 128 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %4 = "some_def"() : () -> vector<128xf32>
      %5 = "some_def"() : () -> vector<128xf32>
      %6:2 = "scf.for"(%2, %0, %1, %4, %5) ({
      ^bb0(%arg1: index, %arg2: vector<128xf32>, %arg3: vector<128xf32>):
        %7 = "arith.addi"(%arg1, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %8 = "some_def"(%arg3, %7) : (vector<128xf32>, index) -> vector<128xf32>
        %9 = "some_def"(%7, %arg2, %8) : (index, vector<128xf32>, vector<128xf32>) -> vector<128xf32>
        "scf.yield"(%9, %8) : (vector<128xf32>, vector<128xf32>) -> ()
      }) : (index, index, index, vector<128xf32>, vector<128xf32>) -> (vector<128xf32>, vector<128xf32>)
      "gpu.yield"(%6#0) : (vector<128xf32>) -> ()
    }) : (index) -> vector<4xf32>
    "some_use"(%3) : (vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "warp_scf_for_swapped_for_results"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 128 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3:3 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %4 = "some_def"() : () -> vector<256xf32>
      %5 = "some_def"() : () -> vector<128xf32>
      %6 = "some_def"() : () -> vector<128xf32>
      %7:3 = "scf.for"(%2, %0, %1, %4, %5, %6) ({
      ^bb0(%arg1: index, %arg2: vector<256xf32>, %arg3: vector<128xf32>, %arg4: vector<128xf32>):
        %8 = "some_def_1"(%arg2) : (vector<256xf32>) -> vector<256xf32>
        %9 = "some_def_2"(%arg3) : (vector<128xf32>) -> vector<128xf32>
        %10 = "some_def_3"(%arg4) : (vector<128xf32>) -> vector<128xf32>
        "scf.yield"(%8, %9, %10) : (vector<256xf32>, vector<128xf32>, vector<128xf32>) -> ()
      }) : (index, index, index, vector<256xf32>, vector<128xf32>, vector<128xf32>) -> (vector<256xf32>, vector<128xf32>, vector<128xf32>)
      "gpu.yield"(%7#2, %7#1, %7#0) : (vector<128xf32>, vector<128xf32>, vector<256xf32>) -> ()
    }) : (index) -> (vector<4xf32>, vector<4xf32>, vector<8xf32>)
    "some_use_1"(%3#0) : (vector<4xf32>) -> ()
    "some_use_2"(%3#1) : (vector<4xf32>) -> ()
    "some_use_3"(%3#2) : (vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> f32, sym_name = "vector_reduction"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<32xf32>
      %2 = "vector.reduction"(%1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<32xf32>) -> f32
      "gpu.yield"(%2) : (f32) -> ()
    }) : (index) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<128xf32>, memref<128xf32>) -> (), sym_name = "warp_distribute"}> ({
  ^bb0(%arg0: index, %arg1: memref<128xf32>, %arg2: memref<128xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 128 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %5 = "arith.constant"() <{value = dense<2.621440e+05> : vector<1xf32>}> : () -> vector<1xf32>
      %6 = "some_def"() : () -> vector<4096xf32>
      %7 = "vector.reduction"(%6, %0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4096xf32>, f32) -> f32
      %8 = "vector.broadcast"(%7) : (f32) -> vector<1xf32>
      %9 = "arith.divf"(%8, %5) <{fastmath = #arith.fastmath<none>}> : (vector<1xf32>, vector<1xf32>) -> vector<1xf32>
      "scf.for"(%1, %3, %2) ({
      ^bb0(%arg3: index):
        %10 = "vector.transfer_read"(%arg1, %arg3, %4) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<128xf32>, index, f32) -> vector<1xf32>
        %11 = "arith.subf"(%10, %9) <{fastmath = #arith.fastmath<none>}> : (vector<1xf32>, vector<1xf32>) -> vector<1xf32>
        "vector.transfer_write"(%11, %arg2, %arg3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<1xf32>, memref<128xf32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "gpu.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
#map1 = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<4x2x32xf32>, memref<f32>) -> (), sym_name = "vector_reduction"}> ({
  ^bb0(%arg0: index, %arg1: memref<4x2x32xf32>, %arg2: memref<f32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %2 = "vector.transfer_read"(%arg1, %0, %0, %0, %1) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (memref<4x2x32xf32>, index, index, index, f32) -> vector<32xf32>
      %3 = "vector.transfer_read"(%arg2, %1) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 0, 1, 0>, permutation_map = #map1}> : (memref<f32>, f32) -> vector<f32>
      %4 = "vector.extract"(%3) <{static_position = array<i64>}> : (vector<f32>) -> f32
      %5 = "vector.reduction"(%2) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<32xf32>) -> f32
      %6 = "arith.addf"(%5, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %7 = "vector.broadcast"(%6) : (f32) -> vector<f32>
      "vector.transfer_write"(%7, %arg2) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 0, 0>, permutation_map = #map1}> : (vector<f32>, memref<f32>) -> ()
      "gpu.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> f32, sym_name = "vector_reduction_large"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<64xf32>
      %2 = "vector.reduction"(%1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<64xf32>) -> f32
      "gpu.yield"(%2) : (f32) -> ()
    }) : (index) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> f32, sym_name = "vector_reduction_acc"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<64xf32>
      %2 = "some_def"() : () -> f32
      %3 = "vector.reduction"(%1, %2) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<64xf32>, f32) -> f32
      "gpu.yield"(%3) : (f32) -> ()
    }) : (index) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (vector<1xf32>, vector<1xf32>), sym_name = "warp_duplicate_yield"}> ({
  ^bb0(%arg0: index):
    %0:2 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<32xf32>
      %2 = "some_def"() : () -> vector<32xf32>
      %3 = "arith.addf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (vector<32xf32>, vector<32xf32>) -> vector<32xf32>
      %4 = "arith.addf"(%1, %1) <{fastmath = #arith.fastmath<none>}> : (vector<32xf32>, vector<32xf32>) -> vector<32xf32>
      "gpu.yield"(%3, %4) : (vector<32xf32>, vector<32xf32>) -> ()
    }) : (index) -> (vector<1xf32>, vector<1xf32>)
    "func.return"(%0#0, %0#1) : (vector<1xf32>, vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<1xf32>, sym_name = "warp_constant"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "arith.constant"() <{value = dense<2.000000e+00> : vector<32xf32>}> : () -> vector<32xf32>
      "gpu.yield"(%1) : (vector<32xf32>) -> ()
    }) : (index) -> vector<1xf32>
    "func.return"(%0) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> f32, sym_name = "vector_extract_1d"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<64xf32>
      %2 = "vector.extract"(%1) <{static_position = array<i64: 9>}> : (vector<64xf32>) -> f32
      "gpu.yield"(%2) : (f32) -> ()
    }) : (index) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<3xf32>, sym_name = "vector_extract_2d"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<5x96xf32>
      %2 = "vector.extract"(%1) <{static_position = array<i64: 2>}> : (vector<5x96xf32>) -> vector<96xf32>
      "gpu.yield"(%2) : (vector<96xf32>) -> ()
    }) : (index) -> vector<3xf32>
    "func.return"(%0) : (vector<3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> f32, sym_name = "vector_extract_2d_broadcast_scalar"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<5x96xf32>
      %2 = "vector.extract"(%1) <{static_position = array<i64: 1, 2>}> : (vector<5x96xf32>) -> f32
      "gpu.yield"(%2) : (f32) -> ()
    }) : (index) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<96xf32>, sym_name = "vector_extract_2d_broadcast"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<5x96xf32>
      %2 = "vector.extract"(%1) <{static_position = array<i64: 2>}> : (vector<5x96xf32>) -> vector<96xf32>
      "gpu.yield"(%2) : (vector<96xf32>) -> ()
    }) : (index) -> vector<96xf32>
    "func.return"(%0) : (vector<96xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<4x96xf32>, sym_name = "vector_extract_3d"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<8x128x96xf32>
      %2 = "vector.extract"(%1) <{static_position = array<i64: 2>}> : (vector<8x128x96xf32>) -> vector<128x96xf32>
      "gpu.yield"(%2) : (vector<128x96xf32>) -> ()
    }) : (index) -> vector<4x96xf32>
    "func.return"(%0) : (vector<4x96xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> f32, sym_name = "vector_extract_0d"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<f32>
      %2 = "vector.extract"(%1) <{static_position = array<i64>}> : (vector<f32>) -> f32
      "gpu.yield"(%2) : (f32) -> ()
    }) : (index) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> f32, sym_name = "vector_extract_1element"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<1xf32>
      %2 = "arith.constant"() <{value = 0 : index}> : () -> index
      %3 = "vector.extract"(%1, %2) <{static_position = array<i64: -9223372036854775808>}> : (vector<1xf32>, index) -> f32
      "gpu.yield"(%3) : (f32) -> ()
    }) : (index) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> f32, sym_name = "vector_extract_1d"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<96xf32>
      %2 = "vector.extract"(%1, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (vector<96xf32>, index) -> f32
      "gpu.yield"(%2) : (f32) -> ()
    }) : (index) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> index, sym_name = "vector_extract_1d_index"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<96xindex>
      %2 = "vector.extract"(%1, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (vector<96xindex>, index) -> index
      "gpu.yield"(%2) : (index) -> ()
    }) : (index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<1x1024xf32>, memref<1x1024xf32>) -> (), sym_name = "lane_dependent_warp_propagate_read"}> ({
  ^bb0(%arg0: index, %arg1: memref<1x1024xf32>, %arg2: memref<1x1024xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %3 = "vector.transfer_read"(%arg1, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<1x1024xf32>, index, index, f32) -> vector<1x32xf32>
      "gpu.yield"(%3) : (vector<1x32xf32>) -> ()
    }) : (index) -> vector<1x1xf32>
    "vector.transfer_write"(%2, %arg2, %0, %arg0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x1xf32>, memref<1x1024xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<32x4x32xf32>) -> vector<1x1x4xf32>, sym_name = "warp_propagate_read_3d"}> ({
  ^bb0(%arg0: index, %arg1: memref<32x4x32xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 1024 : i64}> ({
      %3 = "vector.transfer_read"(%arg1, %0, %0, %0, %1) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (memref<32x4x32xf32>, index, index, index, f32) -> vector<32x4x32xf32>
      "gpu.yield"(%3) : (vector<32x4x32xf32>) -> ()
    }) : (index) -> vector<1x1x4xf32>
    "func.return"(%2) : (vector<1x1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, 0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<32x1xf32>) -> vector<1x4xf32>, sym_name = "warp_propagate_read_broadcast"}> ({
  ^bb0(%arg0: index, %arg1: memref<32x1xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 512 : i64}> ({
      %3 = "vector.transfer_read"(%arg1, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<32x1xf32>, index, index, f32) -> vector<32x64xf32>
      "gpu.yield"(%3) : (vector<32x64xf32>) -> ()
    }) : (index) -> vector<1x4xf32>
    "func.return"(%2) : (vector<1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<1024xf32>) -> vector<1xf32>, sym_name = "dont_duplicate_read"}> ({
  ^bb0(%arg0: index, %arg1: memref<1024xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %3 = "vector.transfer_read"(%arg1, %0, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<1024xf32>, index, f32) -> vector<32xf32>
      "blocking_use"(%3) : (vector<32xf32>) -> ()
      "gpu.yield"(%3) : (vector<32xf32>) -> ()
    }) : (index) -> vector<1xf32>
    "func.return"(%2) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<4xf32>, vector<4xf32>) -> (vector<1xf32>, vector<1xf32>), sym_name = "dedup"}> ({
  ^bb0(%arg0: index, %arg1: vector<4xf32>, %arg2: vector<4xf32>):
    %0:2 = "gpu.warp_execute_on_lane_0"(%arg0, %arg1, %arg2) <{warp_size = 32 : i64}> ({
    ^bb0(%arg3: vector<128xf32>, %arg4: vector<128xf32>):
      %1 = "some_def"(%arg3) : (vector<128xf32>) -> vector<32xf32>
      "gpu.yield"(%1, %1) : (vector<32xf32>, vector<32xf32>) -> ()
    }) : (index, vector<4xf32>, vector<4xf32>) -> (vector<1xf32>, vector<1xf32>)
    "func.return"(%0#0, %0#1) : (vector<1xf32>, vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, f32, vector<f32>, vector<1xf32>, vector<1x1xf32>) -> (f32, vector<f32>, vector<1xf32>, vector<1x1xf32>), sym_name = "warp_execute_has_broadcast_semantics"}> ({
  ^bb0(%arg0: index, %arg1: f32, %arg2: vector<f32>, %arg3: vector<1xf32>, %arg4: vector<1x1xf32>):
    %0:4 = "gpu.warp_execute_on_lane_0"(%arg0, %arg1, %arg2, %arg3, %arg4) <{warp_size = 32 : i64}> ({
    ^bb0(%arg5: f32, %arg6: vector<f32>, %arg7: vector<1xf32>, %arg8: vector<1x1xf32>):
      %1 = "some_def_0"(%arg5) : (f32) -> f32
      %2 = "some_def_1"(%arg6) : (vector<f32>) -> vector<f32>
      %3 = "some_def_1"(%arg7) : (vector<1xf32>) -> vector<1xf32>
      %4 = "some_def_1"(%arg8) : (vector<1x1xf32>) -> vector<1x1xf32>
      "gpu.yield"(%1, %2, %3, %4) : (f32, vector<f32>, vector<1xf32>, vector<1x1xf32>) -> ()
    }) : (index, f32, vector<f32>, vector<1xf32>, vector<1x1xf32>) -> (f32, vector<f32>, vector<1xf32>, vector<1x1xf32>)
    "func.return"(%0#0, %0#1, %0#2, %0#3) : (f32, vector<f32>, vector<1xf32>, vector<1x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<1x64x1xf32>, vector<1x2x128xf32>) -> (vector<1x64x1xf32>, vector<1x2x128xf32>), sym_name = "warp_execute_nd_distribute"}> ({
  ^bb0(%arg0: index, %arg1: vector<1x64x1xf32>, %arg2: vector<1x2x128xf32>):
    %0:2 = "gpu.warp_execute_on_lane_0"(%arg0, %arg1, %arg2) <{warp_size = 32 : i64}> ({
    ^bb0(%arg3: vector<32x64x1xf32>, %arg4: vector<1x64x128xf32>):
      %1 = "some_def_0"(%arg3) : (vector<32x64x1xf32>) -> vector<32x64x1xf32>
      %2 = "some_def_1"(%arg4) : (vector<1x64x128xf32>) -> vector<1x64x128xf32>
      "gpu.yield"(%1, %2) : (vector<32x64x1xf32>, vector<1x64x128xf32>) -> ()
    }) : (index, vector<1x64x1xf32>, vector<1x2x128xf32>) -> (vector<1x64x1xf32>, vector<1x2x128xf32>)
    "func.return"(%0#0, %0#1) : (vector<1x64x1xf32>, vector<1x2x128xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<3xf32>, sym_name = "vector_insert_1d"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<96xf32>
      %2 = "another_def"() : () -> f32
      %3 = "vector.insert"(%2, %1, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (f32, vector<96xf32>, index) -> vector<96xf32>
      "gpu.yield"(%3) : (vector<96xf32>) -> ()
    }) : (index) -> vector<3xf32>
    "func.return"(%0) : (vector<3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<96xf32>, sym_name = "vector_insert_1d_broadcast"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<96xf32>
      %2 = "another_def"() : () -> f32
      %3 = "vector.insert"(%2, %1, %arg1) <{static_position = array<i64: -9223372036854775808>}> : (f32, vector<96xf32>, index) -> vector<96xf32>
      "gpu.yield"(%3) : (vector<96xf32>) -> ()
    }) : (index) -> vector<96xf32>
    "func.return"(%0) : (vector<96xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<f32>, sym_name = "vector_insert_0d"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<f32>
      %2 = "another_def"() : () -> f32
      %3 = "vector.insert"(%2, %1) <{static_position = array<i64>}> : (f32, vector<f32>) -> vector<f32>
      "gpu.yield"(%3) : (vector<f32>) -> ()
    }) : (index) -> vector<f32>
    "func.return"(%0) : (vector<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<3xf32>, sym_name = "vector_insert_1d"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<96xf32>
      %2 = "another_def"() : () -> f32
      %3 = "vector.insert"(%2, %1) <{static_position = array<i64: 76>}> : (f32, vector<96xf32>) -> vector<96xf32>
      "gpu.yield"(%3) : (vector<96xf32>) -> ()
    }) : (index) -> vector<3xf32>
    "func.return"(%0) : (vector<3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<4x3xf32>, sym_name = "vector_insert_2d_distr_src"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<4x96xf32>
      %2 = "another_def"() : () -> vector<96xf32>
      %3 = "vector.insert"(%2, %1) <{static_position = array<i64: 2>}> : (vector<96xf32>, vector<4x96xf32>) -> vector<4x96xf32>
      "gpu.yield"(%3) : (vector<4x96xf32>) -> ()
    }) : (index) -> vector<4x3xf32>
    "func.return"(%0) : (vector<4x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<4x96xf32>, sym_name = "vector_insert_2d_distr_pos"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<128x96xf32>
      %2 = "another_def"() : () -> vector<96xf32>
      %3 = "vector.insert"(%2, %1) <{static_position = array<i64: 79>}> : (vector<96xf32>, vector<128x96xf32>) -> vector<128x96xf32>
      "gpu.yield"(%3) : (vector<128x96xf32>) -> ()
    }) : (index) -> vector<4x96xf32>
    "func.return"(%0) : (vector<4x96xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<4x96xf32>, sym_name = "vector_insert_2d_broadcast"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<4x96xf32>
      %2 = "another_def"() : () -> vector<96xf32>
      %3 = "vector.insert"(%2, %1) <{static_position = array<i64: 2>}> : (vector<96xf32>, vector<4x96xf32>) -> vector<4x96xf32>
      "gpu.yield"(%3) : (vector<4x96xf32>) -> ()
    }) : (index) -> vector<4x96xf32>
    "func.return"(%0) : (vector<4x96xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<24x1xf32>, sym_name = "vector_extract_strided_slice_2d_distr_inner"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<64x32xf32>
      %2 = "vector.extract_strided_slice"(%1) <{offsets = [8], sizes = [24], strides = [1]}> : (vector<64x32xf32>) -> vector<24x32xf32>
      "gpu.yield"(%2) : (vector<24x32xf32>) -> ()
    }) : (index) -> vector<24x1xf32>
    "func.return"(%0) : (vector<24x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<1x8xf32>, sym_name = "vector_extract_strided_slice_2d_distr_outer"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<32x64xf32>
      %2 = "vector.extract_strided_slice"(%1) <{offsets = [0, 12], sizes = [32, 8], strides = [1, 1]}> : (vector<32x64xf32>) -> vector<32x8xf32>
      "gpu.yield"(%2) : (vector<32x8xf32>) -> ()
    }) : (index) -> vector<1x8xf32>
    "func.return"(%0) : (vector<1x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<64x1xf32>, sym_name = "vector_insert_strided_slice_1d_to_2d"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<32xf32>
      %2 = "some_def"() : () -> vector<64x32xf32>
      %3 = "vector.insert_strided_slice"(%1, %2) <{offsets = [18, 0], strides = [1]}> : (vector<32xf32>, vector<64x32xf32>) -> vector<64x32xf32>
      "gpu.yield"(%3) : (vector<64x32xf32>) -> ()
    }) : (index) -> vector<64x1xf32>
    "func.return"(%0) : (vector<64x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<64x1xf32>, sym_name = "vector_insert_strided_slice_2d_to_2d"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<16x32xf32>
      %2 = "some_def"() : () -> vector<64x32xf32>
      %3 = "vector.insert_strided_slice"(%1, %2) <{offsets = [36, 0], strides = [1, 1]}> : (vector<16x32xf32>, vector<64x32xf32>) -> vector<64x32xf32>
      "gpu.yield"(%3) : (vector<64x32xf32>) -> ()
    }) : (index) -> vector<64x1xf32>
    "func.return"(%0) : (vector<64x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x2xindex>, memref<1x4x2xi32>, memref<1x4x1024xf32>) -> vector<2xf32>, sym_name = "transfer_read_prop_operands"}> ({
  ^bb0(%arg0: vector<1x2xindex>, %arg1: memref<1x4x2xi32>, %arg2: memref<1x4x1024xf32>):
    %0 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = dense<0> : vector<1x64xi32>}> : () -> vector<1x64xi32>
    %4 = "arith.constant"() <{value = dense<true> : vector<1x64xi1>}> : () -> vector<1x64xi1>
    %5 = "arith.constant"() <{value = dense<3> : vector<64xindex>}> : () -> vector<64xindex>
    %6 = "arith.constant"() <{value = dense<0> : vector<64xindex>}> : () -> vector<64xindex>
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %8 = "gpu.warp_execute_on_lane_0"(%0, %arg0) <{warp_size = 32 : i64}> ({
    ^bb0(%arg3: vector<1x64xindex>):
      %9 = "vector.gather"(%arg1, %2, %2, %2, %arg3, %4, %3) : (memref<1x4x2xi32>, index, index, index, vector<1x64xindex>, vector<1x64xi1>, vector<1x64xi32>) -> vector<1x64xi32>
      %10 = "vector.extract"(%9) <{static_position = array<i64: 0>}> : (vector<1x64xi32>) -> vector<64xi32>
      %11 = "arith.index_cast"(%10) : (vector<64xi32>) -> vector<64xindex>
      %12 = "vector.extract"(%11, %1) <{static_position = array<i64: -9223372036854775808>}> : (vector<64xindex>, index) -> index
      %13 = "vector.transfer_read"(%arg2, %2, %12, %2, %7) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (memref<1x4x1024xf32>, index, index, index, f32) -> vector<64xf32>
      "gpu.yield"(%13) : (vector<64xf32>) -> ()
    }) : (index, vector<1x2xindex>) -> vector<2xf32>
    "func.return"(%8) : (vector<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "dont_fold_vector_broadcast"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<64xf32>
      %2 = "vector.broadcast"(%1) : (vector<64xf32>) -> vector<1x64xf32>
      "gpu.yield"(%2) : (vector<1x64xf32>) -> ()
    }) : (index) -> vector<1x2xf32>
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (vector<1x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<32x4x32xf32>) -> vector<4xf32>, sym_name = "warp_propagate_shape_cast"}> ({
  ^bb0(%arg0: index, %arg1: memref<32x4x32xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 1024 : i64}> ({
      %3 = "vector.transfer_read"(%arg1, %0, %0, %0, %1) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (memref<32x4x32xf32>, index, index, index, f32) -> vector<32x4x32xf32>
      %4 = "vector.shape_cast"(%3) : (vector<32x4x32xf32>) -> vector<4096xf32>
      "gpu.yield"(%4) : (vector<4096xf32>) -> ()
    }) : (index) -> vector<4xf32>
    "func.return"(%2) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<4096xf32>, index) -> vector<1xf32>, sym_name = "warp_propagate_uniform_transfer_read"}> ({
  ^bb0(%arg0: index, %arg1: memref<4096xf32>, %arg2: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 64 : i64}> ({
      %2 = "vector.transfer_read"(%arg1, %arg2, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<4096xf32>, index, f32) -> vector<1xf32>
      "gpu.yield"(%2) : (vector<1xf32>) -> ()
    }) : (index) -> vector<1xf32>
    "func.return"(%1) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<4096xf32>, index, index) -> (vector<1xf32>, vector<1xf32>), sym_name = "warp_propagate_multi_transfer_read"}> ({
  ^bb0(%arg0: index, %arg1: memref<4096xf32>, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1:2 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 64 : i64}> ({
      %2 = "vector.transfer_read"(%arg1, %arg2, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<4096xf32>, index, f32) -> vector<1xf32>
      "some_use"(%2) : (vector<1xf32>) -> ()
      %3 = "vector.transfer_read"(%arg1, %arg3, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<4096xf32>, index, f32) -> vector<1xf32>
      "gpu.yield"(%2, %3) : (vector<1xf32>, vector<1xf32>) -> ()
    }) : (index) -> (vector<1xf32>, vector<1xf32>)
    "func.return"(%1#0, %1#1) : (vector<1xf32>, vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<4096xf32>, index, index) -> vector<1xf32>, sym_name = "warp_propagate_dead_user_multi_read"}> ({
  ^bb0(%arg0: index, %arg1: memref<4096xf32>, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 64 : i64}> ({
      %2 = "vector.transfer_read"(%arg1, %arg2, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<4096xf32>, index, f32) -> vector<64xf32>
      %3 = "vector.transfer_read"(%arg1, %arg3, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<4096xf32>, index, f32) -> vector<64xf32>
      %4 = "arith.maximumf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (vector<64xf32>, vector<64xf32>) -> vector<64xf32>
      "gpu.yield"(%4) : (vector<64xf32>) -> ()
    }) : (index) -> vector<1xf32>
    "func.return"(%1) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<4096xf32>) -> (), sym_name = "warp_propagate_masked_write"}> ({
  ^bb0(%arg0: index, %arg1: memref<4096xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "mask_def_0"() : () -> vector<4096xi1>
      %2 = "mask_def_1"() : () -> vector<32xi1>
      %3 = "some_def_0"() : () -> vector<4096xf32>
      %4 = "some_def_1"() : () -> vector<32xf32>
      "vector.transfer_write"(%3, %arg1, %0, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 1>, permutation_map = #map}> : (vector<4096xf32>, memref<4096xf32>, index, vector<4096xi1>) -> ()
      "vector.transfer_write"(%4, %arg1, %0, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 1>, permutation_map = #map}> : (vector<32xf32>, memref<4096xf32>, index, vector<32xi1>) -> ()
      "gpu.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<4096x4096xf32>, index) -> (vector<2xf32>, vector<2x2xf32>), sym_name = "warp_propagate_masked_transfer_read"}> ({
  ^bb0(%arg0: index, %arg1: memref<4096x4096xf32>, %arg2: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2:2 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 64 : i64}> ({
      %3 = "mask_def_0"() : () -> vector<128xi1>
      %4 = "vector.transfer_read"(%arg1, %1, %arg2, %0, %3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<4096x4096xf32>, index, index, f32, vector<128xi1>) -> vector<128xf32>
      %5 = "mask_def_1"() : () -> vector<128x2xi1>
      %6 = "vector.transfer_read"(%arg1, %1, %arg2, %0, %5) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map1}> : (memref<4096x4096xf32>, index, index, f32, vector<128x2xi1>) -> vector<128x2xf32>
      "gpu.yield"(%4, %6) : (vector<128xf32>, vector<128x2xf32>) -> ()
    }) : (index) -> (vector<2xf32>, vector<2x2xf32>)
    "func.return"(%2#0, %2#1) : (vector<2xf32>, vector<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<4096x4096xf32>, index) -> vector<2xf32>, sym_name = "warp_propagate_nontrivial_map_masked_transfer_read"}> ({
  ^bb0(%arg0: index, %arg1: memref<4096x4096xf32>, %arg2: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 64 : i64}> ({
      %3 = "mask_def_0"() : () -> vector<128xi1>
      %4 = "vector.transfer_read"(%arg1, %arg2, %1, %0, %3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<4096x4096xf32>, index, index, f32, vector<128xi1>) -> vector<128xf32>
      "gpu.yield"(%4) : (vector<128xf32>) -> ()
    }) : (index) -> vector<2xf32>
    "func.return"(%2) : (vector<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<4096x4096xf32>, index, index, index) -> (vector<2xf32>, vector<2xf32>), sym_name = "warp_propagate_masked_transfer_read_shared_mask"}> ({
  ^bb0(%arg0: index, %arg1: memref<4096x4096xf32>, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2:2 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 64 : i64}> ({
      %3 = "vector.create_mask"(%arg4) : (index) -> vector<128xi1>
      %4 = "vector.transfer_read"(%arg1, %1, %arg2, %0, %3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<4096x4096xf32>, index, index, f32, vector<128xi1>) -> vector<128xf32>
      %5 = "vector.transfer_read"(%arg1, %1, %arg3, %0, %3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<4096x4096xf32>, index, index, f32, vector<128xi1>) -> vector<128xf32>
      "gpu.yield"(%4, %5) : (vector<128xf32>, vector<128xf32>) -> ()
    }) : (index) -> (vector<2xf32>, vector<2xf32>)
    "func.return"(%2#0, %2#1) : (vector<2xf32>, vector<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<128xf32>, f32) -> (vector<2xf32>, vector<4xf32>), sym_name = "warp_propagate_unconnected_read_write"}> ({
  ^bb0(%arg0: index, %arg1: memref<128xf32>, %arg2: f32):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2:2 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %3 = "arith.constant"() <{value = dense<2.000000e+00> : vector<128xf32>}> : () -> vector<128xf32>
      %4 = "vector.transfer_read"(%arg1, %1, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<128xf32>, index, f32) -> vector<128xf32>
      "vector.transfer_write"(%3, %arg1, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<128xf32>, memref<128xf32>, index) -> ()
      %5 = "vector.broadcast"(%arg2) : (f32) -> vector<64xf32>
      "gpu.yield"(%5, %4) : (vector<64xf32>, vector<128xf32>) -> ()
    }) : (index) -> (vector<2xf32>, vector<4xf32>)
    "func.return"(%2#0, %2#1) : (vector<2xf32>, vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<1xi1>, sym_name = "warp_propagate_constant_mask"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1>}> : () -> vector<32xi1>
      "gpu.yield"(%1) : (vector<32xi1>) -> ()
    }) : (index) -> vector<1xi1>
    "func.return"(%0) : (vector<1xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<1xi1>, sym_name = "warp_propagate_create_mask"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "vector.create_mask"(%arg1) : (index) -> vector<32xi1>
      "gpu.yield"(%1) : (vector<32xi1>) -> ()
    }) : (index) -> vector<1xi1>
    "func.return"(%0) : (vector<1xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index) -> vector<1x2x4xi1>, sym_name = "warp_propagate_multi_dim_create_mask"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "vector.create_mask"(%arg1, %arg2, %arg3) : (index, index, index) -> vector<16x4x4xi1>
      "gpu.yield"(%1) : (vector<16x4x4xi1>) -> ()
    }) : (index) -> vector<1x2x4xi1>
    "func.return"(%0) : (vector<1x2x4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<1x2x4xi1>, sym_name = "warp_propagate_multi_dim_constant_mask"}> ({
  ^bb0(%arg0: index):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1, 1, 2>}> : () -> vector<16x4x4xi1>
      "gpu.yield"(%1) : (vector<16x4x4xi1>) -> ()
    }) : (index) -> vector<1x2x4xi1>
    "func.return"(%0) : (vector<1x2x4xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<4x1024xf32>) -> (), sym_name = "warp_propagate_nd_write"}> ({
  ^bb0(%arg0: index, %arg1: memref<4x1024xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<4x1024xf32>
      "vector.transfer_write"(%1, %arg1, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x1024xf32>, memref<4x1024xf32>, index, index) -> ()
      "gpu.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "warp_propagate_duplicated_operands_in_yield"}> ({
  ^bb0(%arg0: index):
    %0:3 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "some_def"() : () -> vector<32xf32>
      %2 = "some_other_def"() : () -> vector<32xf32>
      %3 = "math.exp"(%2) <{fastmath = #arith.fastmath<none>}> : (vector<32xf32>) -> vector<32xf32>
      "gpu.yield"(%3, %1, %1) : (vector<32xf32>, vector<32xf32>, vector<32xf32>) -> ()
    }) : (index) -> (vector<1xf32>, vector<1xf32>, vector<1xf32>)
    "some_use"(%0#0) : (vector<1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128xindex>) -> (), sym_name = "warp_step_distribute"}> ({
  ^bb0(%arg0: memref<128xindex>):
    %0 = "gpu.lane_id"() : () -> index
    %1 = "gpu.warp_execute_on_lane_0"(%0) <{warp_size = 32 : i64}> ({
      %2 = "vector.step"() : () -> vector<32xindex>
      "gpu.yield"(%2) : (vector<32xindex>) -> ()
    }) : (index) -> vector<1xindex>
    "vector.transfer_write"(%1, %arg0, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<1xindex>, memref<128xindex>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<128xindex>) -> (), sym_name = "negative_warp_step_more_than_warp_size"}> ({
  ^bb0(%arg0: index, %arg1: memref<128xindex>):
    %0 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %1 = "vector.step"() : () -> vector<64xindex>
      "gpu.yield"(%1) : (vector<64xindex>) -> ()
    }) : (index) -> vector<2xindex>
    "vector.transfer_write"(%0, %arg1, %arg0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<2xindex>, memref<128xindex>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128xindex>, i1) -> (), sym_name = "warp_scf_if_no_yield_distribute"}> ({
  ^bb0(%arg0: memref<128xindex>, %arg1: i1):
    %0 = "gpu.lane_id"() : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    "gpu.warp_execute_on_lane_0"(%0) <{warp_size = 32 : i64}> ({
      %2 = "vector.step"() : () -> vector<32xindex>
      "scf.if"(%arg1) ({
        "vector.store"(%2, %arg0, %1) : (vector<32xindex>, memref<128xindex>, index) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "gpu.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "warp_scf_if_distribute"}> ({
  ^bb0(%arg0: i1):
    %0 = "gpu.lane_id"() : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "gpu.warp_execute_on_lane_0"(%0) <{warp_size = 32 : i64}> ({
      %3 = "vector.step"() : () -> vector<32xindex>
      %4 = "arith.constant"() <{value = dense<2> : vector<32xindex>}> : () -> vector<32xindex>
      %5 = "scf.if"(%arg0) ({
        %7 = "some_op"(%3) : (vector<32xindex>) -> vector<32xf32>
        "scf.yield"(%7) : (vector<32xf32>) -> ()
      }, {
        %6 = "other_op"(%4) : (vector<32xindex>) -> vector<32xf32>
        "scf.yield"(%6) : (vector<32xf32>) -> ()
      }) : (i1) -> vector<32xf32>
      "gpu.yield"(%5) : (vector<32xf32>) -> ()
    }) : (index) -> vector<1xf32>
    "some_use"(%2) : (vector<1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<1xf32>, sym_name = "dedup_unused_result"}> ({
  ^bb0(%arg0: index):
    %0:3 = "gpu.warp_execute_on_lane_0"(%arg0) <{warp_size = 32 : i64}> ({
      %2 = "some_def"() : () -> vector<32xf32>
      %3 = "some_def"() : () -> vector<64xf32>
      "gpu.yield"(%2, %3, %2) : (vector<32xf32>, vector<64xf32>, vector<32xf32>) -> ()
    }) : (index) -> (vector<1xf32>, vector<2xf32>, vector<1xf32>)
    %1 = "some_use"(%0#2, %0#2) : (vector<1xf32>, vector<1xf32>) -> vector<1xf32>
    "func.return"(%1) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

