module attributes {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"], omp.version = #omp.version<version = 50>} {
  llvm.func @mix_use_device_ptr_and_addr_and_map_(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: !llvm.ptr, %arg6: !llvm.ptr, %arg7: !llvm.ptr) {
    %0 = llvm.mlir.constant(0 : index) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = omp.map.bounds lower_bound(%0 : i64) upper_bound(%1 : i64) extent(%1 : i64) stride(%2 : i64) start_idx(%0 : i64) {stride_in_bytes = true}
    %4 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(i64)>) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr
    %5 = omp.map.info var_ptr(%arg1 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr
    %6 = omp.map.info var_ptr(%arg2 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) map_clauses(tofrom) capture(ByRef) var_ptr_ptr(%arg3 : !llvm.ptr, i32) bounds(%3) -> !llvm.ptr
    %7 = omp.map.info var_ptr(%arg2 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) map_clauses(tofrom) capture(ByRef) members(%6 : [0] : !llvm.ptr) -> !llvm.ptr
    %8 = omp.map.info var_ptr(%arg4 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(tofrom) capture(ByRef) var_ptr_ptr(%arg5 : !llvm.ptr, f32) -> !llvm.ptr
    %9 = omp.map.info var_ptr(%arg4 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(tofrom) capture(ByRef) members(%8 : [0] : !llvm.ptr) -> !llvm.ptr
    %10 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(i64)>) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr
    omp.target_data map_entries(%4, %5 : !llvm.ptr, !llvm.ptr) use_device_addr(%7 -> %arg8, %9 -> %arg9, %6 -> %arg10, %8 -> %arg11 : !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) use_device_ptr(%10 -> %arg12 : !llvm.ptr) {
      %11 = llvm.getelementptr %arg4[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(i64)>
      %12 = llvm.getelementptr %arg7[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(i64)>
      %13 = llvm.load %11 : !llvm.ptr -> i64
      llvm.store %13, %12 : i64, !llvm.ptr
      %14 = llvm.mlir.constant(48 : i32) : i32
      "llvm.intr.memcpy"(%arg6, %arg8, %14) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
      %15 = llvm.getelementptr %arg6[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
      %16 = llvm.load %15 : !llvm.ptr -> !llvm.ptr
      %17 = llvm.getelementptr %16[%1] : (!llvm.ptr, i64) -> !llvm.ptr, i8
      %18 = llvm.load %17 : !llvm.ptr -> i32
      llvm.store %18, %arg1 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  llvm.func @mix_use_device_ptr_and_addr_and_map_2(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: !llvm.ptr, %arg6: !llvm.ptr, %arg7: !llvm.ptr) {
    %0 = llvm.mlir.constant(0 : index) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = omp.map.bounds lower_bound(%0 : i64) upper_bound(%1 : i64) extent(%1 : i64) stride(%2 : i64) start_idx(%0 : i64) {stride_in_bytes = true}
    %4 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(i64)>) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr
    %5 = omp.map.info var_ptr(%arg1 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr
    %6 = omp.map.info var_ptr(%arg2 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) map_clauses(tofrom) capture(ByRef) var_ptr_ptr(%arg3 : !llvm.ptr, i32) bounds(%3) -> !llvm.ptr
    %7 = omp.map.info var_ptr(%arg2 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) map_clauses(tofrom) capture(ByRef) members(%6 : [0] : !llvm.ptr) -> !llvm.ptr
    %8 = omp.map.info var_ptr(%arg4 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(tofrom) capture(ByRef) var_ptr_ptr(%arg5 : !llvm.ptr, f32) -> !llvm.ptr
    %9 = omp.map.info var_ptr(%arg4 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(tofrom) capture(ByRef) members(%8 : [0] : !llvm.ptr) -> !llvm.ptr
    %10 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(i64)>) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr
    omp.target_data map_entries(%5, %4 : !llvm.ptr, !llvm.ptr) use_device_addr(%8 -> %arg8, %6 -> %arg9, %7 -> %arg10, %9 -> %arg11 : !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) use_device_ptr(%10 -> %arg12 : !llvm.ptr) {
      %11 = llvm.getelementptr %arg4[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(i64)>
      %12 = llvm.getelementptr %arg7[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(i64)>
      %13 = llvm.load %11 : !llvm.ptr -> i64
      llvm.store %13, %12 : i64, !llvm.ptr
      %14 = llvm.mlir.constant(48 : i32) : i32
      "llvm.intr.memcpy"(%arg6, %arg10, %14) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
      %15 = llvm.getelementptr %arg6[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
      %16 = llvm.load %15 : !llvm.ptr -> !llvm.ptr
      %17 = llvm.getelementptr %16[%1] : (!llvm.ptr, i64) -> !llvm.ptr, i8
      %18 = llvm.load %17 : !llvm.ptr -> i32
      llvm.store %18, %arg1 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

