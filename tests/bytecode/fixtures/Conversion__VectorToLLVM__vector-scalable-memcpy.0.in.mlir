"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>, index) -> (), sym_name = "vector_scalable_memcopy"}> ({
  ^bb0(%arg0: memref<?xf32> loc("<stdin>":3:8), %arg1: memref<?xf32> loc("<stdin>":3:30), %arg2: index loc("<stdin>":3:52)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "vector.vscale"() : () -> index loc("<stdin>":6:10)
    %3 = "arith.muli"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":7:10)
    "scf.for"(%0, %arg2, %3) ({
    ^bb0(%arg3: index loc("<stdin>":9:10)):
      %4 = "vector.load"(%arg0, %arg3) : (memref<?xf32>, index) -> vector<[4]xf32> loc("<stdin>":10:12)
      "vector.store"(%4, %arg1, %arg3) : (vector<[4]xf32>, memref<?xf32>, index) -> () loc("<stdin>":11:7)
      "scf.yield"() : () -> () loc("<stdin>":12:7)
    }) : (index, index, index) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
