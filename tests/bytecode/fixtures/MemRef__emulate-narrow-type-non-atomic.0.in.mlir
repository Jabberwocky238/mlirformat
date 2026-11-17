"builtin.module"() ({
  "func.func"() <{function_type = (index, i4) -> (), sym_name = "memref_store_i4"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: i4 loc("<stdin>":3:22)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xi4> loc("<stdin>":4:10)
    "memref.store"(%arg1, %0, %arg0) : (i4, memref<5xi4>, index) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
