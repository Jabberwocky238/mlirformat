module {
  omp.private {type = private} @simple_var.privatizer : i32
  llvm.func @target_map_single_private() attributes {fir.internal_name = "_QPtarget_map_single_private"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "simple_var"} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x i32 {bindc_name = "a"} : (i64) -> !llvm.ptr
    %3 = llvm.mlir.constant(2 : i32) : i32
    llvm.store %3, %2 : i32, !llvm.ptr
    %4 = omp.map.info var_ptr(%2 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) -> !llvm.ptr {name = "a"}
    omp.target kernel_type(generic) map_entries(%4 -> %arg0 : !llvm.ptr) private(@simple_var.privatizer %1 -> %arg1 : !llvm.ptr) {
      %5 = llvm.mlir.constant(10 : i32) : i32
      %6 = llvm.load %arg0 : !llvm.ptr -> i32
      %7 = llvm.add %6, %5 : i32
      llvm.store %7, %arg1 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  omp.private {type = private} @n.privatizer : f32
  llvm.func @target_map_2_privates() attributes {fir.internal_name = "_QPtarget_map_2_privates"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "simple_var"} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x f32 {bindc_name = "n"} : (i64) -> !llvm.ptr
    %3 = llvm.alloca %0 x i32 {bindc_name = "a"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(2 : i32) : i32
    llvm.store %4, %3 : i32, !llvm.ptr
    %5 = omp.map.info var_ptr(%3 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) -> !llvm.ptr {name = "a"}
    omp.target kernel_type(generic) map_entries(%5 -> %arg0 : !llvm.ptr) private(@simple_var.privatizer %1 -> %arg1, @n.privatizer %2 -> %arg2 : !llvm.ptr, !llvm.ptr) {
      %6 = llvm.mlir.constant(1.100000e+01 : f32) : f32
      %7 = llvm.mlir.constant(10 : i32) : i32
      %8 = llvm.load %arg0 : !llvm.ptr -> i32
      %9 = llvm.add %8, %7 : i32
      llvm.store %9, %arg1 : i32, !llvm.ptr
      %10 = llvm.load %arg1 : !llvm.ptr -> i32
      %11 = llvm.sitofp %10 : i32 to f32
      %12 = llvm.fadd %11, %6 {fastmathFlags = #llvm.fastmath<contract>} : f32
      llvm.store %12, %arg2 : f32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  omp.private {type = private} @multi_block.privatizer : f32 init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    omp.yield(%arg1 : !llvm.ptr)
  }
  llvm.func @target_op_private_multi_block(%arg0: !llvm.ptr) {
    omp.target kernel_type(generic) private(@multi_block.privatizer %arg0 -> %arg1 : !llvm.ptr) {
      %0 = llvm.load %arg1 : !llvm.ptr -> f32
      omp.terminator
    }
    llvm.return
  }
  omp.private {type = private} @_QFtarget_boxcharEchar_var_private_boxchar_c8xU : !llvm.struct<(ptr, i64)> init {
  ^bb0(%arg0: !llvm.struct<(ptr, i64)>, %arg1: !llvm.struct<(ptr, i64)>):
    %0 = llvm.extractvalue %arg0[0] : !llvm.struct<(ptr, i64)> 
    %1 = llvm.extractvalue %arg0[1] : !llvm.struct<(ptr, i64)> 
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %1 x i8 {bindc_name = "char_var", pinned} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.undef : !llvm.struct<(ptr, i64)>
    %5 = llvm.insertvalue %3, %4[0] : !llvm.struct<(ptr, i64)> 
    %6 = llvm.insertvalue %1, %5[1] : !llvm.struct<(ptr, i64)> 
    omp.yield(%6 : !llvm.struct<(ptr, i64)>)
  }
  llvm.func @target_boxchar_(%arg0: !llvm.ptr {fir.bindc_name = "l"}) attributes {fir.internal_name = "_QPtarget_boxchar"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "mapped_var"} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x !llvm.struct<(ptr, i64)> : (i64) -> !llvm.ptr
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.load %arg0 : !llvm.ptr -> i64
    %5 = llvm.icmp "sgt" %4, %3 : i64
    %6 = llvm.select %5, %4, %3 : i1, i64
    %7 = llvm.alloca %6 x i8 {bindc_name = "char_var"} : (i64) -> !llvm.ptr
    %8 = llvm.mlir.undef : !llvm.struct<(ptr, i64)>
    %9 = llvm.insertvalue %7, %8[0] : !llvm.struct<(ptr, i64)> 
    %10 = llvm.insertvalue %6, %9[1] : !llvm.struct<(ptr, i64)> 
    %11 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "mapped_var"}
    llvm.store %10, %2 : !llvm.struct<(ptr, i64)>, !llvm.ptr
    %12 = omp.map.info var_ptr(%2 : !llvm.ptr, !llvm.struct<(ptr, i64)>) map_clauses(to) capture(ByRef) -> !llvm.ptr
    omp.target kernel_type(generic) map_entries(%11 -> %arg1, %12 -> %arg2 : !llvm.ptr, !llvm.ptr) private(@_QFtarget_boxcharEchar_var_private_boxchar_c8xU %10 -> %arg3 [map_idx=1] : !llvm.struct<(ptr, i64)>) {
      %13 = llvm.mlir.constant(0 : index) : i64
      %14 = llvm.mlir.constant(32 : i8) : i8
      %15 = llvm.mlir.constant(1 : index) : i64
      %16 = llvm.mlir.constant(false) : i1
      %17 = llvm.mlir.constant(5 : index) : i64
      %18 = llvm.mlir.constant(5 : i32) : i32
      %19 = llvm.extractvalue %arg3[0] : !llvm.struct<(ptr, i64)> 
      %20 = llvm.extractvalue %arg3[1] : !llvm.struct<(ptr, i64)> 
      llvm.store %18, %arg1 : i32, !llvm.ptr
      %21 = llvm.mlir.addressof @_QQclX68656C6C6F : !llvm.ptr
      %22 = llvm.icmp "slt" %20, %17 : i64
      %23 = llvm.select %22, %20, %17 : i1, i64
      llvm.call @llvm.memmove.p0.p0.i64(%19, %21, %23, %16) : (!llvm.ptr, !llvm.ptr, i64, i1) -> ()
      %24 = llvm.sub %20, %15 : i64
      %25 = llvm.mlir.undef : !llvm.array<1 x i8>
      %26 = llvm.insertvalue %14, %25[0] : !llvm.array<1 x i8> 
      %27 = llvm.sub %24, %23 : i64
      %28 = llvm.add %27, %15 : i64
      llvm.br ^bb1(%23, %28 : i64, i64)
    ^bb1(%29: i64, %30: i64):  // 2 preds: ^bb0, ^bb2
      %31 = llvm.icmp "sgt" %30, %13 : i64
      llvm.cond_br %31, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      %32 = llvm.getelementptr %19[%29] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1 x i8>
      llvm.store %26, %32 : !llvm.array<1 x i8>, !llvm.ptr
      %33 = llvm.add %29, %15 : i64
      %34 = llvm.sub %30, %15 : i64
      llvm.br ^bb1(%33, %34 : i64, i64)
    ^bb3:  // pred: ^bb1
      omp.terminator
    }
    llvm.return
  }
  llvm.mlir.global linkonce constant @_QQclX68656C6C6F() comdat(@__llvm_comdat::@_QQclX68656C6C6F) {addr_space = 0 : i32} : !llvm.array<5 x i8> {
    %0 = llvm.mlir.constant("hello") : !llvm.array<5 x i8>
    llvm.return %0 : !llvm.array<5 x i8>
  }
  llvm.comdat @__llvm_comdat {
    llvm.comdat_selector @_QQclX68656C6C6F any
  }
  llvm.func @llvm.memmove.p0.p0.i64(!llvm.ptr, !llvm.ptr, i64, i1) attributes {sym_visibility = "private"}
  omp.private {type = firstprivate} @sf.firstprivate : f32 copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> f32
    llvm.store %0, %arg1 : f32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  }
  omp.private {type = firstprivate} @sv.firstprivate : i32 copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> i32
    llvm.store %0, %arg1 : i32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  }
  llvm.func @target_firstprivate_() attributes {fir.internal_name = "_QPtarget_firstprivate"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "sv"} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x f32 {bindc_name = "sf"} : (i64) -> !llvm.ptr
    %3 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) -> !llvm.ptr
    %4 = omp.map.info var_ptr(%2 : !llvm.ptr, f32) map_clauses(to) capture(ByRef) -> !llvm.ptr
    omp.target kernel_type(generic) map_entries(%3 -> %arg0, %4 -> %arg1 : !llvm.ptr, !llvm.ptr) private(@sv.firstprivate %1 -> %arg2 [map_idx=0], @sf.firstprivate %2 -> %arg3 [map_idx=1] : !llvm.ptr, !llvm.ptr) {
      %5 = llvm.mlir.constant(2.000000e+00 : f64) : f64
      %6 = llvm.mlir.constant(10 : i32) : i32
      %7 = llvm.load %arg2 : !llvm.ptr -> i32
      %8 = llvm.add %7, %6 : i32
      llvm.store %8, %arg2 : i32, !llvm.ptr
      %9 = llvm.load %arg3 : !llvm.ptr -> f32
      %10 = llvm.fpext %9 : f32 to f64
      %11 = llvm.fadd %10, %5 {fastmathFlags = #llvm.fastmath<contract>} : f64
      %12 = llvm.fptrunc %11 : f64 to f32
      llvm.store %12, %arg3 : f32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

