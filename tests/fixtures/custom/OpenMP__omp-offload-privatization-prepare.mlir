module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>} {
  llvm.func @free(!llvm.ptr)
  llvm.func @malloc(i64) -> !llvm.ptr
  omp.private {type = firstprivate} @firstprivatizer : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.mlir.constant(48 : i64) : i64
    %1 = llvm.call @malloc(%0) : (i64) -> !llvm.ptr
    %2 = llvm.getelementptr %arg1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    llvm.store %1, %2 : !llvm.ptr, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  } copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.mlir.constant(48 : i32) : i32
    "llvm.intr.memcpy"(%arg1, %arg0, %0) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    omp.yield(%arg1 : !llvm.ptr)
  } dealloc {
  ^bb0(%arg0: !llvm.ptr):
    llvm.call @free(%arg0) : (!llvm.ptr) -> ()
    omp.yield
  }
  omp.private {type = firstprivate} @firstprivatizer_1 : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.mlir.constant(48 : i64) : i64
    %1 = llvm.call @malloc(%0) : (i64) -> !llvm.ptr
    %2 = llvm.getelementptr %arg1[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    llvm.store %1, %2 : !llvm.ptr, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  } copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.mlir.constant(48 : i32) : i32
    "llvm.intr.memcpy"(%arg1, %arg0, %0) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    omp.yield(%arg1 : !llvm.ptr)
  } dealloc {
  ^bb0(%arg0: !llvm.ptr):
    llvm.call @free(%arg0) : (!llvm.ptr) -> ()
    omp.yield
  }
  llvm.func internal @firstprivate_test(%arg0: !llvm.ptr {fir.bindc_name = "ptr0"}, %arg1: !llvm.ptr {fir.bindc_name = "ptr1"}) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(0 : index) : i64
    %2 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %3 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> {bindc_name = "local"} : (i32) -> !llvm.ptr
    %4 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> {bindc_name = "glocal"} : (i32) -> !llvm.ptr
    %5 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i32) -> !llvm.ptr
    %6 = llvm.mlir.undef : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    llvm.store %6, %3 : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, !llvm.ptr
    llvm.store %6, %4 : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, !llvm.ptr
    llvm.store %0, %5 : i32, !llvm.ptr
    %7 = omp.map.info var_ptr(%5 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "i"}
    %8 = llvm.getelementptr %3[0, 7, %1, 0] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %9 = llvm.load %8 : !llvm.ptr -> i64
    %10 = llvm.getelementptr %3[0, 7, %1, 1] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %11 = llvm.load %10 : !llvm.ptr -> i64
    %12 = llvm.getelementptr %3[0, 7, %1, 2] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %13 = llvm.load %12 : !llvm.ptr -> i64
    %14 = llvm.sub %11, %1 : i64
    %15 = omp.map.bounds lower_bound(%1 : i64) upper_bound(%14 : i64) extent(%11 : i64) stride(%13 : i64) start_idx(%9 : i64) {stride_in_bytes = true}
    %16 = llvm.getelementptr %3[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %17 = omp.map.info var_ptr(%3 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) map_clauses(to) capture(ByRef) var_ptr_ptr(%16 : !llvm.ptr, i32) bounds(%15) -> !llvm.ptr {name = ""}
    %18 = omp.map.info var_ptr(%3 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) map_clauses(always, to) capture(ByRef) members(%17 : [0] : !llvm.ptr) -> !llvm.ptr
    %19 = llvm.getelementptr %4[0, 7, %1, 0] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %20 = llvm.load %19 : !llvm.ptr -> i64
    %21 = llvm.getelementptr %4[0, 7, %1, 1] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %22 = llvm.load %21 : !llvm.ptr -> i64
    %23 = llvm.getelementptr %4[0, 7, %1, 2] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %24 = llvm.load %23 : !llvm.ptr -> i64
    %25 = llvm.sub %22, %1 : i64
    %26 = omp.map.bounds lower_bound(%1 : i64) upper_bound(%25 : i64) extent(%22 : i64) stride(%24 : i64) start_idx(%20 : i64) {stride_in_bytes = true}
    %27 = llvm.getelementptr %4[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %28 = omp.map.info var_ptr(%4 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) map_clauses(to) capture(ByRef) var_ptr_ptr(%27 : !llvm.ptr, i32) bounds(%26) -> !llvm.ptr {name = ""}
    %29 = omp.map.info var_ptr(%4 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) map_clauses(always, to) capture(ByRef) members(%28 : [0] : !llvm.ptr) -> !llvm.ptr
    omp.target kernel_type(generic) nowait map_entries(%7 -> %arg2, %18 -> %arg3, %17 -> %arg4, %29 -> %arg5, %28 -> %arg6 : !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) private(@firstprivatizer %3 -> %arg7 [map_idx=1], @firstprivatizer_1 %4 -> %arg8 [map_idx=3] : !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    %30 = llvm.mlir.constant(48 : i32) : i32
    %31 = llvm.getelementptr %3[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    %32 = llvm.load %31 : !llvm.ptr -> !llvm.ptr
    llvm.call @free(%32) : (!llvm.ptr) -> ()
    llvm.return
  }
}

