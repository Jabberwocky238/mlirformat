module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} {
  omp.private {type = private} @_QFEj_private_i32 : i32
  omp.private {type = private} @_QFEi_private_i32 : i32
  llvm.func @test() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "j"} : (i64) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    %3 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr<5>
    %4 = llvm.addrspacecast %3 : !llvm.ptr<5> to !llvm.ptr
    %5 = llvm.mlir.addressof @_QFEarray : !llvm.ptr
    %6 = omp.map.info var_ptr(%4 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "i"}
    %7 = omp.map.info var_ptr(%2 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "j"}
    %8 = omp.map.info var_ptr(%5 : !llvm.ptr, !llvm.array<16384 x i32>) map_clauses(implicit, tofrom) capture(ByRef) -> !llvm.ptr {name = "array"}
    %9 = omp.map.info var_ptr(%4 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "i"}
    omp.target kernel_type(spmd) map_entries(%6 -> %arg0, %7 -> %arg1, %8 -> %arg2, %9 -> %arg3 : !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      %10 = llvm.mlir.constant(1 : i32) : i32
      %11 = llvm.mlir.constant(16384 : i32) : i32
      omp.teams {
        omp.distribute private(@_QFEi_private_i32 %arg3 -> %arg4 : !llvm.ptr) {
          omp.loop_nest (%arg5) : i32 = (%10) to (%11) inclusive step (%10) {
            omp.parallel {
              omp.wsloop private(@_QFEj_private_i32 %arg1 -> %arg6 : !llvm.ptr) {
                omp.loop_nest (%arg7) : i32 = (%10) to (%11) inclusive step (%10) {
                  llvm.store %arg7, %arg6 : i32, !llvm.ptr
                  omp.yield
                }
              }
              omp.terminator
            }
            omp.yield
          }
        }
        omp.terminator
      } {omp.combined}
      omp.terminator
    } {omp.combined}
    llvm.return
  }
  llvm.mlir.global internal @_QFEarray() {addr_space = 0 : i32} : !llvm.array<16384 x i32> {
    %0 = llvm.mlir.zero : !llvm.array<16384 x i32>
    llvm.return %0 : !llvm.array<16384 x i32>
  }
}

