"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "has_device_addr", target_cpu = "x86-64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":4:10)
    %1 = "llvm.alloca"(%0) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (i32) -> !llvm.ptr loc("<stdin>":5:10)
    %2 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|always|implicit>, name = "x", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr) -> !llvm.ptr loc("<stdin>":6:10)
    "omp.target"(%2) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
    ^bb0(%arg1: !llvm.ptr loc("<stdin>":8:10)):
      "omp.terminator"() : () -> () loc("<stdin>":9:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":7:5)
    "llvm.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) {llvm.target_triple = "x86_64-unknown-linux-gnu", omp.target_triples = ["amdgcn-amd-amdhsa"], omp.version = #omp.version<version = 52>} : () -> () loc("<stdin>":1:1)
