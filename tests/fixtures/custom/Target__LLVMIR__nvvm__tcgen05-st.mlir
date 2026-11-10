module {
  llvm.func @nvvm_tcgen05_ld_16x64b(%arg0: !llvm.ptr<6>, %arg1: vector<1xi32>, %arg2: vector<2xi32>, %arg3: vector<4xi32>, %arg4: vector<8xi32>, %arg5: vector<16xi32>, %arg6: vector<32xi32>, %arg7: vector<64xi32>, %arg8: vector<128xi32>) {
    nvvm.tcgen05.st %arg0, %arg1 {num = 1 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<1xi32>
    nvvm.tcgen05.st %arg0, %arg2 {num = 2 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<2xi32>
    nvvm.tcgen05.st %arg0, %arg3 {num = 4 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<4xi32>
    nvvm.tcgen05.st %arg0, %arg4 {num = 8 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<8xi32>
    nvvm.tcgen05.st %arg0, %arg5 {num = 16 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<16xi32>
    nvvm.tcgen05.st %arg0, %arg6 {num = 32 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<32xi32>
    nvvm.tcgen05.st %arg0, %arg7 {num = 64 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<64xi32>
    nvvm.tcgen05.st %arg0, %arg8 {num = 128 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x64b_pack(%arg0: !llvm.ptr<6>, %arg1: vector<1xi32>, %arg2: vector<2xi32>, %arg3: vector<4xi32>, %arg4: vector<8xi32>, %arg5: vector<16xi32>, %arg6: vector<32xi32>, %arg7: vector<64xi32>, %arg8: vector<128xi32>) {
    nvvm.tcgen05.st %arg0, %arg1 unpack {num = 1 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<1xi32>
    nvvm.tcgen05.st %arg0, %arg2 unpack {num = 2 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<2xi32>
    nvvm.tcgen05.st %arg0, %arg3 unpack {num = 4 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<4xi32>
    nvvm.tcgen05.st %arg0, %arg4 unpack {num = 8 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<8xi32>
    nvvm.tcgen05.st %arg0, %arg5 unpack {num = 16 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<16xi32>
    nvvm.tcgen05.st %arg0, %arg6 unpack {num = 32 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<32xi32>
    nvvm.tcgen05.st %arg0, %arg7 unpack {num = 64 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<64xi32>
    nvvm.tcgen05.st %arg0, %arg8 unpack {num = 128 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x64b>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x128b(%arg0: !llvm.ptr<6>, %arg1: vector<1xi32>, %arg2: vector<2xi32>, %arg3: vector<4xi32>, %arg4: vector<8xi32>, %arg5: vector<16xi32>, %arg6: vector<32xi32>, %arg7: vector<64xi32>, %arg8: vector<128xi32>) {
    nvvm.tcgen05.st %arg0, %arg2 {num = 1 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<2xi32>
    nvvm.tcgen05.st %arg0, %arg3 {num = 2 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<4xi32>
    nvvm.tcgen05.st %arg0, %arg4 {num = 4 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<8xi32>
    nvvm.tcgen05.st %arg0, %arg5 {num = 8 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<16xi32>
    nvvm.tcgen05.st %arg0, %arg6 {num = 16 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<32xi32>
    nvvm.tcgen05.st %arg0, %arg7 {num = 32 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<64xi32>
    nvvm.tcgen05.st %arg0, %arg8 {num = 64 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x128b_pack(%arg0: !llvm.ptr<6>, %arg1: vector<1xi32>, %arg2: vector<2xi32>, %arg3: vector<4xi32>, %arg4: vector<8xi32>, %arg5: vector<16xi32>, %arg6: vector<32xi32>, %arg7: vector<64xi32>, %arg8: vector<128xi32>) {
    nvvm.tcgen05.st %arg0, %arg2 unpack {num = 1 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<2xi32>
    nvvm.tcgen05.st %arg0, %arg3 unpack {num = 2 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<4xi32>
    nvvm.tcgen05.st %arg0, %arg4 unpack {num = 4 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<8xi32>
    nvvm.tcgen05.st %arg0, %arg5 unpack {num = 8 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<16xi32>
    nvvm.tcgen05.st %arg0, %arg6 unpack {num = 16 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<32xi32>
    nvvm.tcgen05.st %arg0, %arg7 unpack {num = 32 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<64xi32>
    nvvm.tcgen05.st %arg0, %arg8 unpack {num = 64 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x128b>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x256b(%arg0: !llvm.ptr<6>, %arg1: vector<1xi32>, %arg2: vector<2xi32>, %arg3: vector<4xi32>, %arg4: vector<8xi32>, %arg5: vector<16xi32>, %arg6: vector<32xi32>, %arg7: vector<64xi32>, %arg8: vector<128xi32>) {
    nvvm.tcgen05.st %arg0, %arg3 {num = 1 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<4xi32>
    nvvm.tcgen05.st %arg0, %arg4 {num = 2 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<8xi32>
    nvvm.tcgen05.st %arg0, %arg5 {num = 4 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<16xi32>
    nvvm.tcgen05.st %arg0, %arg6 {num = 8 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<32xi32>
    nvvm.tcgen05.st %arg0, %arg7 {num = 16 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<64xi32>
    nvvm.tcgen05.st %arg0, %arg8 {num = 32 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x256b_pack(%arg0: !llvm.ptr<6>, %arg1: vector<1xi32>, %arg2: vector<2xi32>, %arg3: vector<4xi32>, %arg4: vector<8xi32>, %arg5: vector<16xi32>, %arg6: vector<32xi32>, %arg7: vector<64xi32>, %arg8: vector<128xi32>) {
    nvvm.tcgen05.st %arg0, %arg3 unpack {num = 1 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<4xi32>
    nvvm.tcgen05.st %arg0, %arg4 unpack {num = 2 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<8xi32>
    nvvm.tcgen05.st %arg0, %arg5 unpack {num = 4 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<16xi32>
    nvvm.tcgen05.st %arg0, %arg6 unpack {num = 8 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<32xi32>
    nvvm.tcgen05.st %arg0, %arg7 unpack {num = 16 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<64xi32>
    nvvm.tcgen05.st %arg0, %arg8 unpack {num = 32 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x256b>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_32x32b(%arg0: !llvm.ptr<6>, %arg1: vector<1xi32>, %arg2: vector<2xi32>, %arg3: vector<4xi32>, %arg4: vector<8xi32>, %arg5: vector<16xi32>, %arg6: vector<32xi32>, %arg7: vector<64xi32>, %arg8: vector<128xi32>) {
    nvvm.tcgen05.st %arg0, %arg1 {num = 1 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<1xi32>
    nvvm.tcgen05.st %arg0, %arg2 {num = 2 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<2xi32>
    nvvm.tcgen05.st %arg0, %arg3 {num = 4 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<4xi32>
    nvvm.tcgen05.st %arg0, %arg4 {num = 8 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<8xi32>
    nvvm.tcgen05.st %arg0, %arg5 {num = 16 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<16xi32>
    nvvm.tcgen05.st %arg0, %arg6 {num = 32 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<32xi32>
    nvvm.tcgen05.st %arg0, %arg7 {num = 64 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<64xi32>
    nvvm.tcgen05.st %arg0, %arg8 {num = 128 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_32x32b_pack(%arg0: !llvm.ptr<6>, %arg1: vector<1xi32>, %arg2: vector<2xi32>, %arg3: vector<4xi32>, %arg4: vector<8xi32>, %arg5: vector<16xi32>, %arg6: vector<32xi32>, %arg7: vector<64xi32>, %arg8: vector<128xi32>) {
    nvvm.tcgen05.st %arg0, %arg1 unpack {num = 1 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<1xi32>
    nvvm.tcgen05.st %arg0, %arg2 unpack {num = 2 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<2xi32>
    nvvm.tcgen05.st %arg0, %arg3 unpack {num = 4 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<4xi32>
    nvvm.tcgen05.st %arg0, %arg4 unpack {num = 8 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<8xi32>
    nvvm.tcgen05.st %arg0, %arg5 unpack {num = 16 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<16xi32>
    nvvm.tcgen05.st %arg0, %arg6 unpack {num = 32 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<32xi32>
    nvvm.tcgen05.st %arg0, %arg7 unpack {num = 64 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<64xi32>
    nvvm.tcgen05.st %arg0, %arg8 unpack {num = 128 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_32x32b>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x32bx2(%arg0: !llvm.ptr<6>, %arg1: vector<1xi32>, %arg2: vector<2xi32>, %arg3: vector<4xi32>, %arg4: vector<8xi32>, %arg5: vector<16xi32>, %arg6: vector<32xi32>, %arg7: vector<64xi32>, %arg8: vector<128xi32>) {
    %0 = llvm.mlir.constant(2 : i64) : i64
    nvvm.tcgen05.st %arg0, %arg1, %0 {num = 1 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<1xi32>
    nvvm.tcgen05.st %arg0, %arg2, %0 {num = 2 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<2xi32>
    nvvm.tcgen05.st %arg0, %arg3, %0 {num = 4 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<4xi32>
    nvvm.tcgen05.st %arg0, %arg4, %0 {num = 8 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<8xi32>
    nvvm.tcgen05.st %arg0, %arg5, %0 {num = 16 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<16xi32>
    nvvm.tcgen05.st %arg0, %arg6, %0 {num = 32 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<32xi32>
    nvvm.tcgen05.st %arg0, %arg7, %0 {num = 64 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<64xi32>
    nvvm.tcgen05.st %arg0, %arg8, %0 {num = 128 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<128xi32>
    llvm.return
  }
  llvm.func @nvvm_tcgen05_ld_16x32bx2_pack(%arg0: !llvm.ptr<6>, %arg1: vector<1xi32>, %arg2: vector<2xi32>, %arg3: vector<4xi32>, %arg4: vector<8xi32>, %arg5: vector<16xi32>, %arg6: vector<32xi32>, %arg7: vector<64xi32>, %arg8: vector<128xi32>) {
    %0 = llvm.mlir.constant(2 : i64) : i64
    nvvm.tcgen05.st %arg0, %arg1, %0 unpack {num = 1 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<1xi32>
    nvvm.tcgen05.st %arg0, %arg2, %0 unpack {num = 2 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<2xi32>
    nvvm.tcgen05.st %arg0, %arg3, %0 unpack {num = 4 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<4xi32>
    nvvm.tcgen05.st %arg0, %arg4, %0 unpack {num = 8 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<8xi32>
    nvvm.tcgen05.st %arg0, %arg5, %0 unpack {num = 16 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<16xi32>
    nvvm.tcgen05.st %arg0, %arg6, %0 unpack {num = 32 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<32xi32>
    nvvm.tcgen05.st %arg0, %arg7, %0 unpack {num = 64 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<64xi32>
    nvvm.tcgen05.st %arg0, %arg8, %0 unpack {num = 128 : i32, shape = #nvvm.tcgen05_ldst_shape<shape_16x32bx2>} : vector<128xi32>
    llvm.return
  }
}

