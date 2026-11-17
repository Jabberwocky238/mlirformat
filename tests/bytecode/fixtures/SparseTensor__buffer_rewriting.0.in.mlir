"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xf64>, f64) -> (memref<?xf64>, index), sym_name = "sparse_push_back"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: memref<?xf64> loc("<stdin>":3:22), %arg2: f64 loc("<stdin>":3:44)):
    %0:2 = "sparse_tensor.push_back"(%arg0, %arg1, %arg2) : (index, memref<?xf64>, f64) -> (memref<?xf64>, index) loc("<stdin>":4:12)
    "func.return"(%0#0, %0#1) : (memref<?xf64>, index) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
