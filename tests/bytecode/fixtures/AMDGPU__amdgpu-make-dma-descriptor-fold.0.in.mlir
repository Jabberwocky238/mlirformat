"builtin.module"() ({
  "func.func"() <{function_type = (!amdgpu.tdm_base<i32>, index, i32) -> !amdgpu.tdm_descriptor, sym_name = "make_dma_descriptor_fold"}> ({
  ^bb0(%arg0: !amdgpu.tdm_base<i32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:38), %arg2: i32 loc("<stdin>":3:52)):
    %0 = "arith.constant"() <{value = 64 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "amdgpu.make_dma_descriptor"(%arg0, %0, %0, %0, %0, %0, %arg1, %arg2, %arg1) <{global_static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, global_static_strides = array<i64: -9223372036854775808, 1>, operandSegmentSizes = array<i32: 1, 2, 1, 2, 0, 0, 0, 0, 0, 0, 1, 1, 1>, shared_static_sizes = array<i64: -9223372036854775808, -9223372036854775808>}> : (!amdgpu.tdm_base<i32>, index, index, index, index, index, index, i32, index) -> !amdgpu.tdm_descriptor loc("<stdin>":5:10)
    "func.return"(%1) : (!amdgpu.tdm_descriptor) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
