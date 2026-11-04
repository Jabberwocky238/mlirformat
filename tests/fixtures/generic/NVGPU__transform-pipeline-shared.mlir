#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "simple_depth_2_unpeeled"}> ({
  ^bb0(%arg1: memref<?xf32>, %arg2: memref<?xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 100 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "memref.alloc"(%3) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32, #gpu.address_space<workgroup>>
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "scf.for"(%2, %3, %4, %6) ({
    ^bb0(%arg3: index, %arg4: f32):
      %8 = "vector.transfer_read"(%arg1, %arg3, %6) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf32>, index, f32) -> vector<4xf32>
      "vector.transfer_write"(%8, %5, %arg3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<4xf32>, memref<?xf32, #gpu.address_space<workgroup>>, index) -> ()
      %9 = "arith.addf"(%arg4, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%9) : (f32) -> ()
    }) : (index, index, index, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.nvgpu.pipeline_shared_memory_copies"(%0) <{depth = 2 : i64, failure_propagation_mode = 1 : i32}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xf32, #gpu.address_space<workgroup>>) -> (), sym_name = "body", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "simple_depth_2_peeled"}> ({
  ^bb0(%arg1: memref<?xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 100 : index}> : () -> index
    %4 = "arith.constant"() <{value = 200 : index}> : () -> index
    %5 = "arith.constant"() <{value = 4 : index}> : () -> index
    %6 = "memref.alloc"(%4) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32, #gpu.address_space<workgroup>>
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%2, %3, %5) ({
    ^bb0(%arg2: index):
      %8 = "vector.transfer_read"(%arg1, %arg2, %7) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf32>, index, f32) -> vector<4xf32>
      "vector.transfer_write"(%8, %6, %arg2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<4xf32>, memref<?xf32, #gpu.address_space<workgroup>>, index) -> ()
      "func.call"(%arg2, %6) <{callee = @body}> : (index, memref<?xf32, #gpu.address_space<workgroup>>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.nvgpu.pipeline_shared_memory_copies"(%0) <{depth = 2 : i64, failure_propagation_mode = 1 : i32, peel_epilogue}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "async_depth_2_predicated"}> ({
  ^bb0(%arg1: memref<?xf32>, %arg2: index):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 98 : index}> : () -> index
    %4 = "arith.constant"() <{value = 100 : index}> : () -> index
    %5 = "arith.constant"() <{value = 4 : index}> : () -> index
    %6 = "memref.alloc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32, #gpu.address_space<workgroup>>
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%2, %3, %5) ({
    ^bb0(%arg3: index):
      %8 = "arith.constant"() <{value = 96 : index}> : () -> index
      %9 = "arith.cmpi"(%arg3, %8) <{predicate = 2 : i64}> : (index, index) -> i1
      %10 = "arith.constant"() <{value = 2 : index}> : () -> index
      %11 = "arith.select"(%9, %5, %10) : (i1, index, index) -> index
      %12 = "nvgpu.device_async_copy"(%6, %arg3, %arg1, %arg3, %11) <{dstElements = 4 : index, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (memref<?xf32, #gpu.address_space<workgroup>>, index, memref<?xf32>, index, index) -> !nvgpu.device.async.token
      "nvgpu.device_async_wait"(%12) : (!nvgpu.device.async.token) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.nvgpu.pipeline_shared_memory_copies"(%0) <{depth = 2 : i64, failure_propagation_mode = 1 : i32}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "async_depth_2_peeled"}> ({
  ^bb0(%arg1: memref<?xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 98 : index}> : () -> index
    %4 = "arith.constant"() <{value = 100 : index}> : () -> index
    %5 = "arith.constant"() <{value = 4 : index}> : () -> index
    %6 = "memref.alloc"(%4) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32, #gpu.address_space<workgroup>>
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.for"(%2, %3, %5) ({
    ^bb0(%arg2: index):
      %8 = "arith.constant"() <{value = 96 : index}> : () -> index
      %9 = "arith.cmpi"(%arg2, %8) <{predicate = 2 : i64}> : (index, index) -> i1
      %10 = "arith.constant"() <{value = 2 : index}> : () -> index
      %11 = "arith.select"(%9, %5, %10) : (i1, index, index) -> index
      %12 = "nvgpu.device_async_copy"(%6, %arg2, %arg1, %arg2, %11) <{dstElements = 4 : index, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (memref<?xf32, #gpu.address_space<workgroup>>, index, memref<?xf32>, index, index) -> !nvgpu.device.async.token
      "nvgpu.device_async_wait"(%12) : (!nvgpu.device.async.token) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.nvgpu.pipeline_shared_memory_copies"(%0) <{depth = 2 : i64, failure_propagation_mode = 1 : i32, peel_epilogue}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

