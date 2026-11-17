"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8xi8>, vector<[4]x8xi8>, vector<4x[4]xi32>) -> vector<4x[4]xi32>, sym_name = "test_vector_contract_to_ummla"}> ({
  ^bb0(%arg1: vector<4x8xi8> loc("<stdin>":6:8), %arg2: vector<[4]x8xi8> loc("<stdin>":6:31), %arg3: vector<4x[4]xi32> loc("<stdin>":6:56)):
    %1 = "arith.extui"(%arg1) : (vector<4x8xi8>) -> vector<4x8xi32> loc("<stdin>":7:10)
    %2 = "arith.extui"(%arg2) : (vector<[4]x8xi8>) -> vector<[4]x8xi32> loc("<stdin>":8:10)
    %3 = "vector.contract"(%1, %2, %arg3) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8xi32>, vector<[4]x8xi32>, vector<4x[4]xi32>) -> vector<4x[4]xi32> loc("<stdin>":9:10)
    "func.return"(%3) : (vector<4x[4]xi32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":14:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":15:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.arm_sve.vector_contract_to_i8mm"() : () -> () loc("<stdin>":17:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":16:7)
      "transform.yield"() : () -> () loc("<stdin>":19:7)
    }) : () -> () loc("<stdin>":13:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":4:1)
