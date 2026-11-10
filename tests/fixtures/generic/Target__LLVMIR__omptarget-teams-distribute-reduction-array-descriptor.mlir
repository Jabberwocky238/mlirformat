"builtin.module"() ({
  "omp.declare_reduction"() <{byref_element_type = !llvm.array<4 x i32>, sym_name = "add_reduction_byref_box_4xi32", type = !llvm.ptr}> ({
    %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %8 = "llvm.alloca"(%7) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr<5>
    %9 = "llvm.addrspacecast"(%8) : (!llvm.ptr<5>) -> !llvm.ptr
    "omp.yield"(%9) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg6: !llvm.ptr, %arg7: !llvm.ptr):
    "omp.yield"(%arg7) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg4: !llvm.ptr, %arg5: !llvm.ptr):
    "omp.yield"(%arg4) : (!llvm.ptr) -> ()
  }, {
  }, {
  }, {
  ^bb0(%arg3: !llvm.ptr):
    %6 = "llvm.getelementptr"(%arg3) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    "omp.yield"(%6) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_array_reduction_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.array<4 x i32>}> : (i64) -> !llvm.ptr<5>
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr
    %3 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "red_array", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.array<4 x i32>}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%3) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr):
      %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      %5 = "llvm.mlir.constant"() <{value = 1000 : i32}> : () -> i32
      "omp.teams"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: true>, reduction_syms = [@add_reduction_byref_box_4xi32]}> ({
      ^bb0(%arg1: !llvm.ptr):
        "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%4, %5, %4) <{loop_inclusive}> ({
              ^bb0(%arg2: i32):
                "omp.yield"() : () -> ()
              }) : (i32, i32, i32) -> ()
            }) {omp.composite} : () -> ()
          }) {omp.composite} : () -> ()
          "omp.terminator"() : () -> ()
        }) {omp.composite} : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui64, "dlti.global_memory_space" = 1 : ui64>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{byref_element_type = !llvm.array<4 x i32>, sym_name = "add_reduction_byref_box_4xi32", type = !llvm.ptr}> ({
    %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %8 = "llvm.alloca"(%7) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i64) -> !llvm.ptr<5>
    %9 = "llvm.addrspacecast"(%8) : (!llvm.ptr<5>) -> !llvm.ptr
    "omp.yield"(%9) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg6: !llvm.ptr, %arg7: !llvm.ptr):
    "omp.yield"(%arg7) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg4: !llvm.ptr, %arg5: !llvm.ptr):
    "omp.yield"(%arg4) : (!llvm.ptr) -> ()
  }, {
  }, {
  }, {
  ^bb0(%arg3: !llvm.ptr):
    %6 = "llvm.getelementptr"(%arg3) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    "omp.yield"(%6) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_array_reduction_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.array<4 x i32>}> : (i64) -> !llvm.ptr<5>
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr
    %3 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "red_array", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.array<4 x i32>}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%3) <{kernel_type = #omp<kernel_type(spmd)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr):
      %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      %5 = "llvm.mlir.constant"() <{value = 1000 : i32}> : () -> i32
      "omp.teams"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: true>, reduction_syms = [@add_reduction_byref_box_4xi32]}> ({
      ^bb0(%arg1: !llvm.ptr):
        "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
          "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
            "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
              "omp.loop_nest"(%4, %5, %4) <{loop_inclusive}> ({
              ^bb0(%arg2: i32):
                "omp.yield"() : () -> ()
              }) : (i32, i32, i32) -> ()
            }) {omp.composite} : () -> ()
          }) {omp.composite} : () -> ()
          "omp.terminator"() : () -> ()
        }) {omp.composite} : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> ()
}) {llvm.target_triple = "nvptx64-nvidia-cuda", omp.is_gpu = true, omp.is_target_device = true} : () -> ()

