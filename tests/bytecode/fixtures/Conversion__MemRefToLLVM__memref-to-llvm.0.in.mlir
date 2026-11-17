"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "view"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22), %arg2: index loc("<stdin>":3:36)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2048xi8> loc("<stdin>":4:10)
    %1 = "memref.view"(%0, %arg2, %arg0, %arg1) : (memref<2048xi8>, index, index, index) -> memref<?x?xf32> loc("<stdin>":5:10)
    %2 = "memref.view"(%0, %arg2, %arg1) : (memref<2048xi8>, index, index) -> memref<4x?xf32> loc("<stdin>":6:10)
    %3 = "memref.view"(%0, %arg2) : (memref<2048xi8>, index) -> memref<64x4xf32> loc("<stdin>":7:10)
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2048xi8, 4> loc("<stdin>":8:10)
    %5 = "memref.view"(%4, %arg2) : (memref<2048xi8, 4>, index) -> memref<64x4xf32, 4> loc("<stdin>":9:10)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
