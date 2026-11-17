"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "alloc_and_dealloc"}> ({
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<999xi32> loc("<stdin>":3:10)
    "memref.dealloc"(%3) : (memref<999xi32>) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "alloc_and_dealloc_aligned"}> ({
    %2 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<999xf32> loc("<stdin>":8:10)
    "memref.dealloc"(%2) : (memref<999xf32>) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = () -> (), sym_name = "allocating_and_deallocating_multi"}> ({
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<7x999xi32> loc("<stdin>":13:10)
    "memref.dealloc"(%1) : (memref<7x999xi32>) -> () loc("<stdin>":14:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = () -> (), sym_name = "alloc_and_dealloc_rank0"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":18:10)
    "memref.dealloc"(%0) : (memref<i32>) -> () loc("<stdin>":19:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":1:1)
