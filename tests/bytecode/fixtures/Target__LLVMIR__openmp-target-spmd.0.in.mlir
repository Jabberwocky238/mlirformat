"builtin.module"() ({
  "builtin.module"() ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg5: i32 loc("<stdin>":4:10)):
      "omp.target"(%arg5, %arg5, %arg5) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg6: i32 loc("<stdin>":6:12), %arg7: i32 loc("<stdin>":6:24), %arg8: i32 loc("<stdin>":6:36)):
        "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
            "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
              "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
                "omp.loop_nest"(%arg6, %arg7, %arg8) ({
                ^bb0(%arg9: i32 loc("<stdin>":12:22)):
                  "omp.yield"() : () -> () loc("<stdin>":13:19)
                }) : (i32, i32, i32) -> () loc("<stdin>":11:17)
              }) {omp.composite} : () -> () loc("<stdin>":10:15)
            }) {omp.composite} : () -> () loc("<stdin>":9:13)
            "omp.terminator"() : () -> () loc("<stdin>":17:13)
          }) {omp.composite} : () -> () loc("<stdin>":8:11)
          "omp.terminator"() : () -> () loc("<stdin>":19:11)
        }) {omp.combined} : () -> () loc("<stdin>":7:9)
        "omp.terminator"() : () -> () loc("<stdin>":21:9)
      }) {omp.combined} : (i32, i32, i32) -> () loc("<stdin>":5:7)
      "llvm.return"() : () -> () loc("<stdin>":23:7)
    }) : () -> () loc("<stdin>":3:5)
  }) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "main", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg0: i32 loc("<stdin>":28:10)):
      "omp.target"(%arg0, %arg0, %arg0) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0>}> ({
      ^bb0(%arg1: i32 loc("<stdin>":30:12), %arg2: i32 loc("<stdin>":30:24), %arg3: i32 loc("<stdin>":30:36)):
        "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
            "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
              "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
                "omp.loop_nest"(%arg1, %arg2, %arg3) ({
                ^bb0(%arg4: i32 loc("<stdin>":36:22)):
                  "omp.yield"() : () -> () loc("<stdin>":37:19)
                }) : (i32, i32, i32) -> () loc("<stdin>":35:17)
              }) {omp.composite} : () -> () loc("<stdin>":34:15)
            }) {omp.composite} : () -> () loc("<stdin>":33:13)
            "omp.terminator"() : () -> () loc("<stdin>":41:13)
          }) {omp.composite} : () -> () loc("<stdin>":32:11)
          "omp.terminator"() : () -> () loc("<stdin>":43:11)
        }) {omp.combined} : () -> () loc("<stdin>":31:9)
        "omp.terminator"() : () -> () loc("<stdin>":45:9)
      }) {omp.combined} : (i32, i32, i32) -> () loc("<stdin>":29:7)
      "llvm.return"() : () -> () loc("<stdin>":47:7)
    }) : () -> () loc("<stdin>":27:5)
  }) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":26:3)
}) : () -> () loc("<stdin>":1:1)
