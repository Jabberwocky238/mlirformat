#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton), posWidth = 32, crdWidth = 32 }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : loose_compressed(nonunique), d2 : singleton) }>
module {
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %c0_i32 = arith.constant 0 : i32
    %cst_0 = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00]> : tensor<3xf64>
    %cst_1 = arith.constant dense<[0, 3]> : tensor<2xindex>
    %cst_2 = arith.constant dense<[[1, 2], [5, 6], [7, 8]]> : tensor<3x2xindex>
    %cst_3 = arith.constant dense<[0, 3]> : tensor<2xi32>
    %cst_4 = arith.constant dense<[[1, 2], [5, 6], [7, 8]]> : tensor<3x2xi32>
    %0 = sparse_tensor.assemble (%cst_1, %cst_2), %cst_0 : (tensor<2xindex>, tensor<3x2xindex>), tensor<3xf64> to tensor<10x10xf64, #sparse>
    %1 = sparse_tensor.assemble (%cst_3, %cst_4), %cst_0 : (tensor<2xi32>, tensor<3x2xi32>), tensor<3xf64> to tensor<10x10xf64, #sparse1>
    %cst_5 = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00]> : tensor<3xf64>
    %cst_6 = arith.constant dense<[0, 1, 3]> : tensor<3xi32>
    %cst_7 = arith.constant dense<[1, 0, 1]> : tensor<3xi32>
    %2 = sparse_tensor.assemble (%cst_6, %cst_7), %cst_5 : (tensor<3xi32>, tensor<3xi32>), tensor<3xf64> to tensor<2x2xf64, #sparse2>
    %cst_8 = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00]> : tensor<5xf64>
    %cst_9 = arith.constant dense<[0, 3, 3, 5]> : tensor<4xindex>
    %cst_10 = arith.constant dense<[[1, 2], [5, 6], [7, 8], [2, 3], [4, 2], [10, 10]]> : tensor<6x2xindex>
    %3 = sparse_tensor.assemble (%cst_9, %cst_10), %cst_8 : (tensor<4xindex>, tensor<6x2xindex>), tensor<5xf64> to tensor<2x10x10xf64, #sparse3>
    sparse_tensor.foreach in %0 : tensor<10x10xf64, #sparse> do {
    ^bb0(%arg0: index, %arg1: index, %arg2: f64):
      vector.print %arg0 : index
      vector.print %arg1 : index
      vector.print %arg2 : f64
    }
    sparse_tensor.foreach in %1 : tensor<10x10xf64, #sparse1> do {
    ^bb0(%arg0: index, %arg1: index, %arg2: f64):
      vector.print %arg0 : index
      vector.print %arg1 : index
      vector.print %arg2 : f64
    }
    sparse_tensor.foreach in %2 : tensor<2x2xf64, #sparse2> do {
    ^bb0(%arg0: index, %arg1: index, %arg2: f64):
      vector.print %arg0 : index
      vector.print %arg1 : index
      vector.print %arg2 : f64
    }
    sparse_tensor.foreach in %3 : tensor<2x10x10xf64, #sparse3> do {
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: f64):
      vector.print %arg0 : index
      vector.print %arg1 : index
      vector.print %arg2 : index
      vector.print %arg3 : f64
    }
    %4 = tensor.empty() : tensor<3xf64>
    %5 = tensor.empty() : tensor<2xi32>
    %6 = tensor.empty() : tensor<3x2xi32>
    %ret_levels:2, %ret_values, %lvl_lens:2, %val_len = sparse_tensor.disassemble %1 : tensor<10x10xf64, #sparse1> out_lvls(%5, %6 : tensor<2xi32>, tensor<3x2xi32>) out_vals(%4 : tensor<3xf64>) -> (tensor<2xi32>, tensor<3x2xi32>), tensor<3xf64>, (i32, i64), index
    %7 = vector.transfer_read %ret_values[%c0], %cst : tensor<3xf64>, vector<3xf64>
    vector.print %7 : vector<3xf64>
    %8 = vector.transfer_read %ret_levels#1[%c0, %c0], %c0_i32 : tensor<3x2xi32>, vector<3x2xi32>
    vector.print %8 : vector<3x2xi32>
    vector.print %val_len : index
    %9 = tensor.empty() : tensor<4xf64>
    %10 = tensor.empty() : tensor<3xi32>
    %11 = tensor.empty() : tensor<3xi32>
    %ret_levels_11:2, %ret_values_12, %lvl_lens_13:2, %val_len_14 = sparse_tensor.disassemble %2 : tensor<2x2xf64, #sparse2> out_lvls(%10, %11 : tensor<3xi32>, tensor<3xi32>) out_vals(%9 : tensor<4xf64>) -> (tensor<3xi32>, tensor<3xi32>), tensor<4xf64>, (i32, i64), index
    %12 = vector.transfer_read %ret_values_12[%c0], %cst : tensor<4xf64>, vector<3xf64>
    vector.print %12 : vector<3xf64>
    vector.print %val_len_14 : index
    %13 = tensor.empty() : tensor<6xf64>
    %14 = tensor.empty() : tensor<4xindex>
    %15 = tensor.empty() : tensor<6x2xindex>
    %ret_levels_15:2, %ret_values_16, %lvl_lens_17:2, %val_len_18 = sparse_tensor.disassemble %3 : tensor<2x10x10xf64, #sparse3> out_lvls(%14, %15 : tensor<4xindex>, tensor<6x2xindex>) out_vals(%13 : tensor<6xf64>) -> (tensor<4xindex>, tensor<6x2xindex>), tensor<6xf64>, (i32, tensor<i64>), index
    %16 = vector.transfer_read %ret_values_16[%c0], %cst : tensor<6xf64>, vector<5xf64>
    vector.print %16 : vector<5xf64>
    vector.print %val_len_18 : index
    %17 = vector.transfer_read %ret_levels_15#1[%c0, %c0], %c0 : tensor<6x2xindex>, vector<6x2xindex>
    vector.print %17 : vector<6x2xindex>
    %extracted = tensor.extract %lvl_lens_17#1[] : tensor<i64>
    vector.print %extracted : i64
    %18 = sparse_tensor.has_runtime_library
    scf.if %18 {
      bufferization.dealloc_tensor %0 : tensor<10x10xf64, #sparse>
      bufferization.dealloc_tensor %1 : tensor<10x10xf64, #sparse1>
      bufferization.dealloc_tensor %2 : tensor<2x2xf64, #sparse2>
      bufferization.dealloc_tensor %3 : tensor<2x10x10xf64, #sparse3>
    }
    bufferization.dealloc_tensor %lvl_lens_17#1 : tensor<i64>
    bufferization.dealloc_tensor %4 : tensor<3xf64>
    bufferization.dealloc_tensor %5 : tensor<2xi32>
    bufferization.dealloc_tensor %6 : tensor<3x2xi32>
    bufferization.dealloc_tensor %9 : tensor<4xf64>
    bufferization.dealloc_tensor %10 : tensor<3xi32>
    bufferization.dealloc_tensor %11 : tensor<3xi32>
    bufferization.dealloc_tensor %13 : tensor<6xf64>
    bufferization.dealloc_tensor %14 : tensor<4xindex>
    bufferization.dealloc_tensor %15 : tensor<6x2xindex>
    return
  }
}

