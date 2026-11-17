"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x16x16xf32>, index) -> f32, sym_name = "test_load_nontemporal"}> ({
  ^bb0(%arg1: memref<2x16x16xf32> loc("<stdin>":3:8), %arg2: index loc("<stdin>":3:36)):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "memref.load"(%arg1, %arg2, %1, %2) <{nontemporal = true}> : (memref<2x16x16xf32>, index, index, index) -> f32 loc("<stdin>":6:10)
    "func.return"(%3) : (f32) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":11:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":12:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.extract_address_computations"() : () -> () loc("<stdin>":14:9)
      }) : (!transform.any_op) -> () loc("<stdin>":13:7)
      "transform.yield"() : () -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":10:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":1:1)
