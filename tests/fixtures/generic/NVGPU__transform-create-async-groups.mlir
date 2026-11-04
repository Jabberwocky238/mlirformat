#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1, d2) -> (d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>) -> (), sym_name = "copies_to_asyncs"}> ({
  ^bb0(%arg1: memref<1024x1024xf32>):
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x32x16xf32, #gpu.address_space<workgroup>>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "vector.transfer_read"(%arg1, %3, %3, %5) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<1024x1024xf32>, index, index, f32) -> vector<4xf32>
    "vector.transfer_write"(%6, %2, %3, %3, %3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map1}> : (vector<4xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>, index, index, index) -> ()
    %7 = "vector.transfer_read"(%arg1, %3, %4, %5) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<1024x1024xf32>, index, index, f32) -> vector<1xf32>
    "vector.transfer_write"(%7, %2, %3, %4, %3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map1}> : (vector<1xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.nvgpu.create_async_groups"(%0) <{bypass_l1}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1, d2) -> (d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>) -> (), sym_name = "copies_to_asyncs_no_mma"}> ({
  ^bb0(%arg1: memref<1024x1024xf32>):
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x32x16xf32, #gpu.address_space<workgroup>>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "vector.transfer_read"(%arg1, %3, %3, %5) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<1024x1024xf32>, index, index, f32) -> vector<4xf32>
    "vector.transfer_write"(%6, %2, %3, %3, %3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map1}> : (vector<4xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>, index, index, index) -> ()
    %7 = "vector.transfer_read"(%arg1, %3, %4, %5) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<1024x1024xf32>, index, index, f32) -> vector<1xf32>
    "vector.transfer_write"(%7, %2, %3, %4, %3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map1}> : (vector<1xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.nvgpu.create_async_groups"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>) -> (), sym_name = "copies_to_asyncs_load_store"}> ({
  ^bb0(%arg1: memref<1024x1024xf32>):
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x32x16xf32, #gpu.address_space<workgroup>>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "vector.load"(%arg1, %3, %3) : (memref<1024x1024xf32>, index, index) -> vector<4xf32>
    "vector.store"(%6, %2, %3, %3, %3) : (vector<4xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>, index, index, index) -> ()
    %7 = "vector.load"(%arg1, %3, %4) : (memref<1024x1024xf32>, index, index) -> vector<1xf32>
    "vector.store"(%7, %2, %3, %4, %3) : (vector<1xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.nvgpu.create_async_groups"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>, memref<1024x1024xf16>) -> (), sym_name = "copies_to_asyncs_load_store"}> ({
  ^bb0(%arg1: memref<1024x1024xf32>, %arg2: memref<1024x1024xf16>):
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x32x16xf32, #gpu.address_space<workgroup>>
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x32x16xf16, #gpu.address_space<workgroup>>
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 4 : index}> : () -> index
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "vector.load"(%arg1, %4, %5) : (memref<1024x1024xf32>, index, index) -> vector<2x2xf32>
    "vector.store"(%7, %2, %4, %5, %4) : (vector<2x2xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>, index, index, index) -> ()
    %8 = "vector.load"(%arg2, %4, %5) : (memref<1024x1024xf16>, index, index) -> vector<1xf16>
    "vector.store"(%8, %3, %4, %5, %4) : (vector<1xf16>, memref<4x32x16xf16, #gpu.address_space<workgroup>>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.nvgpu.create_async_groups"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1, d2) -> (d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>, index) -> (), sym_name = "read_with_mask"}> ({
  ^bb0(%arg1: memref<1024x1024xf32>, %arg2: index):
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x32x16xf32, #gpu.address_space<workgroup>>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "vector.create_mask"(%arg2) : (index) -> vector<4xi1>
    %6 = "vector.transfer_read"(%arg1, %3, %3, %4, %5) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<1024x1024xf32>, index, index, f32, vector<4xi1>) -> vector<4xf32>
    "vector.transfer_write"(%6, %2, %3, %3, %3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map1}> : (vector<4xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.nvgpu.create_async_groups"(%0) <{bypass_l1}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<1024x1024xf32>) -> (), sym_name = "read_2d_with_mask"}> ({
  ^bb0(%arg1: index, %arg2: index, %arg3: memref<1024x1024xf32>):
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x32x16xf32, #gpu.address_space<workgroup>>
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "vector.create_mask"(%arg1, %arg2) : (index, index) -> vector<3x4xi1>
    %7 = "vector.transfer_read"(%arg3, %4, %4, %5, %6) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<1024x1024xf32>, index, index, f32, vector<3x4xi1>) -> vector<3x4xf32>
    "vector.transfer_write"(%7, %3, %4, %4, %4) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map1}> : (vector<3x4xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.transfer_to_scf"() <{full_unroll = true, max_transfer_rank = 1 : i64}> : () -> ()
      }) : (!transform.any_op) -> ()
      %1 = "transform.nvgpu.create_async_groups"(%0) <{bypass_l1}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_cse"(%2) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, memref<1024x1024x1024xf32>) -> (), sym_name = "read_3d_with_mask"}> ({
  ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: memref<1024x1024x1024xf32>):
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x32x16xf32, #gpu.address_space<workgroup>>
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "vector.create_mask"(%arg1, %arg2, %arg3) : (index, index, index) -> vector<2x3x4xi1>
    %7 = "vector.transfer_read"(%arg4, %4, %4, %4, %5, %6) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 1>, permutation_map = #map}> : (memref<1024x1024x1024xf32>, index, index, index, f32, vector<2x3x4xi1>) -> vector<2x3x4xf32>
    "vector.transfer_write"(%7, %3, %4, %4, %4) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map}> : (vector<2x3x4xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.transfer_to_scf"() <{full_unroll = true, max_transfer_rank = 1 : i64}> : () -> ()
      }) : (!transform.any_op) -> ()
      %1 = "transform.nvgpu.create_async_groups"(%0) <{bypass_l1}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_cse"(%2) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

