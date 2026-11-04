"builtin.module"() ({
  "builtin.module"() ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg4: !llvm.ptr):
      %2 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %3 = "omp.map.info"(%arg4) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags to>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      "omp.target"(%2, %2, %2, %3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 3, 0, 0, 0, 1, 0, 0>}> ({
      ^bb0(%arg5: i32, %arg6: i32, %arg7: i32, %arg8: !llvm.ptr):
        %4 = "llvm.load"(%arg8) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.loop_nest"(%arg5, %arg6, %arg7) ({
            ^bb0(%arg9: i32):
              "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
                "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
                  "omp.loop_nest"(%4, %4, %4) ({
                  ^bb0(%arg10: i32):
                    "omp.yield"() : () -> ()
                  }) : (i32, i32, i32) -> ()
                }) : () -> ()
                "omp.terminator"() : () -> ()
              }) : () -> ()
              "omp.yield"() : () -> ()
            }) : (i32, i32, i32) -> ()
          }) : () -> ()
          "omp.terminator"() : () -> ()
        }) : () -> ()
        "omp.terminator"() : () -> ()
      }) : (i32, i32, i32, !llvm.ptr) -> ()
      "llvm.return"() : () -> ()
    }) : () -> ()
  }) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()
  "builtin.module"() ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg0: !llvm.ptr):
      %0 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags to>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
      "omp.target"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      ^bb0(%arg1: !llvm.ptr):
        %1 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.loop_nest"(%1, %1, %1) ({
            ^bb0(%arg2: i32):
              "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
                "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
                  "omp.loop_nest"(%1, %1, %1) ({
                  ^bb0(%arg3: i32):
                    "omp.yield"() : () -> ()
                  }) : (i32, i32, i32) -> ()
                }) : () -> ()
                "omp.terminator"() : () -> ()
              }) : () -> ()
              "omp.yield"() : () -> ()
            }) : (i32, i32, i32) -> ()
          }) : () -> ()
          "omp.terminator"() : () -> ()
        }) : () -> ()
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "llvm.return"() : () -> ()
    }) : () -> ()
  }) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> ()
}) : () -> ()

