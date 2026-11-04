module attributes {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @main() {
    %0 = llvm.mlir.constant(5 : index) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.addressof @full_arr : !llvm.ptr
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.alloca %4 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> : (i64) -> !llvm.ptr
    %6 = llvm.mlir.addressof @sect_arr : !llvm.ptr
    %7 = llvm.mlir.constant(0 : i64) : i64
    %8 = llvm.getelementptr %3[0, 7, %7, 0] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %9 = llvm.load %8 : !llvm.ptr -> i64
    %10 = llvm.getelementptr %3[0, 7, %7, 1] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %11 = llvm.load %10 : !llvm.ptr -> i64
    %12 = llvm.getelementptr %3[0, 7, %7, 2] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %13 = llvm.load %12 : !llvm.ptr -> i64
    %14 = llvm.sub %11, %2 : i64
    %15 = omp.map.bounds lower_bound(%7 : i64) upper_bound(%14 : i64) extent(%11 : i64) stride(%13 : i64) start_idx(%9 : i64) {stride_in_bytes = true}
    %16 = llvm.getelementptr %3[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %17 = omp.map.info var_ptr(%3 : !llvm.ptr, f32) map_clauses(tofrom) capture(ByRef) var_ptr_ptr(%16 : !llvm.ptr) bounds(%15) -> !llvm.ptr {name = "full_arr"}
    %18 = omp.map.info var_ptr(%3 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) map_clauses(tofrom) capture(ByRef) members(%17 : [0] : !llvm.ptr) -> !llvm.ptr {name = "full_arr"}
    %19 = llvm.getelementptr %6[0, 7, %7, 0] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %20 = llvm.load %19 : !llvm.ptr -> i64
    %21 = llvm.getelementptr %6[0, 7, %7, 1] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %22 = llvm.load %21 : !llvm.ptr -> i64
    %23 = llvm.getelementptr %6[0, 7, %7, 2] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %24 = llvm.load %23 : !llvm.ptr -> i64
    %25 = llvm.sub %1, %20 : i64
    %26 = llvm.sub %0, %20 : i64
    %27 = omp.map.bounds lower_bound(%25 : i64) upper_bound(%26 : i64) extent(%22 : i64) stride(%24 : i64) start_idx(%20 : i64) {stride_in_bytes = true}
    %28 = llvm.getelementptr %6[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %29 = omp.map.info var_ptr(%6 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) var_ptr_ptr(%28 : !llvm.ptr) bounds(%27) -> !llvm.ptr {name = "sect_arr(2:5)"}
    %30 = omp.map.info var_ptr(%6 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) map_clauses(tofrom) capture(ByRef) members(%29 : [0] : !llvm.ptr) -> !llvm.ptr {name = "sect_arr(2:5)"}
    %31 = llvm.getelementptr %5[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>
    %32 = omp.map.info var_ptr(%5 : !llvm.ptr, f32) map_clauses(tofrom) capture(ByRef) var_ptr_ptr(%31 : !llvm.ptr) -> !llvm.ptr {name = "scalar"}
    %33 = omp.map.info var_ptr(%5 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(tofrom) capture(ByRef) members(%32 : [0] : !llvm.ptr) -> !llvm.ptr {name = "scalar"}
    omp.target map_entries(%17 -> %arg0, %18 -> %arg1, %29 -> %arg2, %30 -> %arg3, %32 -> %arg4, %33 -> %arg5 : !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
  llvm.mlir.global internal @full_arr() {addr_space = 0 : i32} : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    llvm.return %0 : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
  }
  llvm.mlir.global internal @sect_arr() {addr_space = 0 : i32} : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    llvm.return %0 : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
  }
}

