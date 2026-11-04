"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.target<"spirv.DeviceEvent">, linkage = #llvm.linkage<external>, sym_name = "global", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %7 = "llvm.mlir.zero"() : () -> !llvm.target<"spirv.DeviceEvent">
    "llvm.return"(%7) : (!llvm.target<"spirv.DeviceEvent">) -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 3 : i32, global_type = !llvm.target<"amdgcn.named.barrier", 0>, linkage = #llvm.linkage<internal>, sym_name = "amdgcn_named_barrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %6 = "llvm.mlir.poison"() : () -> !llvm.target<"amdgcn.named.barrier", 0>
    "llvm.return"(%6) : (!llvm.target<"amdgcn.named.barrier", 0>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<target<"spirv.Event"> ()>, linkage = #llvm.linkage<external>, sym_name = "func2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "llvm.mlir.poison"() : () -> !llvm.target<"spirv.Event">
    %4 = "llvm.alloca"(%2) <{alignment = 8 : i64, elem_type = !llvm.target<"spirv.Event">}> : (i32) -> !llvm.ptr
    %5 = "llvm.load"(%4) <{alignment = 8 : i64, ordering = 0 : i64}> : (!llvm.ptr) -> !llvm.target<"spirv.Event">
    "llvm.return"(%3) : (!llvm.target<"spirv.Event">) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "func3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.zero"() : () -> !llvm.target<"spirv.DeviceEvent">
    %1 = "llvm.freeze"(%0) : (!llvm.target<"spirv.DeviceEvent">) -> !llvm.target<"spirv.DeviceEvent">
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

