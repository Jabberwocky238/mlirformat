"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index) -> memref<?x5xf32>, sym_name = "expand_shape"}> ({
  ^bb0(%arg0: memref<?xf32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:30)):
    %0 = "memref.expand_shape"(%arg0, %arg1) <{reassociation = [[0, 1]], static_output_shape = array<i64: -9223372036854775808, 5>}> : (memref<?xf32>, index) -> memref<?x5xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (memref<?x5xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
