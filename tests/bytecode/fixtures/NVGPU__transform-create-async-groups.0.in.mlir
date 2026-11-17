"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>) -> (), sym_name = "copies_to_asyncs"}> ({
  ^bb0(%arg1: memref<1024x1024xf32> loc("<stdin>":5:8)):
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x32x16xf32, #gpu.address_space<workgroup>> loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":8:10)
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":9:10)
    %6 = "vector.transfer_read"(%arg1, %3, %3, %5) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (memref<1024x1024xf32>, index, index, f32) -> vector<4xf32> loc("<stdin>":10:10)
    "vector.transfer_write"(%6, %2, %3, %3, %3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = affine_map<(d0, d1, d2) -> (d2)>}> : (vector<4xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>, index, index, index) -> () loc("<stdin>":11:5)
    %7 = "vector.transfer_read"(%arg1, %3, %4, %5) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (memref<1024x1024xf32>, index, index, f32) -> vector<1xf32> loc("<stdin>":12:10)
    "vector.transfer_write"(%7, %2, %3, %4, %3) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = affine_map<(d0, d1, d2) -> (d2)>}> : (vector<1xf32>, memref<4x32x16xf32, #gpu.address_space<workgroup>>, index, index, index) -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":18:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":19:12)
      %1 = "transform.nvgpu.create_async_groups"(%0) <{bypass_l1}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":20:12)
      "transform.yield"() : () -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":17:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":16:3)
}) : () -> () loc("<stdin>":3:1)
