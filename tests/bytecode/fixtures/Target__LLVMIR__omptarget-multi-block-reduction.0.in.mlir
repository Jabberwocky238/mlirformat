"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "bar", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "baz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":4:3)
  "omp.declare_reduction"() <{byref_element_type = !llvm.array<5 x f32>, sym_name = "add_reduction_byref_box_5xf32", type = !llvm.ptr}> ({
    %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":7:10)
    %8 = "llvm.alloca"(%7) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr<5> loc("<stdin>":8:10)
    %9 = "llvm.addrspacecast"(%8) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":9:10)
    "omp.yield"(%9) : (!llvm.ptr) -> () loc("<stdin>":10:5)
  }, {
  ^bb0(%arg6: !llvm.ptr loc("<stdin>":12:8), %arg7: !llvm.ptr loc("<stdin>":12:26)):
    "omp.yield"(%arg7) : (!llvm.ptr) -> () loc("<stdin>":13:5)
  }, {
  ^bb0(%arg4: !llvm.ptr loc("<stdin>":15:8), %arg5: !llvm.ptr loc("<stdin>":15:26)):
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @bar, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":16:5)
    "llvm.br"()[^bb1] : () -> () loc("<stdin>":17:5)
  ^bb1:  // pred: ^bb0
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":19:5)
    "omp.yield"(%arg4) : (!llvm.ptr) -> () loc("<stdin>":20:5)
  }, {
  }, {
  }, {
  ^bb0(%arg3: !llvm.ptr loc("<stdin>":24:8)):
    %6 = "llvm.getelementptr"(%arg3) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":25:10)
    "omp.yield"(%6) : (!llvm.ptr) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":29:10)
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.array<5 x f32>}> {bindc_name = "x"} : (i64) -> !llvm.ptr<5> loc("<stdin>":30:10)
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":31:10)
    %3 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "x", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.array<5 x f32>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":32:10)
    "omp.target"(%3) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":34:10)):
      %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":35:12)
      %5 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":36:12)
      "omp.teams"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: true>, reduction_syms = [@add_reduction_byref_box_5xf32]}> ({
      ^bb0(%arg1: !llvm.ptr loc("<stdin>":38:12)):
        "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%4, %5, %4) <{loop_inclusive}> ({
              ^bb0(%arg2: i32 loc("<stdin>":43:20)):
                "omp.yield"() : () -> () loc("<stdin>":44:17)
              }) : (i32, i32, i32) -> () loc("<stdin>":42:15)
            }) {omp.composite} : () -> () loc("<stdin>":41:13)
          }) {omp.composite} : () -> () loc("<stdin>":40:11)
          "omp.terminator"() : () -> () loc("<stdin>":48:11)
        }) {omp.composite} : () -> () loc("<stdin>":39:9)
        "omp.terminator"() : () -> () loc("<stdin>":50:9)
      }) {omp.combined} : (!llvm.ptr) -> () loc("<stdin>":37:7)
      "omp.terminator"() : () -> () loc("<stdin>":52:7)
    }) {omp.combined} : (!llvm.ptr) -> () loc("<stdin>":33:5)
    "llvm.return"() : () -> () loc("<stdin>":54:5)
  }) : () -> () loc("<stdin>":28:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui64, "dlti.global_memory_space" = 1 : ui64>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
