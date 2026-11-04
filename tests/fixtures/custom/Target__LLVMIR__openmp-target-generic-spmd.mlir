module {
  module attributes {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} {
    llvm.func @main(%arg0: !llvm.ptr) {
      %0 = llvm.load %arg0 : !llvm.ptr -> i32
      %1 = omp.map.info var_ptr(%arg0 : !llvm.ptr, i32) map_clauses(to) capture(ByCopy) -> !llvm.ptr
      omp.target host_eval(%0 -> %arg1, %0 -> %arg2, %0 -> %arg3 : i32, i32, i32) map_entries(%1 -> %arg4 : !llvm.ptr) {
        %2 = llvm.load %arg4 : !llvm.ptr -> i32
        omp.teams {
          omp.distribute {
            omp.loop_nest (%arg5) : i32 = (%arg1) to (%arg2) step (%arg3) {
              omp.parallel {
                omp.wsloop {
                  omp.loop_nest (%arg6) : i32 = (%2) to (%2) step (%2) {
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
  }
  module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} {
    llvm.func @main(%arg0: !llvm.ptr) {
      %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, i32) map_clauses(to) capture(ByCopy) -> !llvm.ptr
      omp.target map_entries(%0 -> %arg1 : !llvm.ptr) {
        %1 = llvm.load %arg1 : !llvm.ptr -> i32
        omp.teams {
          omp.distribute {
            omp.loop_nest (%arg2) : i32 = (%1) to (%1) step (%1) {
              omp.parallel {
                omp.wsloop {
                  omp.loop_nest (%arg3) : i32 = (%1) to (%1) step (%1) {
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
  }
}

