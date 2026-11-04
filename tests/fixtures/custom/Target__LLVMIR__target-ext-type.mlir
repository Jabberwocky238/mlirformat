module {
  llvm.mlir.global external @global() {addr_space = 0 : i32} : !llvm.target<"spirv.DeviceEvent"> {
    %0 = llvm.mlir.zero : !llvm.target<"spirv.DeviceEvent">
    llvm.return %0 : !llvm.target<"spirv.DeviceEvent">
  }
  llvm.mlir.global internal @amdgcn_named_barrier() {addr_space = 3 : i32} : !llvm.target<"amdgcn.named.barrier", 0> {
    %0 = llvm.mlir.poison : !llvm.target<"amdgcn.named.barrier", 0>
    llvm.return %0 : !llvm.target<"amdgcn.named.barrier", 0>
  }
  llvm.func @func2() -> !llvm.target<"spirv.Event"> {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.poison : !llvm.target<"spirv.Event">
    %2 = llvm.alloca %0 x !llvm.target<"spirv.Event"> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %3 = llvm.load %2 {alignment = 8 : i64} : !llvm.ptr -> !llvm.target<"spirv.Event">
    llvm.return %1 : !llvm.target<"spirv.Event">
  }
  llvm.func @func3() {
    %0 = llvm.mlir.zero : !llvm.target<"spirv.DeviceEvent">
    %1 = llvm.freeze %0 : !llvm.target<"spirv.DeviceEvent">
    llvm.return
  }
}

