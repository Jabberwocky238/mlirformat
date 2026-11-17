"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "parallel_loop_bidy_bidx"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22), %arg2: index loc("<stdin>":3:36), %arg3: index loc("<stdin>":3:50), %arg4: index loc("<stdin>":3:64), %arg5: memref<?x?xf32> loc("<stdin>":3:78), %arg6: memref<?x?xf32> loc("<stdin>":3:102)):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":4:10)
    "scf.parallel"(%arg0, %arg1, %arg2, %arg3, %arg4, %0) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg7: index loc("<stdin>":6:10), %arg8: index loc("<stdin>":6:24)):
      %1 = "memref.load"(%arg5, %arg7, %arg8) : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":7:12)
      "memref.store"(%1, %arg6, %arg8, %arg7) : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":8:7)
      "scf.reduce"() : () -> () loc("<stdin>":9:7)
    }) {mapping = [#gpu.loop_dim_map<processor = block_y, map = (d0) -> (d0), bound = (d0) -> (d0)>, #gpu.loop_dim_map<processor = block_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]} : (index, index, index, index, index, index) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
