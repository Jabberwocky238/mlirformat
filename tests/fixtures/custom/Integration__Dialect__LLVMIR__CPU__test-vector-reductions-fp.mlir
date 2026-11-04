module {
  llvm.func @printNewline()
  llvm.func @printF32(f32)
  llvm.func @entry() {
    %0 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    %1 = llvm.mlir.constant(2.000000e+00 : f32) : f32
    %2 = llvm.mlir.constant(3.000000e+00 : f32) : f32
    %3 = llvm.mlir.constant(4.000000e+00 : f32) : f32
    %4 = llvm.mlir.undef : vector<4xf32>
    %5 = llvm.mlir.constant(0 : index) : i64
    %6 = llvm.insertelement %0, %4[%5 : i64] : vector<4xf32>
    %7 = llvm.shufflevector %6, %4 [0, 0, 0, 0] : vector<4xf32> 
    %8 = llvm.mlir.constant(1 : i64) : i64
    %9 = llvm.insertelement %1, %7[%8 : i64] : vector<4xf32>
    %10 = llvm.mlir.constant(2 : i64) : i64
    %11 = llvm.insertelement %2, %9[%10 : i64] : vector<4xf32>
    %12 = llvm.mlir.constant(3 : i64) : i64
    %13 = llvm.insertelement %3, %11[%12 : i64] : vector<4xf32>
    %14 = llvm.intr.vector.reduce.fmax(%13) : (vector<4xf32>) -> f32
    llvm.call @printF32(%14) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    %15 = llvm.intr.vector.reduce.fmin(%13) : (vector<4xf32>) -> f32
    llvm.call @printF32(%15) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    %16 = llvm.intr.vector.reduce.fmaximum(%13) : (vector<4xf32>) -> f32
    llvm.call @printF32(%16) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    %17 = llvm.intr.vector.reduce.fminimum(%13) : (vector<4xf32>) -> f32
    llvm.call @printF32(%17) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    %18 = "llvm.intr.vector.reduce.fadd"(%0, %13) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<4xf32>) -> f32
    llvm.call @printF32(%18) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    %19 = "llvm.intr.vector.reduce.fadd"(%0, %13) <{fastmathFlags = #llvm.fastmath<none>}> {reassoc = true} : (f32, vector<4xf32>) -> f32
    llvm.call @printF32(%19) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    %20 = "llvm.intr.vector.reduce.fadd"(%1, %13) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<4xf32>) -> f32
    llvm.call @printF32(%20) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    %21 = "llvm.intr.vector.reduce.fadd"(%1, %13) <{fastmathFlags = #llvm.fastmath<none>}> {reassoc = true} : (f32, vector<4xf32>) -> f32
    llvm.call @printF32(%21) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    %22 = "llvm.intr.vector.reduce.fmul"(%0, %13) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<4xf32>) -> f32
    llvm.call @printF32(%22) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    %23 = "llvm.intr.vector.reduce.fmul"(%0, %13) <{fastmathFlags = #llvm.fastmath<none>}> {reassoc = true} : (f32, vector<4xf32>) -> f32
    llvm.call @printF32(%23) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    %24 = "llvm.intr.vector.reduce.fmul"(%1, %13) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<4xf32>) -> f32
    llvm.call @printF32(%24) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    %25 = "llvm.intr.vector.reduce.fmul"(%1, %13) <{fastmathFlags = #llvm.fastmath<none>}> {reassoc = true} : (f32, vector<4xf32>) -> f32
    llvm.call @printF32(%25) : (f32) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.return
  }
}

