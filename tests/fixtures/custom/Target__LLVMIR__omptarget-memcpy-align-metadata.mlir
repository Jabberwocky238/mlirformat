module attributes {llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9", llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} {
  omp.private {type = private} @_QFEk_private_i32 : i32
  llvm.func @_QQmain() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "k"} : (i64) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.alloca %3 x i32 {bindc_name = "b"} : (i64) -> !llvm.ptr<5>
    %5 = llvm.addrspacecast %4 : !llvm.ptr<5> to !llvm.ptr
    %6 = llvm.mlir.addressof @_QFEa : !llvm.ptr
    %7 = llvm.mlir.addressof @_QFECnz : !llvm.ptr
    %8 = llvm.getelementptr %6[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %9 = omp.map.info var_ptr(%6 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) map_clauses(tofrom) capture(ByRef) var_ptr_ptr(%8 : !llvm.ptr, i32) -> !llvm.ptr {name = ""}
    %10 = omp.map.info var_ptr(%6 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) map_clauses(to) capture(ByRef) members(%9 : [0] : !llvm.ptr) -> !llvm.ptr {name = "a"}
    %11 = omp.map.info var_ptr(%5 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = "b"}
    %12 = omp.map.info var_ptr(%2 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "k"}
    %13 = omp.map.info var_ptr(%7 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "nz"}
    omp.target kernel_type(spmd) map_entries(%10 -> %arg0, %11 -> %arg1, %12 -> %arg2, %13 -> %arg3, %9 -> %arg4 : !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      %14 = llvm.mlir.constant(0 : index) : i64
      %15 = llvm.mlir.constant(13 : i32) : i32
      %16 = llvm.mlir.constant(1000 : i32) : i32
      %17 = llvm.mlir.constant(1 : i32) : i32
      omp.teams {
        omp.parallel private(@_QFEk_private_i32 %arg2 -> %arg5 : !llvm.ptr) {
          %18 = llvm.mlir.constant(1 : i32) : i32
          %19 = llvm.alloca %18 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> {alignment = 8 : i64} : (i32) -> !llvm.ptr<5>
          %20 = llvm.addrspacecast %19 : !llvm.ptr<5> to !llvm.ptr
          omp.distribute {
            omp.wsloop {
              omp.loop_nest (%arg6) : i32 = (%17) to (%16) inclusive step (%17) {
                llvm.store %arg6, %arg5 : i32, !llvm.ptr
                %21 = llvm.mlir.constant(48 : i32) : i32
                "llvm.intr.memcpy"(%20, %arg0, %21) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
                omp.yield
              }
            } {omp.composite}
          } {omp.composite}
          omp.terminator
        } {omp.composite}
        omp.terminator
      } {omp.combined}
      omp.terminator
    } {omp.combined}
    llvm.return
  }
  llvm.mlir.global internal @_QFEa() {addr_space = 0 : i32} : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    llvm.return %0 : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
  }
  llvm.mlir.global internal constant @_QFECnz() {addr_space = 0 : i32} : i32 {
    %0 = llvm.mlir.constant(1000 : i32) : i32
    llvm.return %0 : i32
  }
}

