"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2xf32>) -> vector<2x2xf32>, sym_name = "test_linearize"}> ({
  ^bb0(%arg0: vector<2x2xf32>):
    %0 = "arith.constant"() <{value = dense<[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]> : vector<2x2xf32>}> : () -> vector<2x2xf32>
    %1 = "math.sin"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<2x2xf32>) -> vector<2x2xf32>
    %2 = "arith.addf"(%arg0, %0) <{fastmath = #arith.fastmath<none>}> : (vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    "func.return"(%0) : (vector<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<2x2xf32>, sym_name = "test_linearize_poison"}> ({
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> vector<2x2xf32>
    "func.return"(%0) : (vector<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2xf32>, vector<4x4xf32>) -> vector<2x2xf32>, sym_name = "test_partial_linearize"}> ({
  ^bb0(%arg0: vector<2x2xf32>, %arg1: vector<4x4xf32>):
    %0 = "arith.constant"() <{value = dense<[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]> : vector<2x2xf32>}> : () -> vector<2x2xf32>
    %1 = "arith.constant"() <{value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [1.000000e+00, 2.000000e+00, 5.000000e+00, 6.000000e+00]]> : vector<4x4xf32>}> : () -> vector<4x4xf32>
    %2 = "math.sin"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<2x2xf32>) -> vector<2x2xf32>
    %3 = "math.sin"(%arg1) <{fastmath = #arith.fastmath<none>}> : (vector<4x4xf32>) -> vector<4x4xf32>
    %4 = "arith.addf"(%arg0, %0) <{fastmath = #arith.fastmath<none>}> : (vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    %5 = "arith.addf"(%arg1, %1) <{fastmath = #arith.fastmath<none>}> : (vector<4x4xf32>, vector<4x4xf32>) -> vector<4x4xf32>
    "func.return"(%0) : (vector<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x2xf32>, tensor<2x2xf32>) -> (tensor<2x2xf32>, tensor<2x2xf32>), sym_name = "test_tensor_no_linearize"}> ({
  ^bb0(%arg0: tensor<2x2xf32>, %arg1: tensor<2x2xf32>):
    %0 = "arith.mulf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (tensor<2x2xf32>, tensor<2x2xf32>) -> tensor<2x2xf32>
    "func.return"(%0, %arg0) : (tensor<2x2xf32>, tensor<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x[2]xf32>) -> vector<2x[2]xf32>, sym_name = "test_scalable_linearize"}> ({
  ^bb0(%arg0: vector<2x[2]xf32>):
    %0 = "arith.constant"() <{value = dense<3.000000e+00> : vector<2x[2]xf32>}> : () -> vector<2x[2]xf32>
    %1 = "math.sin"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<2x[2]xf32>) -> vector<2x[2]xf32>
    %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (vector<2x[2]xf32>, vector<2x[2]xf32>) -> vector<2x[2]xf32>
    "func.return"(%2) : (vector<2x[2]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[2]x[2]xf32>) -> vector<[2]x[2]xf32>, sym_name = "test_scalable_no_linearize"}> ({
  ^bb0(%arg0: vector<[2]x[2]xf32>):
    %0 = "arith.constant"() <{value = dense<2.000000e+00> : vector<[2]x[2]xf32>}> : () -> vector<[2]x[2]xf32>
    %1 = "math.sin"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<[2]x[2]xf32>) -> vector<[2]x[2]xf32>
    %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (vector<[2]x[2]xf32>, vector<[2]x[2]xf32>) -> vector<[2]x[2]xf32>
    "func.return"(%2) : (vector<[2]x[2]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<f32>, sym_name = "test_0d_vector"}> ({
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<f32>}> : () -> vector<f32>
    "func.return"(%0) : (vector<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8xf32>) -> vector<2x2xf32>, sym_name = "test_extract_strided_slice_2D"}> ({
  ^bb0(%arg0: vector<4x8xf32>):
    %0 = "vector.extract_strided_slice"(%arg0) <{offsets = [0, 4], sizes = [2, 2], strides = [1, 1]}> : (vector<4x8xf32>) -> vector<2x2xf32>
    "func.return"(%0) : (vector<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x[8]xf32>) -> vector<2x[8]xf32>, sym_name = "test_extract_strided_slice_2D_scalable"}> ({
  ^bb0(%arg0: vector<4x[8]xf32>):
    %0 = "vector.extract_strided_slice"(%arg0) <{offsets = [1, 0], sizes = [2, 8], strides = [1, 1]}> : (vector<4x[8]xf32>) -> vector<2x[8]xf32>
    "func.return"(%0) : (vector<2x[8]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8x2xf32>) -> vector<1x4x2xf32>, sym_name = "test_extract_strided_slice_3D"}> ({
  ^bb0(%arg0: vector<2x8x2xf32>):
    %0 = "vector.extract_strided_slice"(%arg0) <{offsets = [1, 2], sizes = [1, 4], strides = [1, 1]}> : (vector<2x8x2xf32>) -> vector<1x4x2xf32>
    "func.return"(%0) : (vector<1x4x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2xi8>, vector<2x1x3x2xi8>) -> vector<2x1x3x2xi8>, sym_name = "insert_strided_slice_2D_into_4D"}> ({
  ^bb0(%arg0: vector<2x2xi8>, %arg1: vector<2x1x3x2xi8>):
    %0 = "vector.insert_strided_slice"(%arg0, %arg1) <{offsets = [1, 0, 0, 0], strides = [1, 1]}> : (vector<2x2xi8>, vector<2x1x3x2xi8>) -> vector<2x1x3x2xi8>
    "func.return"(%0) : (vector<2x1x3x2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x2x1xi8>, vector<3x3x2xi8>) -> vector<3x3x2xi8>, sym_name = "insert_strided_slice_3D"}> ({
  ^bb0(%arg0: vector<1x2x1xi8>, %arg1: vector<3x3x2xi8>):
    %0 = "vector.insert_strided_slice"(%arg0, %arg1) <{offsets = [1, 1, 1], strides = [1, 1, 1]}> {sizes = [1, 2, 1]} : (vector<1x2x1xi8>, vector<3x3x2xi8>) -> vector<3x3x2xi8>
    "func.return"(%0) : (vector<3x3x2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x1xi8>, vector<2x2xi8>, vector<5x2xi8>) -> vector<5x2xi8>, sym_name = "insert_strided_slice_2D_higher_offsets"}> ({
  ^bb0(%arg0: vector<2x1xi8>, %arg1: vector<2x2xi8>, %arg2: vector<5x2xi8>):
    %0 = "vector.insert_strided_slice"(%arg1, %arg2) <{offsets = [2, 0], strides = [1, 1]}> {sizes = [2, 2]} : (vector<2x2xi8>, vector<5x2xi8>) -> vector<5x2xi8>
    %1 = "vector.insert_strided_slice"(%arg0, %0) <{offsets = [2, 0], strides = [1, 1]}> {sizes = [2, 1]} : (vector<2x1xi8>, vector<5x2xi8>) -> vector<5x2xi8>
    %2 = "vector.insert_strided_slice"(%arg0, %1) <{offsets = [3, 1], strides = [1, 1]}> {sizes = [2, 1]} : (vector<2x1xi8>, vector<5x2xi8>) -> vector<5x2xi8>
    "func.return"(%2) : (vector<5x2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x[2]xi8>, vector<2x[2]xi8>) -> vector<2x[2]xi8>, sym_name = "negative_insert_strided_slice_scalable"}> ({
  ^bb0(%arg0: vector<1x[2]xi8>, %arg1: vector<2x[2]xi8>):
    %0 = "vector.insert_strided_slice"(%arg0, %arg1) <{offsets = [0, 0], strides = [1, 1]}> : (vector<1x[2]xi8>, vector<2x[2]xi8>) -> vector<2x[2]xi8>
    "func.return"(%0) : (vector<2x[2]xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x2xf32>, vector<4x2xf32>) -> vector<8x2xf32>, sym_name = "test_vector_shuffle"}> ({
  ^bb0(%arg0: vector<4x2xf32>, %arg1: vector<4x2xf32>):
    %0 = "vector.shuffle"(%arg0, %arg1) <{mask = array<i64: 0, 4, 1, 5, 2, 6, 3, 7>}> : (vector<4x2xf32>, vector<4x2xf32>) -> vector<8x2xf32>
    "func.return"(%0) : (vector<8x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xi32>) -> i32, sym_name = "test_vector_extract_scalar"}> ({
  ^bb0(%arg0: vector<2x4xi32>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 1, 2>}> : (vector<2x4xi32>) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8x2xf32>) -> vector<8x2xf32>, sym_name = "test_vector_extract"}> ({
  ^bb0(%arg0: vector<2x8x2xf32>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 1>}> : (vector<2x8x2xf32>) -> vector<8x2xf32>
    "func.return"(%0) : (vector<8x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8x[2]xf32>) -> vector<8x[2]xf32>, sym_name = "test_vector_extract_scalable"}> ({
  ^bb0(%arg0: vector<2x8x[2]xf32>):
    %0 = "vector.extract"(%arg0) <{static_position = array<i64: 1>}> : (vector<2x8x[2]xf32>) -> vector<8x[2]xf32>
    "func.return"(%0) : (vector<8x[2]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xf32>, f32) -> vector<2x4xf32>, sym_name = "test_vector_insert_scalar"}> ({
  ^bb0(%arg0: vector<2x4xf32>, %arg1: f32):
    %0 = "vector.insert"(%arg1, %arg0) <{static_position = array<i64: 1, 2>}> : (f32, vector<2x4xf32>) -> vector<2x4xf32>
    "func.return"(%0) : (vector<2x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8x4xf32>, vector<8x4xf32>) -> vector<2x8x4xf32>, sym_name = "test_vector_insert"}> ({
  ^bb0(%arg0: vector<2x8x4xf32>, %arg1: vector<8x4xf32>):
    %0 = "vector.insert"(%arg1, %arg0) <{static_position = array<i64: 0>}> : (vector<8x4xf32>, vector<2x8x4xf32>) -> vector<2x8x4xf32>
    "func.return"(%0) : (vector<2x8x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8x[4]xf32>, vector<8x[4]xf32>) -> vector<2x8x[4]xf32>, sym_name = "test_vector_insert_scalable"}> ({
  ^bb0(%arg0: vector<2x8x[4]xf32>, %arg1: vector<8x[4]xf32>):
    %0 = "vector.insert"(%arg1, %arg0) <{static_position = array<i64: 0>}> : (vector<8x[4]xf32>, vector<2x8x[4]xf32>) -> vector<2x8x[4]xf32>
    "func.return"(%0) : (vector<2x8x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x4xf32>) -> vector<4x8xf16>, sym_name = "test_vector_bitcast"}> ({
  ^bb0(%arg0: vector<4x4xf32>):
    %0 = "vector.bitcast"(%arg0) : (vector<4x4xf32>) -> vector<4x8xf16>
    "func.return"(%0) : (vector<4x8xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x2xf32>) -> vector<4x4xf16>, sym_name = "test_vector_bitcast"}> ({
  ^bb0(%arg0: vector<4x2xf32>):
    %0 = "vector.bitcast"(%arg0) : (vector<4x2xf32>) -> vector<4x4xf16>
    "func.return"(%0) : (vector<4x4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x[2]xf32>) -> vector<4x[4]xf16>, sym_name = "test_vector_bitcast"}> ({
  ^bb0(%arg0: vector<4x[2]xf32>):
    %0 = "vector.bitcast"(%arg0) : (vector<4x[2]xf32>) -> vector<4x[4]xf16>
    "func.return"(%0) : (vector<4x[4]xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x2xf32>) -> vector<[4]x4xf16>, sym_name = "test_vector_bitcast"}> ({
  ^bb0(%arg0: vector<[4]x2xf32>):
    %0 = "vector.bitcast"(%arg0) : (vector<[4]x2xf32>) -> vector<[4]x4xf16>
    "func.return"(%0) : (vector<[4]x4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi8>) -> vector<4xi8>, sym_name = "test_linearize_across_for"}> ({
  ^bb0(%arg0: vector<4xi8>):
    %0 = "vector.shape_cast"(%arg0) : (vector<4xi8>) -> vector<2x2xi8>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4 = "scf.for"(%1, %3, %2, %0) ({
    ^bb0(%arg1: index, %arg2: vector<2x2xi8>):
      %6 = "arith.addi"(%arg2, %0) <{overflowFlags = #arith.overflow<none>}> : (vector<2x2xi8>, vector<2x2xi8>) -> vector<2x2xi8>
      "scf.yield"(%6) : (vector<2x2xi8>) -> ()
    }) : (index, index, index, vector<2x2xi8>) -> vector<2x2xi8>
    %5 = "vector.shape_cast"(%4) : (vector<2x2xi8>) -> vector<4xi8>
    "func.return"(%5) : (vector<4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> vector<4x2xi32>, sym_name = "linearize_vector_broadcast_scalar_source"}> ({
  ^bb0(%arg0: i32):
    %0 = "vector.broadcast"(%arg0) : (i32) -> vector<4x2xi32>
    "func.return"(%0) : (vector<4x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x1xi32>) -> vector<4x2xi32>, sym_name = "linearize_vector_broadcast_rank_two_source"}> ({
  ^bb0(%arg0: vector<1x1xi32>):
    %0 = "vector.broadcast"(%arg0) : (vector<1x1xi32>) -> vector<4x2xi32>
    "func.return"(%0) : (vector<4x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> vector<4x[2]xi32>, sym_name = "linearize_scalable_vector_broadcast"}> ({
  ^bb0(%arg0: i32):
    %0 = "vector.broadcast"(%arg0) : (i32) -> vector<4x[2]xi32>
    "func.return"(%0) : (vector<4x[2]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<1x16xi1>, sym_name = "linearize_create_mask"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "vector.create_mask"(%arg0, %arg1) : (index, index) -> vector<1x16xi1>
    "func.return"(%0) : (vector<1x16xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<1x[16]xi1>, sym_name = "linearize_scalable_create_mask"}> ({
  ^bb0(%arg6: index, %arg7: index):
    %6 = "vector.create_mask"(%arg6, %arg7) : (index, index) -> vector<1x[16]xi1>
    "func.return"(%6) : (vector<1x[16]xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x8xf32>) -> vector<1x4xf32>, sym_name = "linearize_vector_load"}> ({
  ^bb0(%arg5: memref<2x8xf32>):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "vector.load"(%arg5, %4, %4) : (memref<2x8xf32>, index, index) -> vector<1x4xf32>
    "func.return"(%5) : (vector<1x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x8xf32>, vector<1x4xf32>) -> (), sym_name = "linearize_vector_store"}> ({
  ^bb0(%arg3: memref<2x8xf32>, %arg4: vector<1x4xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.store"(%arg4, %arg3, %3, %3) : (vector<1x4xf32>, memref<2x8xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x8xf32>) -> vector<1x[4]xf32>, sym_name = "linearize_vector_load_scalable"}> ({
  ^bb0(%arg2: memref<2x8xf32>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "vector.load"(%arg2, %1, %1) : (memref<2x8xf32>, index, index) -> vector<1x[4]xf32>
    "func.return"(%2) : (vector<1x[4]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x8xf32>, vector<1x[4]xf32>) -> (), sym_name = "linearize_vector_store_scalable"}> ({
  ^bb0(%arg0: memref<2x8xf32>, %arg1: vector<1x[4]xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.store"(%arg1, %arg0, %0, %0) : (vector<1x[4]xf32>, memref<2x8xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32, f32) -> vector<2x2xf32>, sym_name = "test_vector_from_elements"}> ({
  ^bb0(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: f32):
    %0 = "vector.from_elements"(%arg0, %arg1, %arg2, %arg3) : (f32, f32, f32, f32) -> vector<2x2xf32>
    "func.return"(%0) : (vector<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>) -> (f32, f32), sym_name = "to_elements_1d"}> ({
  ^bb0(%arg0: vector<2xf32>):
    %0:2 = "vector.to_elements"(%arg0) : (vector<2xf32>) -> (f32, f32)
    "func.return"(%0#0, %0#1) : (f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2xf32>) -> (f32, f32, f32, f32), sym_name = "to_elements_2d"}> ({
  ^bb0(%arg0: vector<2x2xf32>):
    %0:4 = "vector.to_elements"(%arg0) : (vector<2x2xf32>) -> (f32, f32, f32, f32)
    "func.return"(%0#0, %0#1, %0#2, %0#3) : (f32, f32, f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

