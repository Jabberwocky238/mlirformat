"builtin.module"() ({
  "func.func"() <{function_type = (memref<7x8xf32>) -> index, sym_name = "dim_out_of_bounds"}> ({
  ^bb0(%arg0: memref<7x8xf32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 7 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "memref.dim"(%arg0, %0) : (memref<7x8xf32>, index) -> index loc("<stdin>":5:10)
    "func.return"(%1) : (index) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
