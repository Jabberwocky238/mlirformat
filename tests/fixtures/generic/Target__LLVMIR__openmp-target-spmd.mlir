"builtin.module"() ({
  "builtin.module"() ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg5: i32):
      "omp.target"(%arg5, %arg5, %arg5) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg6: i32, %arg7: i32, %arg8: i32):
        "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
            "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
              "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
                "omp.loop_nest"(%arg6, %arg7, %arg8) ({
                ^bb0(%arg9: i32):
                  "omp.yield"() : () -> ()
                }) : (i32, i32, i32) -> ()
              }) {omp.composite} : () -> ()
            }) {omp.composite} : () -> ()
            "omp.terminator"() : () -> ()
          }) {omp.composite} : () -> ()
          "omp.terminator"() : () -> ()
        }) {omp.combined} : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (i32, i32, i32) -> ()
      "llvm.return"() : () -> ()
    }) : () -> ()
  }) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()
  "builtin.module"() ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg0: i32):
      "omp.target"(%arg0, %arg0, %arg0) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: i32, %arg2: i32, %arg3: i32):
        "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
            "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
              "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
                "omp.loop_nest"(%arg1, %arg2, %arg3) ({
                ^bb0(%arg4: i32):
                  "omp.yield"() : () -> ()
                }) : (i32, i32, i32) -> ()
              }) {omp.composite} : () -> ()
            }) {omp.composite} : () -> ()
            "omp.terminator"() : () -> ()
          }) {omp.composite} : () -> ()
          "omp.terminator"() : () -> ()
        }) {omp.combined} : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (i32, i32, i32) -> ()
      "llvm.return"() : () -> ()
    }) : () -> ()
  }) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> ()
}) : () -> ()

