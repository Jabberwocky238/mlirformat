module {
  gpu.module @test_module {
    func.func @gpu_wmma_load_op() -> !gpu.mma_matrix<16x16xf16, "AOp"> {
      %alloca = memref.alloca() {alignment = 32 : i64} : memref<32x32xf16, 3>
      %c16 = arith.constant 16 : index
      %c16_0 = arith.constant 16 : index
      %0 = gpu.subgroup_mma_load_matrix %alloca[%c16, %c16_0] {leadDimension = 32 : index, transpose} : memref<32x32xf16, 3> -> !gpu.mma_matrix<16x16xf16, "AOp">
      return %0 : !gpu.mma_matrix<16x16xf16, "AOp">
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_wmma_int8_load_op() -> !gpu.mma_matrix<16x16xsi8, "AOp"> {
      %alloca = memref.alloca() {alignment = 32 : i64} : memref<32x32xi8, 3>
      %c16 = arith.constant 16 : index
      %c16_0 = arith.constant 16 : index
      %0 = gpu.subgroup_mma_load_matrix %alloca[%c16, %c16_0] {leadDimension = 32 : index, transpose} : memref<32x32xi8, 3> -> !gpu.mma_matrix<16x16xsi8, "AOp">
      return %0 : !gpu.mma_matrix<16x16xsi8, "AOp">
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_wmma_f64_load_op() -> !gpu.mma_matrix<8x4xf64, "AOp"> {
      %alloca = memref.alloca() {alignment = 32 : i64} : memref<32x32xf64, 3>
      %c16 = arith.constant 16 : index
      %c16_0 = arith.constant 16 : index
      %0 = gpu.subgroup_mma_load_matrix %alloca[%c16, %c16_0] {leadDimension = 32 : index} : memref<32x32xf64, 3> -> !gpu.mma_matrix<8x4xf64, "AOp">
      return %0 : !gpu.mma_matrix<8x4xf64, "AOp">
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_wmma_store_op(%arg0: !gpu.mma_matrix<16x16xf16, "COp">) {
      %alloca = memref.alloca() {alignment = 32 : i64} : memref<32x32xf16, 3>
      %c16 = arith.constant 16 : index
      %c16_0 = arith.constant 16 : index
      gpu.subgroup_mma_store_matrix %arg0, %alloca[%c16, %c16_0] {leadDimension = 32 : index, transpose} : !gpu.mma_matrix<16x16xf16, "COp">, memref<32x32xf16, 3>
      return
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_wmma_mma_op(%arg0: !gpu.mma_matrix<16x16xf16, "AOp">, %arg1: !gpu.mma_matrix<16x16xf16, "BOp">, %arg2: !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp"> {
      %0 = gpu.subgroup_mma_compute %arg0, %arg1, %arg2 {a_transpose} : !gpu.mma_matrix<16x16xf16, "AOp">, !gpu.mma_matrix<16x16xf16, "BOp"> -> !gpu.mma_matrix<16x16xf16, "COp">
      return %0 : !gpu.mma_matrix<16x16xf16, "COp">
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_wmma_mma_int8_op(%arg0: !gpu.mma_matrix<32x16xsi8, "AOp">, %arg1: !gpu.mma_matrix<16x8xsi8, "BOp">, %arg2: !gpu.mma_matrix<32x8xi32, "COp">) -> !gpu.mma_matrix<32x8xi32, "COp"> {
      %0 = gpu.subgroup_mma_compute %arg0, %arg1, %arg2 {a_transpose} : !gpu.mma_matrix<32x16xsi8, "AOp">, !gpu.mma_matrix<16x8xsi8, "BOp"> -> !gpu.mma_matrix<32x8xi32, "COp">
      return %0 : !gpu.mma_matrix<32x8xi32, "COp">
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_wmma_mma_loop_op(%arg0: memref<128x128xf16>, %arg1: memref<128x128xf16>, %arg2: memref<128x128xf16>) {
      %c0 = arith.constant 0 : index
      %c128 = arith.constant 128 : index
      %c32 = arith.constant 32 : index
      %0 = gpu.subgroup_mma_load_matrix %arg2[%c0, %c0] {leadDimension = 128 : index} : memref<128x128xf16> -> !gpu.mma_matrix<16x16xf16, "COp">
      cf.br ^bb1(%c0, %0 : index, !gpu.mma_matrix<16x16xf16, "COp">)
    ^bb1(%1: index, %2: !gpu.mma_matrix<16x16xf16, "COp">):  // 2 preds: ^bb0, ^bb2
      %3 = arith.cmpi slt, %1, %c128 : index
      cf.cond_br %3, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      %4 = gpu.subgroup_mma_load_matrix %arg0[%c0, %1] {leadDimension = 128 : index} : memref<128x128xf16> -> !gpu.mma_matrix<16x16xf16, "AOp">
      %5 = gpu.subgroup_mma_load_matrix %arg1[%1, %c0] {leadDimension = 128 : index} : memref<128x128xf16> -> !gpu.mma_matrix<16x16xf16, "BOp">
      %6 = gpu.subgroup_mma_compute %4, %5, %2 : !gpu.mma_matrix<16x16xf16, "AOp">, !gpu.mma_matrix<16x16xf16, "BOp"> -> !gpu.mma_matrix<16x16xf16, "COp">
      %7 = arith.addi %1, %c32 : index
      cf.br ^bb1(%7, %6 : index, !gpu.mma_matrix<16x16xf16, "COp">)
    ^bb3:  // pred: ^bb1
      gpu.subgroup_mma_store_matrix %2, %arg2[%c0, %c0] {leadDimension = 128 : index} : !gpu.mma_matrix<16x16xf16, "COp">, memref<128x128xf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_wmma_constant_op() -> !gpu.mma_matrix<16x16xf16, "COp"> {
      %cst = arith.constant 1.000000e+00 : f16
      %0 = gpu.subgroup_mma_constant_matrix %cst : !gpu.mma_matrix<16x16xf16, "COp">
      return %0 : !gpu.mma_matrix<16x16xf16, "COp">
    }
  }
}

// -----
module {
  gpu.module @test_module {
    func.func @gpu_wmma_elementwise(%arg0: !gpu.mma_matrix<16x16xf16, "COp">, %arg1: !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp"> {
      %0 = gpu.subgroup_mma_elementwise  addf %arg0, %arg1 : (!gpu.mma_matrix<16x16xf16, "COp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp">
      %1 = gpu.subgroup_mma_elementwise  maxf %0, %arg1 : (!gpu.mma_matrix<16x16xf16, "COp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp">
      return %1 : !gpu.mma_matrix<16x16xf16, "COp">
    }
  }
}

