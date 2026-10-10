module {
  llvm.func @fold_icmp_eq(%arg0: i32) -> i1 {
    %0 = llvm.icmp "eq" %arg0, %arg0 : i32
    llvm.return %0 : i1
  }
}

// -----
module {
  llvm.func @fold_icmp_ne(%arg0: vector<2xi32>) -> vector<2xi1> {
    %0 = llvm.icmp "ne" %arg0, %arg0 : vector<2xi32>
    llvm.return %0 : vector<2xi1>
  }
}

// -----
module {
  llvm.func @fold_icmp_alloca() -> i1 {
    %0 = llvm.mlir.zero : !llvm.ptr
    %c1_i64 = arith.constant 1 : i64
    %1 = llvm.alloca %c1_i64 x i32 : (i64) -> !llvm.ptr
    %2 = llvm.icmp "ne" %0, %1 : !llvm.ptr
    llvm.return %2 : i1
  }
}

// -----
module {
  llvm.func @fold_extractvalue() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = llvm.mlir.undef : !llvm.struct<(i32, i32)>
    %1 = llvm.insertvalue %c0_i32, %0[0] : !llvm.struct<(i32, i32)> 
    %2 = llvm.insertvalue %c1_i32, %1[1] : !llvm.struct<(i32, i32)> 
    %3 = llvm.extractvalue %2[0] : !llvm.struct<(i32, i32)> 
    %4 = llvm.extractvalue %2[1] : !llvm.struct<(i32, i32)> 
    %5 = llvm.add %3, %4 : i32
    llvm.return %5 : i32
  }
}

// -----
module {
  llvm.func @fold_extractvalue(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %0 = llvm.mlir.undef : !llvm.struct<(struct<(i32, i32, i32)>, struct<(i32, i32)>)>
    %1 = llvm.mlir.undef : !llvm.struct<(i32, i32, i32)>
    %2 = llvm.insertvalue %arg0, %1[0] : !llvm.struct<(i32, i32, i32)> 
    %3 = llvm.insertvalue %arg0, %2[1] : !llvm.struct<(i32, i32, i32)> 
    %4 = llvm.insertvalue %arg0, %3[2] : !llvm.struct<(i32, i32, i32)> 
    %5 = llvm.insertvalue %4, %0[0] : !llvm.struct<(struct<(i32, i32, i32)>, struct<(i32, i32)>)> 
    %6 = llvm.extractvalue %5[0, 0] : !llvm.struct<(struct<(i32, i32, i32)>, struct<(i32, i32)>)> 
    llvm.return %6 : i32
  }
}

// -----
module {
  llvm.func @no_fold_extractvalue(%arg0: !llvm.array<4 x f32>) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = llvm.mlir.undef : !llvm.array<4 x array<4 x f32>>
    %1 = llvm.insertvalue %cst, %0[0, 0] : !llvm.array<4 x array<4 x f32>> 
    %2 = llvm.insertvalue %arg0, %1[0] : !llvm.array<4 x array<4 x f32>> 
    %3 = llvm.extractvalue %2[0, 0] : !llvm.array<4 x array<4 x f32>> 
    llvm.return %3 : f32
  }
}

// -----
module {
  llvm.func @fold_unrelated_extractvalue(%arg0: !llvm.array<4 x f32>) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = llvm.insertvalue %cst, %arg0[0] : !llvm.array<4 x f32> 
    %1 = llvm.extractvalue %0[1] : !llvm.array<4 x f32> 
    llvm.return %1 : f32
  }
}

// -----
module {
  llvm.func @fold_extract_extractvalue(%arg0: !llvm.struct<(i64, array<1 x ptr<1>>)>) -> !llvm.ptr<1> {
    %0 = llvm.extractvalue %arg0[1] : !llvm.struct<(i64, array<1 x ptr<1>>)> 
    %1 = llvm.extractvalue %0[0] : !llvm.array<1 x ptr<1>> 
    llvm.return %1 : !llvm.ptr<1>
  }
}

// -----
module {
  llvm.func @fold_extract_const_array() -> f64 {
    %0 = llvm.mlir.constant(dense<[-8.900000e+01, 5.000000e-01]> : tensor<2xf64>) : !llvm.array<2 x f64>
    %1 = llvm.extractvalue %0[1] : !llvm.array<2 x f64> 
    llvm.return %1 : f64
  }
}

// -----
module {
  llvm.func @fold_extract_const_struct() -> i32 {
    %0 = llvm.mlir.constant([1 : i16, 2 : i32]) : !llvm.struct<(i16, i32)>
    %1 = llvm.extractvalue %0[1] : !llvm.struct<(i16, i32)> 
    llvm.return %1 : i32
  }
}

// -----
module {
  llvm.func @fold_extract_splat() -> f64 {
    %0 = llvm.mlir.constant(dense<-8.900000e+01> : tensor<2xf64>) : !llvm.array<2 x f64>
    %1 = llvm.extractvalue %0[1] : !llvm.array<2 x f64> 
    llvm.return %1 : f64
  }
}

// -----
module {
  llvm.func @fold_extract_splat_nested() -> i32 {
    %0 = llvm.mlir.constant(dense<(0,1)> : tensor<2xcomplex<i32>>) : !llvm.array<2 x struct<(i32, i32)>>
    %1 = llvm.extractvalue %0[1, 1] : !llvm.array<2 x struct<(i32, i32)>> 
    llvm.return %1 : i32
  }
}

// -----
module {
  llvm.func @fold_extract_sparse() -> f32 {
    %0 = llvm.mlir.constant(sparse<0, 4.200000e+01> : tensor<4xf32>) : !llvm.array<4 x f32>
    %1 = llvm.extractvalue %0[0] : !llvm.array<4 x f32> 
    %2 = llvm.extractvalue %0[1] : !llvm.array<4 x f32> 
    %3 = llvm.fadd %1, %2 : f32
    llvm.return %3 : f32
  }
}

// -----
module {
  llvm.func @fold_zero() -> i32 {
    %0 = llvm.mlir.zero : !llvm.struct<(i16, i32)>
    %1 = llvm.mlir.undef : !llvm.array<2 x struct<(i16, i32)>>
    %2 = llvm.insertvalue %0, %1[0] : !llvm.array<2 x struct<(i16, i32)>> 
    %3 = llvm.extractvalue %2[0, 1] : !llvm.array<2 x struct<(i16, i32)>> 
    llvm.return %3 : i32
  }
}

// -----
module {
  llvm.func @use_struct(!llvm.struct<(i16, i32)>)
  llvm.func @fold_undef() -> i32 {
    %0 = llvm.mlir.undef : !llvm.struct<(i8, struct<(i16, i32)>)>
    %1 = llvm.extractvalue %0[1] : !llvm.struct<(i8, struct<(i16, i32)>)> 
    llvm.call @use_struct(%1) : (!llvm.struct<(i16, i32)>) -> ()
    %2 = llvm.extractvalue %0[1, 1] : !llvm.struct<(i8, struct<(i16, i32)>)> 
    llvm.return %2 : i32
  }
}

// -----
module {
  llvm.func @use_array(!llvm.array<8 x f32>)
  llvm.func @fold_poison() -> f32 {
    %0 = llvm.mlir.poison : !llvm.array<2 x array<8 x f32>>
    %1 = llvm.extractvalue %0[1] : !llvm.array<2 x array<8 x f32>> 
    llvm.call @use_array(%1) : (!llvm.array<8 x f32>) -> ()
    %2 = llvm.extractvalue %0[1, 1] : !llvm.array<2 x array<8 x f32>> 
    llvm.return %2 : f32
  }
}

// -----
module {
  llvm.func @fold_bitcast(%arg0: !llvm.ptr) -> !llvm.ptr {
    %0 = llvm.bitcast %arg0 : !llvm.ptr to !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
}

// -----
module {
  llvm.func @fold_bitcast2(%arg0: i32) -> i32 {
    %0 = llvm.bitcast %arg0 : i32 to f32
    %1 = llvm.bitcast %0 : f32 to i32
    llvm.return %1 : i32
  }
}

// -----
module {
  llvm.func @fold_bitcast_chain(%arg0: i32) -> vector<2xi16> {
    %0 = llvm.bitcast %arg0 : i32 to f32
    %1 = llvm.bitcast %0 : f32 to vector<2xi16>
    llvm.return %1 : vector<2xi16>
  }
}

// -----
module {
  llvm.func @fold_addrcast(%arg0: !llvm.ptr) -> !llvm.ptr {
    %0 = llvm.addrspacecast %arg0 : !llvm.ptr to !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
}

// -----
module {
  llvm.func @fold_addrcast2(%arg0: !llvm.ptr) -> !llvm.ptr {
    %0 = llvm.addrspacecast %arg0 : !llvm.ptr to !llvm.ptr<5>
    %1 = llvm.addrspacecast %0 : !llvm.ptr<5> to !llvm.ptr
    llvm.return %1 : !llvm.ptr
  }
}

// -----
module {
  llvm.func @fold_addrcast_chain(%arg0: !llvm.ptr) -> !llvm.ptr<2> {
    %0 = llvm.addrspacecast %arg0 : !llvm.ptr to !llvm.ptr<1>
    %1 = llvm.addrspacecast %0 : !llvm.ptr<1> to !llvm.ptr<2>
    llvm.return %1 : !llvm.ptr<2>
  }
}

// -----
module {
  llvm.func @fold_gep(%arg0: !llvm.ptr) -> !llvm.ptr {
    %c0_i32 = arith.constant 0 : i32
    %0 = llvm.getelementptr %arg0[%c0_i32] : (!llvm.ptr, i32) -> !llvm.ptr, i8
    llvm.return %0 : !llvm.ptr
  }
}

// -----
module {
  llvm.func @fold_gep_neg(%arg0: !llvm.ptr) -> !llvm.ptr {
    %c0_i32 = arith.constant 0 : i32
    %0 = llvm.getelementptr inbounds %arg0[%c0_i32, 1] : (!llvm.ptr, i32) -> !llvm.ptr, !llvm.struct<(i32, i32)>
    llvm.return %0 : !llvm.ptr
  }
}

// -----
module {
  llvm.func @fold_gep_canon(%arg0: !llvm.ptr) -> !llvm.ptr {
    %c2_i32 = arith.constant 2 : i32
    %0 = llvm.getelementptr %arg0[%c2_i32] : (!llvm.ptr, i32) -> !llvm.ptr, i8
    llvm.return %0 : !llvm.ptr
  }
}

// -----
module {
  llvm.func @fold_shufflevector(%arg0: vector<1xf32>, %arg1: vector<1xf32>) -> vector<1xf32> {
    %0 = llvm.shufflevector %arg0, %arg1 [0] : vector<1xf32> 
    llvm.return %0 : vector<1xf32>
  }
}

// -----
module {
  llvm.func @llvm_constant() -> i32 {
    %0 = llvm.mlir.constant(40 : i32) : i32
    %1 = llvm.mlir.constant(42 : i32) : i32
    %2 = arith.addi %0, %1 : i32
    llvm.return %2 : i32
  }
}

// -----
module {
  llvm.func @load_dce(%arg0: !llvm.ptr) {
    %0 = llvm.load %arg0 : !llvm.ptr -> i8
    llvm.return
  }
}

// -----
module {
  llvm.mlir.global external @fp() {addr_space = 0 : i32} : !llvm.ptr
  llvm.func @addr_dce(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.addressof @fp : !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @alloca_dce() {
    %c1_i64 = arith.constant 1 : i64
    %0 = llvm.alloca %c1_i64 x i32 : (i64) -> !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @volatile_load(%arg0: !llvm.ptr) {
    %0 = llvm.load volatile %arg0 : !llvm.ptr -> i8
    %1 = llvm.load %arg0 atomic monotonic {alignment = 1 : i64} : !llvm.ptr -> i8
    %2 = llvm.load %arg0 atomic unordered {alignment = 1 : i64} : !llvm.ptr -> i8
    llvm.return
  }
}

// -----
module {
  llvm.func @inline_asm_side_effects(%arg0: i32) {
    llvm.inline_asm "pure inline asm", "r" %arg0 : (i32) -> ()
    llvm.inline_asm has_side_effects "inline asm with side effects", "r" %arg0 : (i32) -> ()
    llvm.return
  }
}

