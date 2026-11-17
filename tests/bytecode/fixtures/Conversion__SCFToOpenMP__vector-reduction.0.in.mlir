"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "vector_and_reduction"}> ({
    %0 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1>}> : () -> vector<2xi1> loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":6:10)
    %4 = "scf.parallel"(%1, %3, %2, %0) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> ({
    ^bb0(%arg0: index loc("<stdin>":8:10)):
      %5 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1>}> : () -> vector<2xi1> loc("<stdin>":9:12)
      "scf.reduce"(%5) ({
      ^bb0(%arg1: vector<2xi1> loc("<stdin>":11:12), %arg2: vector<2xi1> loc("<stdin>":11:33)):
        %6 = "arith.andi"(%arg1, %arg2) : (vector<2xi1>, vector<2xi1>) -> vector<2xi1> loc("<stdin>":12:14)
        "scf.reduce.return"(%6) : (vector<2xi1>) -> () loc("<stdin>":13:9)
      }) : (vector<2xi1>) -> () loc("<stdin>":10:7)
    }) : (index, index, index, vector<2xi1>) -> vector<2xi1> loc("<stdin>":7:10)
    "func.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
