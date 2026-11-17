"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xf32, #gpu.address_space<workgroup>>) -> (), sym_name = "body", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "simple_depth_2_peeled"}> ({
  ^bb0(%arg1: memref<?xf32> loc("<stdin>":6:8)):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %3 = "arith.constant"() <{value = 100 : index}> : () -> index loc("<stdin>":8:10)
    %4 = "arith.constant"() <{value = 200 : index}> : () -> index loc("<stdin>":9:10)
    %5 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":10:10)
    %6 = "memref.alloc"(%4) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32, #gpu.address_space<workgroup>> loc("<stdin>":11:10)
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":12:10)
    "scf.for"(%2, %3, %5) ({
    ^bb0(%arg2: index loc("<stdin>":14:10)):
      %8 = "vector.transfer_read"(%arg1, %arg2, %7) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<?xf32>, index, f32) -> vector<4xf32> loc("<stdin>":15:12)
      "vector.transfer_write"(%8, %6, %arg2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<4xf32>, memref<?xf32, #gpu.address_space<workgroup>>, index) -> () loc("<stdin>":16:7)
      "func.call"(%arg2, %6) <{callee = @body}> : (index, memref<?xf32, #gpu.address_space<workgroup>>) -> () loc("<stdin>":17:7)
      "scf.yield"() : () -> () loc("<stdin>":18:7)
    }) : (index, index, index) -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":24:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":25:12)
      %1 = "transform.nvgpu.pipeline_shared_memory_copies"(%0) <{depth = 2 : i64, failure_propagation_mode = 1 : i32, peel_epilogue}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":26:12)
      "transform.yield"() : () -> () loc("<stdin>":27:7)
    }) : () -> () loc("<stdin>":23:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":2:1)
