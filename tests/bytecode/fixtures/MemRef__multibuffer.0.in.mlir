"builtin.module"() ({
  "func.func"() <{function_type = (memref<1024x1024xf32>) -> (), sym_name = "multi_buffer"}> ({
  ^bb0(%arg0: memref<1024x1024xf32> loc("<stdin>":4:8)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> {someAttribute} : () -> memref<4x128xf32> loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 1024 : index}> : () -> index loc("<stdin>":6:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":7:10)
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":8:10)
    "scf.for"(%2, %1, %3) ({
    ^bb0(%arg1: index loc("<stdin>":10:10)):
      %4 = "memref.subview"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 4, 128>, static_strides = array<i64: 1, 1>}> : (memref<1024x1024xf32>, index) -> memref<4x128xf32, affine_map<(d0, d1)[s0] -> (d0 * 1024 + s0 + d1)>> loc("<stdin>":11:12)
      "memref.copy"(%4, %0) : (memref<4x128xf32, affine_map<(d0, d1)[s0] -> (d0 * 1024 + s0 + d1)>>, memref<4x128xf32>) -> () loc("<stdin>":12:7)
      "some_use"(%0) : (memref<4x128xf32>) -> () loc("<stdin>":13:7)
      "some_use"(%0) : (memref<4x128xf32>) -> () loc("<stdin>":14:7)
      "scf.yield"() : () -> () loc("<stdin>":15:7)
    }) : (index, index, index) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
