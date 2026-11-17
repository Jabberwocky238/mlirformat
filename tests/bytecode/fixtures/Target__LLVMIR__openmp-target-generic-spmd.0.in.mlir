"builtin.module"() ({
  "builtin.module"() ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg4: !llvm.ptr loc("<stdin>":4:10)):
      %2 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":5:12)
      %3 = "omp.map.info"(%arg4) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags to>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":6:12)
      "omp.target"(%2, %2, %2, %3) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 1, 0, 0, 0>}> ({
      ^bb0(%arg5: i32 loc("<stdin>":8:12), %arg6: i32 loc("<stdin>":8:24), %arg7: i32 loc("<stdin>":8:36), %arg8: !llvm.ptr loc("<stdin>":8:48)):
        %4 = "llvm.load"(%arg8) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":9:14)
        "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.loop_nest"(%arg5, %arg6, %arg7) ({
            ^bb0(%arg9: i32 loc("<stdin>":13:18)):
              "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
                "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
                  "omp.loop_nest"(%4, %4, %4) ({
                  ^bb0(%arg10: i32 loc("<stdin>":17:24)):
                    "omp.yield"() : () -> () loc("<stdin>":18:21)
                  }) : (i32, i32, i32) -> () loc("<stdin>":16:19)
                }) : () -> () loc("<stdin>":15:17)
                "omp.terminator"() : () -> () loc("<stdin>":21:17)
              }) : () -> () loc("<stdin>":14:15)
              "omp.yield"() : () -> () loc("<stdin>":23:15)
            }) : (i32, i32, i32) -> () loc("<stdin>":12:13)
          }) : () -> () loc("<stdin>":11:11)
          "omp.terminator"() : () -> () loc("<stdin>":26:11)
        }) {omp.combined} : () -> () loc("<stdin>":10:9)
        "omp.terminator"() : () -> () loc("<stdin>":28:9)
      }) {omp.combined} : (i32, i32, i32, !llvm.ptr) -> () loc("<stdin>":7:7)
      "llvm.return"() : () -> () loc("<stdin>":30:7)
    }) : () -> () loc("<stdin>":3:5)
  }) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":35:10)):
      %0 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags to>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":36:12)
      "omp.target"(%0) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      ^bb0(%arg1: !llvm.ptr loc("<stdin>":38:12)):
        %1 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":39:14)
        "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.loop_nest"(%1, %1, %1) ({
            ^bb0(%arg2: i32 loc("<stdin>":43:18)):
              "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
                "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
                  "omp.loop_nest"(%1, %1, %1) ({
                  ^bb0(%arg3: i32 loc("<stdin>":47:24)):
                    "omp.yield"() : () -> () loc("<stdin>":48:21)
                  }) : (i32, i32, i32) -> () loc("<stdin>":46:19)
                }) : () -> () loc("<stdin>":45:17)
                "omp.terminator"() : () -> () loc("<stdin>":51:17)
              }) : () -> () loc("<stdin>":44:15)
              "omp.yield"() : () -> () loc("<stdin>":53:15)
            }) : (i32, i32, i32) -> () loc("<stdin>":42:13)
          }) : () -> () loc("<stdin>":41:11)
          "omp.terminator"() : () -> () loc("<stdin>":56:11)
        }) {omp.combined} : () -> () loc("<stdin>":40:9)
        "omp.terminator"() : () -> () loc("<stdin>":58:9)
      }) {omp.combined} : (!llvm.ptr) -> () loc("<stdin>":37:7)
      "llvm.return"() : () -> () loc("<stdin>":60:7)
    }) : () -> () loc("<stdin>":34:5)
  }) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":33:3)
}) : () -> () loc("<stdin>":1:1)
