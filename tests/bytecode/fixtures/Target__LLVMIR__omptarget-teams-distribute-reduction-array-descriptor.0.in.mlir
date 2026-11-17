"builtin.module"() ({
  "omp.declare_reduction"() <{byref_element_type = !llvm.array<4 x i32>, sym_name = "add_reduction_byref_box_4xi32", type = !llvm.ptr}> ({
    %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":3:10)
    %8 = "llvm.alloca"(%7) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr<5> loc("<stdin>":4:10)
    %9 = "llvm.addrspacecast"(%8) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":5:10)
    "omp.yield"(%9) : (!llvm.ptr) -> () loc("<stdin>":6:5)
  }, {
  ^bb0(%arg6: !llvm.ptr loc("<stdin>":8:8), %arg7: !llvm.ptr loc("<stdin>":8:26)):
    "omp.yield"(%arg7) : (!llvm.ptr) -> () loc("<stdin>":9:5)
  }, {
  ^bb0(%arg4: !llvm.ptr loc("<stdin>":11:8), %arg5: !llvm.ptr loc("<stdin>":11:26)):
    "omp.yield"(%arg4) : (!llvm.ptr) -> () loc("<stdin>":12:5)
  }, {
  }, {
  }, {
  ^bb0(%arg3: !llvm.ptr loc("<stdin>":16:8)):
    %6 = "llvm.getelementptr"(%arg3) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":17:10)
    "omp.yield"(%6) : (!llvm.ptr) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_array_reduction_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":21:10)
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.array<4 x i32>}> : (i64) -> !llvm.ptr<5> loc("<stdin>":22:10)
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":23:10)
    %3 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "red_array", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.array<4 x i32>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":24:10)
    "omp.target"(%3) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":26:10)):
      %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":27:12)
      %5 = "llvm.mlir.constant"() <{value = 1000 : i32}> : () -> i32 loc("<stdin>":28:12)
      "omp.teams"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: true>, reduction_syms = [@add_reduction_byref_box_4xi32]}> ({
      ^bb0(%arg1: !llvm.ptr loc("<stdin>":30:12)):
        "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%4, %5, %4) <{loop_inclusive}> ({
              ^bb0(%arg2: i32 loc("<stdin>":35:20)):
                "omp.yield"() : () -> () loc("<stdin>":36:17)
              }) : (i32, i32, i32) -> () loc("<stdin>":34:15)
            }) {omp.composite} : () -> () loc("<stdin>":33:13)
          }) {omp.composite} : () -> () loc("<stdin>":32:11)
          "omp.terminator"() : () -> () loc("<stdin>":40:11)
        }) {omp.composite} : () -> () loc("<stdin>":31:9)
        "omp.terminator"() : () -> () loc("<stdin>":42:9)
      }) {omp.combined} : (!llvm.ptr) -> () loc("<stdin>":29:7)
      "omp.terminator"() : () -> () loc("<stdin>":44:7)
    }) {omp.combined} : (!llvm.ptr) -> () loc("<stdin>":25:5)
    "llvm.return"() : () -> () loc("<stdin>":46:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> () loc("<stdin>":20:3)
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui64, "dlti.global_memory_space" = 1 : ui64>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
