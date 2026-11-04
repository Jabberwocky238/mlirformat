module {
  func.func @function_to_run(%arg0: vector<8xf32>, %arg1: vector<8xf32>) {
    %0 = llvm.inline_asm asm_dialect = intel "vaddps $0, $1, $2", "=x,x,x" %arg0, %arg1 : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    vector.print %0 : vector<8xf32>
    %1 = llvm.inline_asm asm_dialect = intel "vblendps $0, $1, $2, 0xCC", "=x,x,x" %arg0, %arg1 : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    vector.print %1 : vector<8xf32>
    %2 = vector.shuffle %arg0, %arg1 [0, 1, 10, 11, 4, 5, 14, 15] : vector<8xf32>, vector<8xf32>
    vector.print %2 : vector<8xf32>
    %3 = llvm.inline_asm asm_dialect = intel "vblendps $0, $1, $2, 0x33", "=x,x,x" %arg0, %arg1 : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    vector.print %3 : vector<8xf32>
    %4 = vector.shuffle %arg0, %arg1 [8, 9, 2, 3, 12, 13, 6, 7] : vector<8xf32>, vector<8xf32>
    vector.print %4 : vector<8xf32>
    return
  }
  func.func @entry_point(%arg0: vector<8xf32>, %arg1: vector<8xf32>) {
    call @function_to_run(%arg0, %arg1) : (vector<8xf32>, vector<8xf32>) -> ()
    return
  }
  func.func @entry_point_with_all_constants() {
    %0 = llvm.mlir.constant(dense<[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : vector<8xf32>) : vector<8xf32>
    %1 = llvm.mlir.constant(dense<[8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01]> : vector<8xf32>) : vector<8xf32>
    call @function_to_run(%0, %1) : (vector<8xf32>, vector<8xf32>) -> ()
    return
  }
}

