"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> (), sym_name = "func"}> ({
  ^bb0(%arg0: i64 loc("<stdin>":3:8)):
    %0 = "arith.index_cast"(%arg0) : (i64) -> index loc("<stdin>":4:10)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32> loc("<stdin>":5:10)
    "scf.parallel"(%0, %0, %0) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg1: index loc("<stdin>":7:10)):
      %2 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:12)
      "memref.store"(%2, %1, %arg1) : (f32, memref<16xf32>, index) -> () loc("<stdin>":9:7)
      "scf.reduce"() : () -> () loc("<stdin>":10:7)
    }) : (index, index, index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
