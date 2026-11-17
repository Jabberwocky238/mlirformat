"builtin.module"() ({
  "func.func"() <{function_type = (memref<45x24x256xf32, 1>, memref<24x256xf32, 1>, memref<256xf32, 1>) -> (), sym_name = "optimize_alloc_location", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<45x24x256xf32, 1> loc("<stdin>":3:8), %arg1: memref<24x256xf32, 1> loc("<stdin>":3:41), %arg2: memref<256xf32, 1> loc("<stdin>":3:71)):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<45x6144xf32, 1> loc("<stdin>":5:10)
    %2 = "memref.expand_shape"(%1) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 45, 24, 256>}> : (memref<45x6144xf32, 1>) -> memref<45x24x256xf32, 1> loc("<stdin>":6:10)
    %3 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<24x256xf32, 1> loc("<stdin>":7:10)
    %4 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:10)
    "memref.store"(%4, %3, %0, %0) : (f32, memref<24x256xf32, 1>, index, index) -> () loc("<stdin>":9:5)
    "memref.dealloc"(%1) : (memref<45x6144xf32, 1>) -> () loc("<stdin>":10:5)
    "memref.dealloc"(%3) : (memref<24x256xf32, 1>) -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
