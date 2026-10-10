module attributes {dlti.dl_spec = #dlti.dl_spec<i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i64 = dense<[32, 64]> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>>} {
  llvm.func @foo(%arg0: !llvm.ptr, %arg1: i32) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.getelementptr %arg0[%0, 1, %arg1] : (!llvm.ptr, i32, i32) -> !llvm.ptr, !llvm.struct<"my_struct", (struct<"sub_struct", (i32, i8)>, array<4 x i32>)>
    llvm.return
  }
}

