"builtin.module"() ({
  "func.func"() <{function_type = (memref<2xi32>, i1, memref<2xi32>, i1) -> (i1, i1, i1, i1, i1, i1, i1), sym_name = "dealloc_deallocated_in_retained"}> ({
  ^bb0(%arg0: memref<2xi32> loc("<stdin>":3:8), %arg1: i1 loc("<stdin>":3:30), %arg2: memref<2xi32> loc("<stdin>":3:41), %arg3: i1 loc("<stdin>":3:63)):
    %0 = "bufferization.dealloc"(%arg0, %arg1, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (memref<2xi32>, i1, memref<2xi32>) -> i1 loc("<stdin>":4:10)
    %1 = "bufferization.dealloc"(%arg0, %arg2, %arg1, %arg1, %arg0) <{operandSegmentSizes = array<i32: 2, 2, 1>}> : (memref<2xi32>, memref<2xi32>, i1, i1, memref<2xi32>) -> i1 loc("<stdin>":5:10)
    %2:2 = "bufferization.dealloc"(%arg0, %arg1, %arg0, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 2>}> : (memref<2xi32>, i1, memref<2xi32>, memref<2xi32>) -> (i1, i1) loc("<stdin>":6:12)
    %3 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (memref<2xi32>) -> memref<i32> loc("<stdin>":7:10)
    %4 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (memref<2xi32>) -> memref<1xi32, strided<[1], offset: 1>> loc("<stdin>":8:10)
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32> loc("<stdin>":9:10)
    %6:3 = "bufferization.dealloc"(%arg0, %4, %arg1, %arg3, %arg0, %5, %3) <{operandSegmentSizes = array<i32: 2, 2, 3>}> : (memref<2xi32>, memref<1xi32, strided<[1], offset: 1>>, i1, i1, memref<2xi32>, memref<2xi32>, memref<i32>) -> (i1, i1, i1) loc("<stdin>":10:12)
    "func.return"(%0, %1, %2#0, %2#1, %6#0, %6#1, %6#2) : (i1, i1, i1, i1, i1, i1, i1) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
