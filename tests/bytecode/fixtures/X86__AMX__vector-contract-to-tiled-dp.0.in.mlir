"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x32x16x4xi8>, memref<1x16x32x4xi8>, memref<32x32xi32>) -> memref<32x32xi32>, sym_name = "brgemm_int8"}> ({
  ^bb0(%arg1: memref<1x32x16x4xi8> loc("<stdin>":8:8), %arg2: memref<1x16x32x4xi8> loc("<stdin>":8:37), %arg3: memref<32x32xi32> loc("<stdin>":8:66)):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":9:10)
    %2 = "ub.poison"() <{value = #ub.poison}> : () -> i8 loc("<stdin>":10:10)
    %3 = "ub.poison"() <{value = #ub.poison}> : () -> i32 loc("<stdin>":11:10)
    %4 = "vector.transfer_read"(%arg1, %1, %1, %1, %1, %2) <{in_bounds = [true, true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>}> : (memref<1x32x16x4xi8>, index, index, index, index, i8) -> vector<1x16x16x4xi8> loc("<stdin>":12:10)
    %5 = "vector.transfer_read"(%arg2, %1, %1, %1, %1, %2) <{in_bounds = [true, true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>}> : (memref<1x16x32x4xi8>, index, index, index, index, i8) -> vector<1x16x16x4xi8> loc("<stdin>":13:10)
    %6 = "vector.transfer_read"(%arg3, %1, %1, %3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<32x32xi32>, index, index, i32) -> vector<16x16xi32> loc("<stdin>":14:10)
    %7 = "vector.contract"(%4, %5, %6) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>, affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>, affine_map<(d0, d1, d2, d3, d4) -> (d2, d3)>], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x16x16x4xi8>, vector<1x16x16x4xi8>, vector<16x16xi32>) -> vector<16x16xi32> loc("<stdin>":15:10)
    "vector.transfer_write"(%7, %arg3, %1, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (vector<16x16xi32>, memref<32x32xi32>, index, index) -> () loc("<stdin>":16:5)
    "func.return"(%arg3) : (memref<32x32xi32>) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":7:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":21:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":22:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.x86.vector_contract_to_amx_dot_product"() : () -> () loc("<stdin>":24:9)
      }) : (!transform.any_op) -> () loc("<stdin>":23:7)
      "transform.yield"() : () -> () loc("<stdin>":26:7)
    }) : () -> () loc("<stdin>":20:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":19:3)
}) : () -> () loc("<stdin>":6:1)
