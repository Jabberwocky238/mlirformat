module attributes {omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @_QPopenmp_target_data() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "i", in_type = i32, operand_segment_sizes = array<i32: 0, 0>, uniq_name = "_QFopenmp_target_dataEi"} : (i64) -> !llvm.ptr
    %2 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target_data map_entries(%2 : !llvm.ptr) {
      %3 = llvm.mlir.constant(99 : i32) : i32
      llvm.store %3, %1 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

// -----
module attributes {omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @_QPopenmp_target_data_region(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(1023 : index) : i64
    %1 = llvm.mlir.constant(0 : index) : i64
    %2 = llvm.mlir.constant(1024 : index) : i64
    %3 = llvm.mlir.constant(1 : index) : i64
    %4 = omp.map.bounds lower_bound(%1 : i64) upper_bound(%0 : i64) extent(%2 : i64) stride(%3 : i64) start_idx(%3 : i64)
    %5 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.array<1024 x i32>) map_clauses(from) capture(ByRef) bounds(%4) -> !llvm.ptr {name = ""}
    omp.target_data map_entries(%5 : !llvm.ptr) {
      %6 = llvm.mlir.constant(99 : i32) : i32
      %7 = llvm.mlir.constant(1 : i64) : i64
      %8 = llvm.mlir.constant(1 : i64) : i64
      %9 = llvm.mlir.constant(0 : i64) : i64
      %10 = llvm.getelementptr %arg0[0, %9] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
      llvm.store %6, %10 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

// -----
module attributes {omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @_QPomp_target_enter_exit(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "dvc", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFomp_target_enter_exitEdvc"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "i", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFomp_target_enter_exitEi"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(5 : i32) : i32
    llvm.store %4, %3 : i32, !llvm.ptr
    %5 = llvm.mlir.constant(2 : i32) : i32
    llvm.store %5, %1 : i32, !llvm.ptr
    %6 = llvm.load %3 : !llvm.ptr -> i32
    %7 = llvm.mlir.constant(10 : i32) : i32
    %8 = llvm.icmp "slt" %6, %7 : i32
    %9 = llvm.load %1 : !llvm.ptr -> i32
    %10 = llvm.mlir.constant(1023 : index) : i64
    %11 = llvm.mlir.constant(0 : index) : i64
    %12 = llvm.mlir.constant(1024 : index) : i64
    %13 = llvm.mlir.constant(1 : index) : i64
    %14 = omp.map.bounds lower_bound(%11 : i64) upper_bound(%10 : i64) extent(%12 : i64) stride(%13 : i64) start_idx(%13 : i64)
    %15 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.array<1024 x i32>) map_clauses(to) capture(ByRef) bounds(%14) -> !llvm.ptr {name = ""}
    %16 = llvm.mlir.constant(511 : index) : i64
    %17 = llvm.mlir.constant(0 : index) : i64
    %18 = llvm.mlir.constant(512 : index) : i64
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = omp.map.bounds lower_bound(%17 : i64) upper_bound(%16 : i64) extent(%18 : i64) stride(%19 : i64) start_idx(%19 : i64)
    %21 = omp.map.info var_ptr(%arg1 : !llvm.ptr, !llvm.array<512 x i32>) map_clauses(none) capture(ByRef) bounds(%20) -> !llvm.ptr {name = ""}
    omp.target_enter_data device(%9 : i32) if(%8) map_entries(%15, %21 : !llvm.ptr, !llvm.ptr)
    %22 = llvm.load %3 : !llvm.ptr -> i32
    %23 = llvm.mlir.constant(10 : i32) : i32
    %24 = llvm.icmp "sgt" %22, %23 : i32
    %25 = llvm.load %1 : !llvm.ptr -> i32
    %26 = llvm.mlir.constant(1023 : index) : i64
    %27 = llvm.mlir.constant(0 : index) : i64
    %28 = llvm.mlir.constant(1024 : index) : i64
    %29 = llvm.mlir.constant(1 : index) : i64
    %30 = omp.map.bounds lower_bound(%27 : i64) upper_bound(%26 : i64) extent(%28 : i64) stride(%29 : i64) start_idx(%29 : i64)
    %31 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.array<1024 x i32>) map_clauses(from) capture(ByRef) bounds(%30) -> !llvm.ptr {name = ""}
    %32 = llvm.mlir.constant(511 : index) : i64
    %33 = llvm.mlir.constant(0 : index) : i64
    %34 = llvm.mlir.constant(512 : index) : i64
    %35 = llvm.mlir.constant(1 : index) : i64
    %36 = omp.map.bounds lower_bound(%33 : i64) upper_bound(%32 : i64) extent(%34 : i64) stride(%35 : i64) start_idx(%35 : i64)
    %37 = omp.map.info var_ptr(%arg1 : !llvm.ptr, !llvm.array<512 x i32>) map_clauses(none) capture(ByRef) bounds(%36) -> !llvm.ptr {name = ""}
    omp.target_exit_data device(%25 : i32) if(%24) map_entries(%31, %37 : !llvm.ptr, !llvm.ptr)
    llvm.return
  }
}

// -----
module attributes {omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @_QPopenmp_target_use_dev_ptr() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.ptr : (i64) -> !llvm.ptr
    %2 = omp.map.info var_ptr(%1 : !llvm.ptr, !llvm.ptr) map_clauses(from) capture(ByRef) -> !llvm.ptr {name = ""}
    %3 = omp.map.info var_ptr(%1 : !llvm.ptr, !llvm.ptr) map_clauses(from) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target_data map_entries(%2 : !llvm.ptr) use_device_ptr(%3 -> %arg0 : !llvm.ptr) {
      %4 = llvm.mlir.constant(10 : i32) : i32
      %5 = llvm.load %arg0 : !llvm.ptr -> !llvm.ptr
      llvm.store %4, %5 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

// -----
module attributes {omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @_QPopenmp_target_use_dev_addr() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.ptr : (i64) -> !llvm.ptr
    %2 = omp.map.info var_ptr(%1 : !llvm.ptr, !llvm.ptr) map_clauses(from) capture(ByRef) -> !llvm.ptr {name = ""}
    %3 = omp.map.info var_ptr(%1 : !llvm.ptr, !llvm.ptr) map_clauses(from) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target_data map_entries(%2 : !llvm.ptr) use_device_addr(%3 -> %arg0 : !llvm.ptr) {
      %4 = llvm.mlir.constant(10 : i32) : i32
      %5 = llvm.load %arg0 : !llvm.ptr -> !llvm.ptr
      llvm.store %4, %5 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

// -----
module attributes {omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @_QPopenmp_target_use_dev_addr_no_ptr() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr
    %2 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    %3 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target_data map_entries(%2 : !llvm.ptr) use_device_addr(%3 -> %arg0 : !llvm.ptr) {
      %4 = llvm.mlir.constant(10 : i32) : i32
      llvm.store %4, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

// -----
module attributes {omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @_QPopenmp_target_use_dev_addr_nomap() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.ptr : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %0 x !llvm.ptr : (i64) -> !llvm.ptr
    %4 = omp.map.info var_ptr(%3 : !llvm.ptr, !llvm.ptr) map_clauses(from) capture(ByRef) -> !llvm.ptr {name = ""}
    %5 = omp.map.info var_ptr(%1 : !llvm.ptr, !llvm.ptr) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target_data map_entries(%4 : !llvm.ptr) use_device_addr(%5 -> %arg0 : !llvm.ptr) {
      %6 = llvm.mlir.constant(10 : i32) : i32
      %7 = llvm.load %arg0 : !llvm.ptr -> !llvm.ptr
      llvm.store %6, %7 : i32, !llvm.ptr
      %8 = llvm.mlir.constant(20 : i32) : i32
      %9 = llvm.load %3 : !llvm.ptr -> !llvm.ptr
      llvm.store %8, %9 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

// -----
module attributes {omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @_QPopenmp_target_use_dev_both() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.ptr : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %0 x !llvm.ptr : (i64) -> !llvm.ptr
    %4 = omp.map.info var_ptr(%1 : !llvm.ptr, !llvm.ptr) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    %5 = omp.map.info var_ptr(%3 : !llvm.ptr, !llvm.ptr) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    %6 = omp.map.info var_ptr(%1 : !llvm.ptr, !llvm.ptr) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    %7 = omp.map.info var_ptr(%3 : !llvm.ptr, !llvm.ptr) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target_data map_entries(%4, %5 : !llvm.ptr, !llvm.ptr) use_device_addr(%7 -> %arg0 : !llvm.ptr) use_device_ptr(%6 -> %arg1 : !llvm.ptr) {
      %8 = llvm.mlir.constant(10 : i32) : i32
      %9 = llvm.load %arg1 : !llvm.ptr -> !llvm.ptr
      llvm.store %8, %9 : i32, !llvm.ptr
      %10 = llvm.mlir.constant(20 : i32) : i32
      %11 = llvm.load %arg0 : !llvm.ptr -> !llvm.ptr
      llvm.store %10, %11 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

// -----
module attributes {omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @_QPopenmp_target_data_update() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "i", in_type = i32, operand_segment_sizes = array<i32: 0, 0>, uniq_name = "_QFopenmp_target_dataEi"} : (i64) -> !llvm.ptr
    %2 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target_data map_entries(%2 : !llvm.ptr) {
      %3 = llvm.mlir.constant(99 : i32) : i32
      llvm.store %3, %1 : i32, !llvm.ptr
      omp.terminator
    }
    omp.target_update map_entries(%2 : !llvm.ptr)
    llvm.return
  }
}

// -----
module attributes {omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  omp.declare_mapper @_QQFmy_testmy_mapper : !llvm.struct<"_QFmy_testTmy_type", (i32)> {
  ^bb0(%arg0: !llvm.ptr):
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.getelementptr %arg0[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"_QFmy_testTmy_type", (i32)>
    %2 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = "var%data"}
    %3 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<"_QFmy_testTmy_type", (i32)>) map_clauses(tofrom) capture(ByRef) members(%2 : [0] : !llvm.ptr) -> !llvm.ptr {name = "var", partial_map = true}
    omp.declare_mapper.info map_entries(%3, %2 : !llvm.ptr, !llvm.ptr)
  }
  llvm.func @_QPopenmp_target_data_mapper() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<"_QFmy_testTmy_type", (i32)> {bindc_name = "a"} : (i64) -> !llvm.ptr
    %2 = omp.map.info var_ptr(%1 : !llvm.ptr, !llvm.struct<"_QFmy_testTmy_type", (i32)>) map_clauses(tofrom) capture(ByRef) mapper(@_QQFmy_testmy_mapper) -> !llvm.ptr {name = "a"}
    omp.target_data map_entries(%2 : !llvm.ptr) {
      %3 = llvm.mlir.constant(10 : i32) : i32
      %4 = llvm.getelementptr %1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"_QFmy_testTmy_type", (i32)>
      llvm.store %3, %4 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

// -----
module attributes {omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @_QPomp_target_is_device_ptr(%arg0: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.ptr) map_clauses(is_device_ptr) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target kernel_type(generic) map_entries(%0 -> %arg1 : !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

