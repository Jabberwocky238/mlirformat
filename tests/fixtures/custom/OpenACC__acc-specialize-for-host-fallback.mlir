module {
  acc.routine @acc_routine_create func(@create) seq 
  func.func @create(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_create]>} {
    %c0_i32 = arith.constant 0 : i32
    %0 = acc.create varPtr(%arg0 : memref<i32>) -> memref<i32>
    memref.store %c0_i32, %0[] : memref<i32>
    return
  }
  acc.routine @acc_routine_copyin func(@copyin) seq 
  func.func @copyin(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_copyin]>} {
    %c0_i32 = arith.constant 0 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<i32>) -> memref<i32>
    memref.store %c0_i32, %0[] : memref<i32>
    return
  }
  acc.routine @acc_routine_present func(@present) seq 
  func.func @present(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_present]>} {
    %c0_i32 = arith.constant 0 : i32
    %0 = acc.present varPtr(%arg0 : memref<i32>) -> memref<i32>
    memref.store %c0_i32, %0[] : memref<i32>
    return
  }
  acc.routine @acc_routine_copyout func(@copyout) seq 
  func.func @copyout(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_copyout]>} {
    %0 = acc.copyin varPtr(%arg0 : memref<i32>) -> memref<i32>
    acc.copyout accPtr(%0 : memref<i32>) to varPtr(%arg0 : memref<i32>)
    return
  }
  acc.routine @acc_routine_delete func(@delete) seq 
  func.func @delete(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_delete]>} {
    %0 = acc.create varPtr(%arg0 : memref<i32>) -> memref<i32>
    acc.delete accPtr(%0 : memref<i32>)
    return
  }
  acc.routine @acc_routine_init func(@init_op) seq 
  func.func @init_op() attributes {acc.routine_info = #acc.routine_info<[@acc_routine_init]>} {
    acc.init
    return
  }
  acc.routine @acc_routine_shutdown func(@shutdown_op) seq 
  func.func @shutdown_op() attributes {acc.routine_info = #acc.routine_info<[@acc_routine_shutdown]>} {
    acc.shutdown
    return
  }
  acc.routine @acc_routine_wait func(@wait_op) seq 
  func.func @wait_op() attributes {acc.routine_info = #acc.routine_info<[@acc_routine_wait]>} {
    acc.wait
    return
  }
  acc.routine @acc_routine_data func(@data_construct) seq 
  func.func @data_construct(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_data]>} {
    %0 = acc.create varPtr(%arg0 : memref<i32>) -> memref<i32>
    acc.data dataOperands(%0 : memref<i32>) {
      %c42_i32 = arith.constant 42 : i32
      memref.store %c42_i32, %arg0[] : memref<i32>
      acc.terminator
    }
    return
  }
  acc.routine @acc_routine_parallel func(@parallel_construct) seq 
  func.func @parallel_construct(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_parallel]>} {
    acc.parallel {
      %c44_i32 = arith.constant 44 : i32
      memref.store %c44_i32, %arg0[] : memref<i32>
      acc.yield
    }
    return
  }
  acc.routine @acc_routine_serial func(@serial_construct) seq 
  func.func @serial_construct(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_serial]>} {
    acc.serial {
      %c45_i32 = arith.constant 45 : i32
      memref.store %c45_i32, %arg0[] : memref<i32>
      acc.yield
    }
    return
  }
  acc.routine @acc_routine_kernels func(@kernels_construct) seq 
  func.func @kernels_construct(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_kernels]>} {
    acc.kernels {
      %c46_i32 = arith.constant 46 : i32
      memref.store %c46_i32, %arg0[] : memref<i32>
      acc.terminator
    }
    return
  }
  acc.routine @acc_routine_declare func(@declare_enter_exit) seq 
  func.func @declare_enter_exit(%arg0: memref<i32>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_declare]>} {
    %0 = acc.create varPtr(%arg0 : memref<i32>) -> memref<i32>
    %1 = acc.declare_enter dataOperands(%0 : memref<i32>)
    acc.declare_exit token(%1) dataOperands(%0 : memref<i32>)
    return
  }
}

