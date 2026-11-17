"builtin.module"() ({
  "func.func"() <{function_type = (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> (), sym_name = "matmul"}> ({
  ^bb0(%arg1: memref<32x32xf32> loc("<stdin>":10:8), %arg2: memref<32x32xf32> loc("<stdin>":10:34), %arg3: memref<32x32xf32> loc("<stdin>":10:60)):
    %1 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":11:10)
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":12:10)
    %3 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16x16xf32>}> : () -> vector<16x16xf32> loc("<stdin>":13:10)
    %4 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":14:10)
    %5 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":15:10)
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":16:10)
    %7 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":17:10)
    %8 = "gpu.thread_id"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":18:10)
    %9 = "affine.apply"(%8) <{map = affine_map<()[s0] -> (s0 * 16)>}> : (index) -> index loc("<stdin>":19:10)
    %10 = "affine.apply"(%7) <{map = affine_map<()[s0] -> ((s0 floordiv 32) * 16)>}> : (index) -> index loc("<stdin>":20:11)
    %11 = "scf.for"(%2, %5, %4, %3) ({
    ^bb0(%arg4: index loc("<stdin>":22:10), %arg5: vector<16x16xf32> loc("<stdin>":22:24)):
      %14 = "affine.apply"(%2, %9) <{map = affine_map<(d0)[s0] -> (d0 + s0)>}> : (index, index) -> index loc("<stdin>":23:13)
      %15 = "affine.apply"(%2, %arg4) <{map = affine_map<(d0)[s0] -> (d0 + s0)>}> : (index, index) -> index loc("<stdin>":24:13)
      %16 = "vector.transfer_read"(%arg1, %14, %15, %6) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<32x32xf32>, index, index, f32) -> vector<16x16xf32> loc("<stdin>":25:13)
      %17 = "affine.apply"(%2, %10) <{map = affine_map<(d0)[s0] -> (d0 + s0)>}> : (index, index) -> index loc("<stdin>":26:13)
      %18 = "affine.apply"(%2, %arg4) <{map = affine_map<(d0)[s0] -> (d0 + s0)>}> : (index, index) -> index loc("<stdin>":27:13)
      %19 = "vector.transfer_read"(%arg2, %18, %17, %6) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<32x32xf32>, index, index, f32) -> vector<16x16xf32> loc("<stdin>":28:13)
      %20 = "vector.contract"(%16, %19, %arg5) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<16x16xf32>, vector<16x16xf32>, vector<16x16xf32>) -> vector<16x16xf32> loc("<stdin>":29:13)
      "scf.yield"(%20) : (vector<16x16xf32>) -> () loc("<stdin>":30:7)
    }) : (index, index, index, vector<16x16xf32>) -> vector<16x16xf32> loc("<stdin>":21:11)
    %12 = "affine.apply"(%2, %9) <{map = affine_map<(d0)[s0] -> (d0 + s0)>}> : (index, index) -> index loc("<stdin>":32:11)
    %13 = "affine.apply"(%2, %10) <{map = affine_map<(d0)[s0] -> (d0 + s0)>}> : (index, index) -> index loc("<stdin>":33:11)
    "vector.transfer_write"(%11, %arg3, %12, %13) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (vector<16x16xf32>, memref<32x32xf32>, index, index) -> () loc("<stdin>":34:5)
    "func.return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":9:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":39:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":40:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.gpu.unroll_vectors_subgroup_mma"() <{k = 8 : i64, m = 16 : i64, n = 16 : i64}> : () -> () loc("<stdin>":42:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":41:7)
      "transform.yield"() : () -> () loc("<stdin>":44:7)
    }) : () -> () loc("<stdin>":38:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":37:3)
}) : () -> () loc("<stdin>":8:1)
