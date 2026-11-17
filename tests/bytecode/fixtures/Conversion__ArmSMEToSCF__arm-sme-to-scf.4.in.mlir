"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xi32>, memref<?x?xi32>) -> (), sym_name = "arm_sme_tile_store_hor"}> ({
  ^bb0(%arg0: vector<[4]x[4]xi32> loc("<stdin>":4:8), %arg1: memref<?x?xi32> loc("<stdin>":4:36)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    "arm_sme.tile_store"(%arg0, %arg1, %0, %0) <{layout = #arm_sme.layout<horizontal>, operandSegmentSizes = array<i32: 1, 1, 2, 0>}> : (vector<[4]x[4]xi32>, memref<?x?xi32>, index, index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
