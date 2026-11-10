module {
}

// -----
module {
  func.func @parallel_fallback_none_async_wait(%arg0: memref<1xi32>) {
    %c2_i32 = arith.constant 2 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<1xi32>) -> memref<1xi32>
    acc.parallel dataOperands(%0 : memref<1xi32>) async(%c2_i32 : i32) wait({%c1_i32 : i32}) {
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<1xi32>) to varPtr(%arg0 : memref<1xi32>)
    return
  }
}

// -----
module {
  func.func @parallel_prefer_nvidia_over_none(%arg0: memref<1xi32>) {
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c10_i32 = arith.constant 10 : i32
    %c20_i32 = arith.constant 20 : i32
    %c21_i32 = arith.constant 21 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<1xi32>) -> memref<1xi32>
    acc.parallel dataOperands(%0 : memref<1xi32>) async(%c1_i32 : i32, %c2_i32 : i32 [#acc.device_type<nvidia>]) wait({%c10_i32 : i32}, {%c20_i32 : i32, %c21_i32 : i32} [#acc.device_type<nvidia>]) {
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<1xi32>) to varPtr(%arg0 : memref<1xi32>)
    return
  }
}

// -----
module {
  func.func @parallel_nvidia_only_async_wait(%arg0: memref<1xi32>) {
    %c3_i32 = arith.constant 3 : i32
    %c30_i32 = arith.constant 30 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<1xi32>) -> memref<1xi32>
    acc.parallel dataOperands(%0 : memref<1xi32>) async(%c3_i32 : i32 [#acc.device_type<nvidia>]) wait({%c30_i32 : i32} [#acc.device_type<nvidia>]) {
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<1xi32>) to varPtr(%arg0 : memref<1xi32>)
    return
  }
}

// -----
module {
  func.func @parallel_plain_wait_no_devnum(%arg0: memref<1xi32>) {
    %c1_i32 = arith.constant 1 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<1xi32>) -> memref<1xi32>
    acc.parallel dataOperands(%0 : memref<1xi32>) wait({%c1_i32 : i32}) {
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<1xi32>) to varPtr(%arg0 : memref<1xi32>)
    return
  }
}

// -----
module {
  func.func @parallel_none_devnum_skipped_for_nvidia_pass(%arg0: memref<1xi32>) {
    %c100_i32 = arith.constant 100 : i32
    %c0_i32 = arith.constant 0 : i32
    %c4_i32 = arith.constant 4 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<1xi32>) -> memref<1xi32>
    acc.parallel dataOperands(%0 : memref<1xi32>) wait({devnum: %c100_i32 : i32, %c0_i32 : i32}, {%c4_i32 : i32} [#acc.device_type<nvidia>]) {
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<1xi32>) to varPtr(%arg0 : memref<1xi32>)
    return
  }
}

// -----
module {
  func.func @parallel_nvidia_wait_devnum(%arg0: memref<1xi32>) {
    %c100_i32 = arith.constant 100 : i32
    %c5_i32 = arith.constant 5 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<1xi32>) -> memref<1xi32>
    acc.parallel dataOperands(%0 : memref<1xi32>) wait({devnum: %c100_i32 : i32, %c5_i32 : i32} [#acc.device_type<nvidia>]) {
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<1xi32>) to varPtr(%arg0 : memref<1xi32>)
    return
  }
}

// -----
module {
  func.func @kernels_prefer_nvidia_async_wait(%arg0: memref<1xi32>) {
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c10_i32 = arith.constant 10 : i32
    %c20_i32 = arith.constant 20 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<1xi32>) -> memref<1xi32>
    acc.kernels dataOperands(%0 : memref<1xi32>) async(%c1_i32 : i32, %c2_i32 : i32 [#acc.device_type<nvidia>]) wait({%c10_i32 : i32}, {%c20_i32 : i32} [#acc.device_type<nvidia>]) {
      acc.terminator
    }
    acc.copyout accPtr(%0 : memref<1xi32>) to varPtr(%arg0 : memref<1xi32>)
    return
  }
}

// -----
module {
  func.func @serial_fallback_none_wait(%arg0: memref<1xi32>) {
    %c7_i32 = arith.constant 7 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<1xi32>) -> memref<1xi32>
    acc.serial dataOperands(%0 : memref<1xi32>) wait({%c7_i32 : i32}) {
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<1xi32>) to varPtr(%arg0 : memref<1xi32>)
    return
  }
}

