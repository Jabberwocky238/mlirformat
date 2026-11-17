"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi32>, tensor<1x1x?x1xi32>) -> tensor<1x1x?x1xi32>, sym_name = "simple_KCRS_to_KCRSsr"}> ({
  ^bb0(%arg0: tensor<?x?xi32> loc("<stdin>":3:8), %arg1: tensor<1x1x?x1xi32> loc("<stdin>":3:32)):
    %0 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 5 : i32}> : () -> i32 loc("<stdin>":5:10)
    %2 = "linalg.pack"(%arg0, %arg1, %1, %0) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_inner_tiles = array<i64: -9223372036854775808, 1>}> : (tensor<?x?xi32>, tensor<1x1x?x1xi32>, i32, index) -> tensor<1x1x?x1xi32> loc("<stdin>":6:10)
    "func.return"(%2) : (tensor<1x1x?x1xi32>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
