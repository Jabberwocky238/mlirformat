"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<8xi1>, sym_name = "genbool_1d"}> ({
    %6 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 4>}> : () -> vector<8xi1> loc("<stdin>":3:10)
    "func.return"(%6) : (vector<8xi1>) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> vector<4x4xi1>, sym_name = "genbool_2d"}> ({
    %5 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 2, 2>}> : () -> vector<4x4xi1> loc("<stdin>":7:10)
    "func.return"(%5) : (vector<4x4xi1>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> vector<2x3x4xi1>, sym_name = "genbool_3d"}> ({
    %4 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1, 1, 3>}> : () -> vector<2x3x4xi1> loc("<stdin>":11:10)
    "func.return"(%4) : (vector<2x3x4xi1>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (index) -> vector<3xi1>, sym_name = "genbool_var_1d"}> ({
  ^bb0(%arg6: index loc("<stdin>":15:8)):
    %3 = "vector.create_mask"(%arg6) : (index) -> vector<3xi1> loc("<stdin>":16:10)
    "func.return"(%3) : (vector<3xi1>) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (index, index) -> vector<2x3xi1>, sym_name = "genbool_var_2d"}> ({
  ^bb0(%arg4: index loc("<stdin>":20:8), %arg5: index loc("<stdin>":20:22)):
    %2 = "vector.create_mask"(%arg4, %arg5) : (index, index) -> vector<2x3xi1> loc("<stdin>":21:10)
    "func.return"(%2) : (vector<2x3xi1>) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":19:3)
  "func.func"() <{function_type = (index, index, index) -> vector<2x1x7xi1>, sym_name = "genbool_var_3d"}> ({
  ^bb0(%arg1: index loc("<stdin>":25:8), %arg2: index loc("<stdin>":25:22), %arg3: index loc("<stdin>":25:36)):
    %1 = "vector.create_mask"(%arg1, %arg2, %arg3) : (index, index, index) -> vector<2x1x7xi1> loc("<stdin>":26:10)
    "func.return"(%1) : (vector<2x1x7xi1>) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":24:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":31:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":32:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_masks"() : () -> () loc("<stdin>":34:9)
      }) : (!transform.any_op) -> () loc("<stdin>":33:7)
      "transform.yield"() : () -> () loc("<stdin>":36:7)
    }) : () -> () loc("<stdin>":30:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":29:3)
}) : () -> () loc("<stdin>":1:1)
