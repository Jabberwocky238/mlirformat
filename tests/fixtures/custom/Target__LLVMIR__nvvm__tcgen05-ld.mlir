module {
  llvm.func @nvvm_tcgen05_ld_16x64b(%arg0: !llvm.ptr<6>) {
    %0 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<1xi32>
    %1 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<2xi32>
    %2 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<4xi32>
    %3 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<8xi32>
    %4 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<16xi32>
    %5 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<32xi32>
    %6 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<64xi32>
    %7 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x64b_pack(%arg0: !llvm.ptr<6>) {
    %0 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<1xi32>
    %1 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<2xi32>
    %2 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<4xi32>
    %3 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<8xi32>
    %4 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<16xi32>
    %5 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<32xi32>
    %6 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<64xi32>
    %7 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x128b(%arg0: !llvm.ptr<6>) {
    %0 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<2xi32>
    %1 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<4xi32>
    %2 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<8xi32>
    %3 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<16xi32>
    %4 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<32xi32>
    %5 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<64xi32>
    %6 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x128b_pack(%arg0: !llvm.ptr<6>) {
    %0 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<2xi32>
    %1 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<4xi32>
    %2 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<8xi32>
    %3 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<16xi32>
    %4 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<32xi32>
    %5 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<64xi32>
    %6 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x256b(%arg0: !llvm.ptr<6>) {
    %0 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<4xi32>
    %1 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<8xi32>
    %2 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<16xi32>
    %3 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<32xi32>
    %4 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<64xi32>
    %5 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x256b_pack(%arg0: !llvm.ptr<6>) {
    %0 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<4xi32>
    %1 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<8xi32>
    %2 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<16xi32>
    %3 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<32xi32>
    %4 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<64xi32>
    %5 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_32x32b(%arg0: !llvm.ptr<6>) {
    %0 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<1xi32>
    %1 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<2xi32>
    %2 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<4xi32>
    %3 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<8xi32>
    %4 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<16xi32>
    %5 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<32xi32>
    %6 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<64xi32>
    %7 = nvvm.tcgen05.ld %arg0 {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_32x32b_pack(%arg0: !llvm.ptr<6>) {
    %0 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<1xi32>
    %1 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<2xi32>
    %2 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<4xi32>
    %3 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<8xi32>
    %4 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<16xi32>
    %5 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<32xi32>
    %6 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<64xi32>
    %7 = nvvm.tcgen05.ld %arg0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x32bx2(%arg0: !llvm.ptr<6>) {
    %0 = llvm.mlir.constant(2 : i64) : i64
    %1 = nvvm.tcgen05.ld %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<1xi32>
    %2 = nvvm.tcgen05.ld %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<2xi32>
    %3 = nvvm.tcgen05.ld %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<4xi32>
    %4 = nvvm.tcgen05.ld %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<8xi32>
    %5 = nvvm.tcgen05.ld %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<16xi32>
    %6 = nvvm.tcgen05.ld %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<32xi32>
    %7 = nvvm.tcgen05.ld %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<64xi32>
    %8 = nvvm.tcgen05.ld %arg0, %0 {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x32bx2_pack(%arg0: !llvm.ptr<6>) {
    %0 = llvm.mlir.constant(2 : i64) : i64
    %1 = nvvm.tcgen05.ld %arg0, %0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<1xi32>
    %2 = nvvm.tcgen05.ld %arg0, %0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<2xi32>
    %3 = nvvm.tcgen05.ld %arg0, %0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<4xi32>
    %4 = nvvm.tcgen05.ld %arg0, %0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<8xi32>
    %5 = nvvm.tcgen05.ld %arg0, %0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<16xi32>
    %6 = nvvm.tcgen05.ld %arg0, %0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<32xi32>
    %7 = nvvm.tcgen05.ld %arg0, %0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<64xi32>
    %8 = nvvm.tcgen05.ld %arg0, %0 pack {shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<128xi32>
    llvm.return
  }
}

