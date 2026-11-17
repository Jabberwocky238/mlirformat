"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "views"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.muli"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":5:10)
    %2 = "memref.alloc"(%1) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi8> loc("<stdin>":6:10)
    %3 = "memref.view"(%2, %0, %arg0, %arg0) : (memref<?xi8>, index, index, index) -> memref<?x?xf32> loc("<stdin>":7:10)
    %4 = "memref.view"(%2, %0, %arg0, %arg0) : (memref<?xi8>, index, index, index) -> memref<?x?xvector<4x4xf32>> loc("<stdin>":8:10)
    "memref.dealloc"(%2) : (memref<?xi8>) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
