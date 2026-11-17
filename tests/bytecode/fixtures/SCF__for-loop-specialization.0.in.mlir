"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xf32>, memref<?xf32>, memref<?xf32>, memref<?xf32>) -> (), sym_name = "for"}> ({
  ^bb0(%arg0: index loc("<stdin>":4:8), %arg1: memref<?xf32> loc("<stdin>":4:22), %arg2: memref<?xf32> loc("<stdin>":4:44), %arg3: memref<?xf32> loc("<stdin>":4:66), %arg4: memref<?xf32> loc("<stdin>":4:88)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %2 = "memref.dim"(%arg1, %0) : (memref<?xf32>, index) -> index loc("<stdin>":7:10)
    %3 = "affine.min"(%2, %arg0) <{map = affine_map<()[s0, s1] -> (1024, s0 - s1)>}> : (index, index) -> index loc("<stdin>":8:10)
    "scf.for"(%0, %3, %1) ({
    ^bb0(%arg5: index loc("<stdin>":10:10)):
      %4 = "memref.load"(%arg2, %arg5) : (memref<?xf32>, index) -> f32 loc("<stdin>":11:12)
      %5 = "memref.load"(%arg3, %arg5) : (memref<?xf32>, index) -> f32 loc("<stdin>":12:12)
      %6 = "arith.addf"(%4, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":13:12)
      "memref.store"(%6, %arg4, %arg5) : (f32, memref<?xf32>, index) -> () loc("<stdin>":14:7)
      "scf.yield"() : () -> () loc("<stdin>":15:7)
    }) : (index, index, index) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
