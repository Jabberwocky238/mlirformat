"builtin.module"() ({
  "func.func"() <{function_type = (memref<16x16xf32>, vector<8xf32>) -> vector<8xf32>, sym_name = "sink_vector_loads"}> ({
  ^bb0(%arg1: memref<16x16xf32> loc("<stdin>":3:8), %arg2: vector<8xf32> loc("<stdin>":3:34)):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "vector.load"(%arg1, %1, %1) : (memref<16x16xf32>, index, index) -> vector<8xf32> loc("<stdin>":6:10)
    %4 = "vector.load"(%arg1, %1, %2) : (memref<16x16xf32>, index, index) -> vector<8xf32> loc("<stdin>":7:10)
    %5 = "vector.load"(%arg1, %2, %1) : (memref<16x16xf32>, index, index) -> vector<8xf32> loc("<stdin>":8:10)
    %6 = "vector.load"(%arg1, %2, %2) : (memref<16x16xf32>, index, index) -> vector<8xf32> loc("<stdin>":9:10)
    %7 = "vector.fma"(%3, %4, %arg2) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":10:10)
    %8 = "vector.fma"(%5, %6, %7) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":11:10)
    "func.return"(%8) : (vector<8xf32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":16:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":17:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.x86.sink_vector_producer_ops"() : () -> () loc("<stdin>":19:9)
      }) : (!transform.any_op) -> () loc("<stdin>":18:7)
      "transform.yield"() : () -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":15:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":1:1)
