"builtin.module"() ({
  "func.func"() <{function_type = (vector<f32>) -> vector<i32>, sym_name = "lower_to_llvm"}> ({
  ^bb0(%arg1: vector<f32> loc("<stdin>":3:8)):
    %1 = "vector.bitcast"(%arg1) : (vector<f32>) -> vector<i32> loc("<stdin>":4:10)
    "func.return"(%1) : (vector<i32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":9:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":10:12)
      "transform.apply_conversion_patterns"(%0) <{legal_dialects = ["func", "llvm"]}> ({
        "transform.apply_conversion_patterns.vector.vector_to_llvm"() <{force_32bit_vector_indices = true, reassociate_fp_reductions = false, use_vector_alignment = false}> : () -> () loc("<stdin>":12:9)
      }, {
        "transform.apply_conversion_patterns.memref.memref_to_llvm_type_converter"() : () -> () loc("<stdin>":14:9)
      }) : (!transform.any_op) -> () loc("<stdin>":11:7)
      "transform.yield"() : () -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":8:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
