"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (index, index), sym_name = "many_to_one_static_tail"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22), %arg2: index loc("<stdin>":3:36)):
    %0 = "affine.linearize_index"(%arg0, %arg1, %arg2) <{disjoint, operandSegmentSizes = array<i32: 3, 0>, static_basis = array<i64: 4, 8, 8>}> : (index, index, index) -> index loc("<stdin>":4:10)
    %1:2 = "affine.delinearize_index"(%0) <{static_basis = array<i64: 4, 64>}> : (index) -> (index, index) loc("<stdin>":5:12)
    "func.return"(%1#0, %1#1) : (index, index) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
