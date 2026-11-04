module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} {
  omp.private {type = private} @_QFEj_private_i32 : i32
  omp.private {type = private} @_QFEi_private_i32 : i32
  llvm.func @test() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "j"} : (i64) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.alloca %3 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr<5>
    %5 = llvm.addrspacecast %4 : !llvm.ptr<5> to !llvm.ptr
    %6 = llvm.mlir.constant(16383 : index) : i64
    %7 = llvm.mlir.constant(0 : index) : i64
    %8 = llvm.mlir.constant(1 : index) : i64
    %9 = llvm.mlir.constant(16384 : i32) : i32
    %10 = llvm.mlir.addressof @_QFEarray : !llvm.ptr
    %11 = omp.map.info var_ptr(%5 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "i"}
    %12 = omp.map.info var_ptr(%2 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "j"}
    %13 = omp.map.bounds lower_bound(%7 : i64) upper_bound(%6 : i64) extent(%6 : i64) stride(%8 : i64) start_idx(%8 : i64)
    %14 = omp.map.info var_ptr(%10 : !llvm.ptr, !llvm.array<16384 x i32>) map_clauses(implicit, tofrom) capture(ByRef) bounds(%13) -> !llvm.ptr {name = "array"}
    %15 = omp.map.info var_ptr(%5 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "i"}
    omp.target map_entries(%11 -> %arg0, %12 -> %arg1, %14 -> %arg2, %15 -> %arg3 : !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      %16 = llvm.mlir.constant(1 : i32) : i32
      %17 = llvm.mlir.constant(16384 : i32) : i32
      omp.teams {
        omp.distribute private(@_QFEi_private_i32 %arg3 -> %arg4 : !llvm.ptr) {
          omp.loop_nest (%arg5) : i32 = (%16) to (%17) inclusive step (%16) {
            omp.parallel {
              omp.wsloop private(@_QFEj_private_i32 %arg1 -> %arg6 : !llvm.ptr) {
                omp.loop_nest (%arg7) : i32 = (%16) to (%17) inclusive step (%16) {
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
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.mlir.global internal @_QFEarray() {addr_space = 0 : i32} : !llvm.array<16384 x i32> {
    %0 = llvm.mlir.zero : !llvm.array<16384 x i32>
    llvm.return %0 : !llvm.array<16384 x i32>
  }
}

