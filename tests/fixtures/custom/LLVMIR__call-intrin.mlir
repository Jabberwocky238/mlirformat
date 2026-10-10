module {
  llvm.func @round_sse41() -> vector<4xf32> {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(dense<2.000000e-01> : vector<4xf32>) : vector<4xf32>
    %2 = llvm.call_intrinsic "llvm.x86.sse41.round.ss"(%1, %1, %0) {fastmathFlags = #llvm.fastmath<reassoc>} : (vector<4xf32>, vector<4xf32>, i32) -> vector<4xf32>
    llvm.return %2 : vector<4xf32>
  }
}

// -----
module {
  llvm.func @round_overloaded() -> f32 {
    %0 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    %1 = llvm.call_intrinsic "llvm.round"(%0) : (f32) -> f32
    llvm.return %1 : f32
  }
}

// -----
module {
  llvm.func @lifetime_start() {
    %0 = llvm.mlir.constant(1 : i8) : i8
    %1 = llvm.alloca %0 x f32 : (i8) -> !llvm.ptr
    llvm.call_intrinsic "llvm.lifetime.start"(%1) : (!llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @variadic() {
    %0 = llvm.mlir.constant(1 : i8) : i8
    %1 = llvm.alloca %0 x f32 : (i8) -> !llvm.ptr
    llvm.call_intrinsic "llvm.localescape"(%1, %1) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @no_intrinsic() {
    llvm.call_intrinsic "llvm.does_not_exist"() : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @bad_types() {
    %0 = llvm.mlir.constant(1 : i8) : i8
    %1 = llvm.call_intrinsic "llvm.round"(%0) : (i8) -> i8
    llvm.return
  }
}

// -----
module {
  llvm.func @bad_result() {
    llvm.call_intrinsic "llvm.x86.sse41.round.ss"() : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @bad_result() {
    %0 = llvm.call_intrinsic "llvm.x86.sse41.round.ss"() : () -> vector<8xf32>
    llvm.return
  }
}

// -----
module {
  llvm.func @bad_args() {
    %0 = llvm.call_intrinsic "llvm.x86.sse41.round.ss"() : () -> vector<4xf32>
    llvm.return
  }
}

// -----
module {
  llvm.func @bad_args() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(dense<2.000000e-01> : vector<4xf32>) : vector<4xf32>
    %2 = llvm.call_intrinsic "llvm.x86.sse41.round.ss"(%1, %1, %0) {fastmathFlags = #llvm.fastmath<reassoc>} : (vector<4xf32>, vector<4xf32>, i64) -> vector<4xf32>
    llvm.return
  }
}

// -----
module {
  llvm.func @intrinsic_call_arg_attrs(%arg0: i32) -> i32 {
    %0 = llvm.call_intrinsic "llvm.riscv.sha256sig0"(%arg0) : (i32 {llvm.signext}) -> i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @intrinsic_element_type(%arg0: !llvm.ptr) {
    %0 = llvm.call_intrinsic "llvm.aarch64.ldxr.p0"(%arg0) : (!llvm.ptr {llvm.elementtype = i8}) -> i64
    llvm.return
  }
}

