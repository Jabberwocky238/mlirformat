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
  acc.routine @acc_routine_atomic_read func(@atomic_read) seq 
  func.func @atomic_read(%arg0: memref<f64>, %arg1: memref<f64>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_atomic_read]>} {
    acc.atomic.read %arg1 = %arg0 : memref<f64>, memref<f64>, f64
    return
  }
  acc.routine @acc_routine_atomic_write func(@atomic_write) seq 
  func.func @atomic_write(%arg0: memref<f64>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_atomic_write]>} {
    %cst = arith.constant 5.000000e-01 : f64
    acc.atomic.write %arg0 = %cst : memref<f64>, f64
    return
  }
  acc.routine @acc_routine_atomic_update func(@atomic_update) seq 
  func.func @atomic_update(%arg0: memref<f64>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_atomic_update]>} {
    %cst = arith.constant 5.000000e-01 : f64
    acc.parallel {
      acc.atomic.update %arg0 : memref<f64> {
      ^bb0(%arg1: f64):
        %0 = arith.cmpf ogt, %cst, %arg1 fastmath<contract> : f64
        %1 = arith.select %0, %cst, %arg1 : f64
        acc.yield %1 : f64
      }
      acc.terminator
    }
    return
  }
  acc.routine @acc_routine_atomic_capture func(@atomic_capture) seq 
  func.func @atomic_capture(%arg0: memref<f64>, %arg1: memref<f64>) attributes {acc.routine_info = #acc.routine_info<[@acc_routine_atomic_capture]>} {
    %cst = arith.constant 5.000000e-01 : f64
    acc.parallel {
      acc.atomic.capture {
        acc.atomic.update %arg0 : memref<f64> {
        ^bb0(%arg2: f64):
          %0 = arith.cmpf ogt, %cst, %arg2 fastmath<contract> : f64
          %1 = arith.select %0, %cst, %arg2 : f64
          acc.yield %1 : f64
        }
        acc.atomic.read %arg1 = %arg0 : memref<f64>, memref<f64>, f64
      }
      acc.terminator
    }
    return
  }
}

