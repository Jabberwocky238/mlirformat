"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5xi32>) -> index, sym_name = "dim_const"}> ({
  ^bb0(%arg0: memref<3x5xi32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "memref.dim"(%arg0, %0) : (memref<3x5xi32>, index) -> index loc("<stdin>":5:10)
    "func.return"(%1) : (index) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
