"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test_subview_folding"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22)):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf16, #gpu.address_space<workgroup>> loc("<stdin>":4:10)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128xf16> loc("<stdin>":5:10)
    %2 = "memref.subview"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 32, 64>, static_strides = array<i64: 1, 1>}> : (memref<64x128xf16>) -> memref<32x64xf16, strided<[128, 1]>> loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    "amdgpu.gather_to_lds"(%2, %arg0, %arg1, %0, %3, %3) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = vector<8xf16>}> : (memref<32x64xf16, strided<[128, 1]>>, index, index, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
