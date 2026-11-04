module {
  func.func @testenterdataop(%arg0: memref<f32>, %arg1: i1) {
    %0 = acc.create varPtr(%arg0 : memref<f32>) -> memref<f32>
    acc.enter_data if(%arg1) dataOperands(%0 : memref<f32>)
    return
  }
}

// -----
module {
  func.func @testexitdataop(%arg0: memref<f32>, %arg1: i1) {
    %0 = acc.getdeviceptr varPtr(%arg0 : memref<f32>) -> memref<f32>
    acc.exit_data if(%arg1) dataOperands(%0 : memref<f32>)
    acc.delete accPtr(%0 : memref<f32>)
    return
  }
}

// -----
module {
  func.func @testupdateop(%arg0: memref<f32>, %arg1: i1) {
    %0 = acc.update_device varPtr(%arg0 : memref<f32>) -> memref<f32>
    acc.update if(%arg1) dataOperands(%0 : memref<f32>)
    return
  }
}

// -----
module {
  func.func @update_true(%arg0: memref<f32>) {
    %true = arith.constant true
    %0 = acc.update_device varPtr(%arg0 : memref<f32>) -> memref<f32>
    acc.update if(%true) dataOperands(%0 : memref<f32>)
    return
  }
}

// -----
module {
  func.func @update_false(%arg0: memref<f32>) {
    %false = arith.constant false
    %0 = acc.update_device varPtr(%arg0 : memref<f32>) -> memref<f32>
    acc.update if(%false) dataOperands(%0 : memref<f32>)
    return
  }
}

// -----
module {
  func.func @enter_data_true(%arg0: memref<f32>) {
    %true = arith.constant true
    %0 = acc.create varPtr(%arg0 : memref<f32>) -> memref<f32>
    acc.enter_data if(%true) async dataOperands(%0 : memref<f32>)
    return
  }
}

// -----
module {
  func.func @enter_data_false(%arg0: memref<f32>) {
    %false = arith.constant false
    %0 = acc.create varPtr(%arg0 : memref<f32>) -> memref<f32>
    acc.enter_data if(%false) async dataOperands(%0 : memref<f32>)
    return
  }
}

// -----
module {
  func.func @exit_data_true(%arg0: memref<f32>) {
    %true = arith.constant true
    %0 = acc.getdeviceptr varPtr(%arg0 : memref<f32>) -> memref<f32>
    acc.exit_data if(%true) async dataOperands(%0 : memref<f32>)
    acc.delete accPtr(%0 : memref<f32>)
    return
  }
}

// -----
module {
  func.func @exit_data_false(%arg0: memref<f32>) {
    %false = arith.constant false
    %0 = acc.getdeviceptr varPtr(%arg0 : memref<f32>) -> memref<f32>
    acc.exit_data if(%false) async dataOperands(%0 : memref<f32>)
    acc.delete accPtr(%0 : memref<f32>)
    return
  }
}

// -----
module {
}

