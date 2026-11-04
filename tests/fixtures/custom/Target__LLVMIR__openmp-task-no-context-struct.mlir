module {
  omp.private {type = private} @_QFtestEp_private_i32 : i32
  llvm.func @_QPtest() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "p"} : (i64) -> !llvm.ptr
    omp.task private(@_QFtestEp_private_i32 %1 -> %arg0 : !llvm.ptr) {
      llvm.call @_QPdo_something(%arg0) {fastmathFlags = #llvm.fastmath<contract>} : (!llvm.ptr) -> ()
      omp.terminator
    }
    llvm.return
  }
  llvm.func @_QPdo_something(!llvm.ptr) attributes {sym_visibility = "private"}
}

