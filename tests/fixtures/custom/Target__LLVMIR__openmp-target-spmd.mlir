module {
  module attributes {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} {
    llvm.func @main(%arg0: i32) {
      omp.target host_eval(%arg0 -> %arg1, %arg0 -> %arg2, %arg0 -> %arg3 : i32, i32, i32) {
        omp.teams {
          omp.parallel {
            omp.distribute {
              omp.wsloop {
                omp.loop_nest (%arg4) : i32 = (%arg1) to (%arg2) step (%arg3) {
                  omp.yield
                }
              } {omp.composite}
            } {omp.composite}
            omp.terminator
          } {omp.composite}
          omp.terminator
        }
        omp.terminator
      }
      llvm.return
    }
  }
  module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} {
    llvm.func @main(%arg0: i32) {
      omp.target host_eval(%arg0 -> %arg1, %arg0 -> %arg2, %arg0 -> %arg3 : i32, i32, i32) {
        omp.teams {
          omp.parallel {
            omp.distribute {
              omp.wsloop {
                omp.loop_nest (%arg4) : i32 = (%arg1) to (%arg2) step (%arg3) {
                  omp.yield
                }
              } {omp.composite}
            } {omp.composite}
            omp.terminator
          } {omp.composite}
          omp.terminator
        }
        omp.terminator
      }
      llvm.return
    }
  }
}

