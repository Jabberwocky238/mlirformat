"builtin.module"() ({
  "gpu.binary"() <{objects = [#gpu.object<#nvvm.target, "BLOB">], offloadingHandler = #gpu.select_object, sym_name = "kernel_module"}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 8 : index}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 32 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 256 : i32}> : () -> i32
    "gpu.launch_func"(%0, %0, %0, %0, %0, %0, %2, %1, %1) <{kernel = @kernel_module::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 2, 0>}> : (i64, i64, i64, i64, i64, i64, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {gpu.container_module} : () -> ()

// -----
"builtin.module"() ({
  "gpu.binary"() <{objects = [#gpu.object<#nvvm.target, "0">, #gpu.object<#nvvm.target, "1">], offloadingHandler = #gpu.select_object<1 : i64>, sym_name = "kernel_module"}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.binary"() <{objects = [#gpu.object<#nvvm.target, "NVPTX">, #gpu.object<#rocdl.target, "AMDGPU">], offloadingHandler = #gpu.select_object<#rocdl.target>, sym_name = "kernel_module"}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.binary"() <{objects = [#gpu.object<#nvvm.target, "NVPTX">, #gpu.object<#spirv.target_env<#spirv.vce<v1.0, [Addresses, Int64, Kernel], []>, api=OpenCL, #spirv.resource_limits<>>, "BLOB">], offloadingHandler = #gpu.select_object<#spirv.target_env<#spirv.vce<v1.0, [Addresses, Int64, Kernel], []>, api=OpenCL, #spirv.resource_limits<>>>, sym_name = "kernel_module"}> : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.binary"() <{objects = [#gpu.object<#rocdl.target, "BLOB">], offloadingHandler = #gpu.select_object, sym_name = "kernel_module"}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 8 : index}> : () -> i64
    "gpu.launch_func"(%0, %0, %0, %0, %0, %0, %arg0) <{kernel = @kernel_module::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1>}> : (i64, i64, i64, i64, i64, i64, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {gpu.container_module} : () -> ()

// -----
"builtin.module"() ({
  "gpu.binary"() <{objects = [#gpu.object<#nvvm.target, "BLOB">], offloadingHandler = #gpu.select_object, sym_name = "kernel_module"}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
    "gpu.launch_func"(%1, %1, %1, %2, %2, %2, %0, %0, %0) <{kernel = @kernel_module::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>}> : (i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {gpu.container_module} : () -> ()

// -----
"builtin.module"() ({
  "gpu.binary"() <{objects = [#gpu.object<#nvvm.target, "BLOB">], offloadingHandler = #gpu.select_object, sym_name = "kernel_module"}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "cooperative_no_cluster", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
    "gpu.launch_func"(%0, %0, %0, %1, %1, %1) <{cooperative, kernel = @kernel_module::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (i64, i64, i64, i64, i64, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {gpu.container_module} : () -> ()

// -----
"builtin.module"() ({
  "gpu.binary"() <{objects = [#gpu.object<#nvvm.target, "BLOB">], offloadingHandler = #gpu.select_object, sym_name = "kernel_module"}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "cooperative_with_cluster", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 3 : index}> : () -> i64
    "gpu.launch_func"(%1, %1, %1, %2, %2, %2, %0, %0, %0) <{cooperative, kernel = @kernel_module::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>}> : (i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {gpu.container_module} : () -> ()

// -----
"builtin.module"() ({
  "gpu.binary"() <{objects = [#gpu.object<#nvvm.target, properties = {section = "__nv_rel_fatbin"}, "BLOB">], offloadingHandler = #gpu.select_object, sym_name = "cuda_device_mod"}> : () -> ()
}) {gpu.container_module} : () -> ()

