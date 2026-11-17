"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (i64)>, linkage = #llvm.linkage<external>, sym_name = "malloc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "gpu.binary"() <{objects = [#gpu.object<#spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>, "">], offloadingHandler = #gpu.select_object, sym_name = "kernels"}> : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> loc("<stdin>":6:10)
    %1 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> loc("<stdin>":7:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":8:10)
    %3 = "builtin.unrealized_conversion_cast"(%0) : (!llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>) -> memref<8xf32> loc("<stdin>":9:10)
    %4 = "builtin.unrealized_conversion_cast"(%1) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<8x8xi32> loc("<stdin>":10:10)
    %5 = "builtin.unrealized_conversion_cast"(%1) : (!llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>) -> memref<4x12xi8> loc("<stdin>":11:10)
    "gpu.launch_func"(%2, %2, %2, %2, %2, %2, %3, %4, %5) <{kernel = @kernels::@kernel_add, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 3, 0>}> : (index, index, index, index, index, index, memref<8xf32>, memref<8x8xi32>, memref<4x12xi8>) -> () loc("<stdin>":12:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":5:3)
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
