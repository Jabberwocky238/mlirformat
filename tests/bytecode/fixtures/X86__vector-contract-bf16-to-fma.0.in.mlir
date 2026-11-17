"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x1x2xbf16>, memref<1x1x32x2xbf16>, vector<1x8xf32>) -> vector<1x8xf32>, sym_name = "brgemm_to_fma"}> ({
  ^bb0(%arg1: memref<1x4x1x2xbf16> loc("<stdin>":7:8), %arg2: memref<1x1x32x2xbf16> loc("<stdin>":7:37), %arg3: vector<1x8xf32> loc("<stdin>":7:67)):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":8:10)
    %2 = "ub.poison"() <{value = #ub.poison}> : () -> bf16 loc("<stdin>":9:10)
    %3 = "vector.transfer_read"(%arg1, %1, %1, %1, %1, %2) <{in_bounds = [true, true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>}> : (memref<1x4x1x2xbf16>, index, index, index, index, bf16) -> vector<1x1x1x2xbf16> loc("<stdin>":10:10)
    %4 = "vector.transfer_read"(%arg2, %1, %1, %1, %1, %2) <{in_bounds = [true, true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>}> : (memref<1x1x32x2xbf16>, index, index, index, index, bf16) -> vector<1x1x8x2xbf16> loc("<stdin>":11:10)
    %5 = "vector.contract"(%3, %4, %arg3) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>, affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>, affine_map<(d0, d1, d2, d3, d4) -> (d2, d3)>], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x1x1x2xbf16>, vector<1x1x8x2xbf16>, vector<1x8xf32>) -> vector<1x8xf32> loc("<stdin>":12:10)
    "func.return"(%5) : (vector<1x8xf32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":6:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":17:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":18:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.x86.vector_contract_bf16_to_fma"() : () -> () loc("<stdin>":20:9)
      }) : (!transform.any_op) -> () loc("<stdin>":19:7)
      "transform.yield"() : () -> () loc("<stdin>":22:7)
    }) : () -> () loc("<stdin>":16:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":5:1)
