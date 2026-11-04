"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "vector_and_reduction"}> ({
    %0 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1>}> : () -> vector<2xi1>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index
    %4 = "scf.parallel"(%1, %3, %2, %0) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> ({
    ^bb0(%arg0: index):
      %5 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1>}> : () -> vector<2xi1>
      "scf.reduce"(%5) ({
      ^bb0(%arg1: vector<2xi1>, %arg2: vector<2xi1>):
        %6 = "arith.andi"(%arg1, %arg2) : (vector<2xi1>, vector<2xi1>) -> vector<2xi1>
        "scf.reduce.return"(%6) : (vector<2xi1>) -> ()
      }) : (vector<2xi1>) -> ()
    }) : (index, index, index, vector<2xi1>) -> vector<2xi1>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

