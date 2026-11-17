"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x4xbf16>, vector<[4]x4xbf16>, vector<4x[4]xf32>) -> vector<4x[4]xf32>, sym_name = "test_vector_contract_to_bfmmla"}> ({
  ^bb0(%arg1: vector<4x4xbf16> loc("<stdin>":6:8), %arg2: vector<[4]x4xbf16> loc("<stdin>":6:33), %arg3: vector<4x[4]xf32> loc("<stdin>":6:60)):
    %1 = "vector.contract"(%arg1, %arg2, %arg3) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xbf16>, vector<[4]x4xbf16>, vector<4x[4]xf32>) -> vector<4x[4]xf32> loc("<stdin>":7:10)
    "func.return"(%1) : (vector<4x[4]xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":12:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":13:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.arm_sve.vector_contract_to_bfmmla"() : () -> () loc("<stdin>":15:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":14:7)
      "transform.yield"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":11:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":4:1)
