module {
  acc.routine @acc_routine_0 func(@attach) seq 
  func.func @attach(%arg0: memref<i32>) attributes {acc.specialized_routine = #acc.specialized_routine<@acc_routine_0, <seq>, "attach">} {
    %c0_i32 = arith.constant 0 : i32
    %0 = acc.attach varPtr(%arg0 : memref<i32>) -> memref<i32>
    memref.store %c0_i32, %0[] : memref<i32>
    return
  }
  acc.routine @acc_routine_1 func(@copyin) seq 
  func.func @copyin(%arg0: memref<i32>) attributes {acc.specialized_routine = #acc.specialized_routine<@acc_routine_1, <seq>, "copyin">} {
    %c0_i32 = arith.constant 0 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<i32>) -> memref<i32>
    memref.store %c0_i32, %0[] : memref<i32>
    return
  }
  acc.routine @acc_routine_2 func(@create) seq 
  func.func @create(%arg0: memref<i32>) attributes {acc.specialized_routine = #acc.specialized_routine<@acc_routine_2, <seq>, "create">} {
    %c0_i32 = arith.constant 0 : i32
    %0 = acc.create varPtr(%arg0 : memref<i32>) -> memref<i32>
    memref.store %c0_i32, %0[] : memref<i32>
    return
  }
  acc.routine @acc_routine_3 func(@present) seq 
  func.func @present(%arg0: memref<i32>) attributes {acc.specialized_routine = #acc.specialized_routine<@acc_routine_3, <seq>, "present">} {
    %c0_i32 = arith.constant 0 : i32
    %0 = acc.present varPtr(%arg0 : memref<i32>) -> memref<i32>
    memref.store %c0_i32, %0[] : memref<i32>
    return
  }
  func.func @copyin_inside_parallel(%arg0: memref<i32>) {
    %c0_i32 = arith.constant 0 : i32
    acc.parallel {
      %0 = acc.copyin varPtr(%arg0 : memref<i32>) -> memref<i32>
      memref.store %c0_i32, %0[] : memref<i32>
      acc.yield
    }
    return
  }
  func.func @copyin_outside_parallel(%arg0: memref<i32>) {
    %c0_i32 = arith.constant 0 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<i32>) -> memref<i32>
    acc.parallel dataOperands(%0 : memref<i32>) {
      memref.store %c0_i32, %0[] : memref<i32>
      acc.yield
    }
    return
  }
  acc.routine @acc_routine_copyout func(@copyout) worker 
  func.func @copyout(%arg0: memref<i32>) attributes {acc.specialized_routine = #acc.specialized_routine<@acc_routine_copyout, <worker>, "copyout">} {
    %0 = acc.copyin varPtr(%arg0 : memref<i32>) -> memref<i32>
    acc.copyout accPtr(%0 : memref<i32>) to varPtr(%arg0 : memref<i32>)
    return
  }
  acc.routine @acc_routine_delete func(@delete) worker 
  func.func @delete(%arg0: memref<i32>) attributes {acc.specialized_routine = #acc.specialized_routine<@acc_routine_delete, <worker>, "delete">} {
    %0 = acc.create varPtr(%arg0 : memref<i32>) -> memref<i32>
    acc.delete accPtr(%0 : memref<i32>)
    return
  }
  acc.routine @acc_routine_enter_data func(@enter_data) worker 
  func.func @enter_data(%arg0: memref<i32>) attributes {acc.specialized_routine = #acc.specialized_routine<@acc_routine_enter_data, <worker>, "enter_data">} {
    %0 = acc.create varPtr(%arg0 : memref<i32>) -> memref<i32>
    acc.enter_data dataOperands(%0 : memref<i32>)
    return
  }
  acc.routine @acc_routine_init func(@init_op) worker 
  func.func @init_op() attributes {acc.specialized_routine = #acc.specialized_routine<@acc_routine_init, <worker>, "init_op">} {
    acc.init
    return
  }
  acc.routine @acc_routine_wait func(@wait_op) worker 
  func.func @wait_op() attributes {acc.specialized_routine = #acc.specialized_routine<@acc_routine_wait, <worker>, "wait_op">} {
    acc.wait
    return
  }
  acc.routine @acc_routine_data func(@data_construct) worker 
  func.func @data_construct(%arg0: memref<i32>) attributes {acc.specialized_routine = #acc.specialized_routine<@acc_routine_data, <worker>, "data_construct">} {
    %0 = acc.create varPtr(%arg0 : memref<i32>) -> memref<i32>
    acc.data dataOperands(%0 : memref<i32>) {
      %c42_i32 = arith.constant 42 : i32
      memref.store %c42_i32, %arg0[] : memref<i32>
      acc.terminator
    }
    return
  }
  acc.routine @acc_routine_parallel func(@parallel_construct) worker 
  func.func @parallel_construct(%arg0: memref<i32>) attributes {acc.specialized_routine = #acc.specialized_routine<@acc_routine_parallel, <worker>, "parallel_construct">} {
    acc.parallel {
      %c44_i32 = arith.constant 44 : i32
      memref.store %c44_i32, %arg0[] : memref<i32>
      acc.yield
    }
    return
  }
  acc.routine @acc_routine_serial func(@serial_construct) worker 
  func.func @serial_construct(%arg0: memref<i32>) attributes {acc.specialized_routine = #acc.specialized_routine<@acc_routine_serial, <worker>, "serial_construct">} {
    acc.serial {
      %c45_i32 = arith.constant 45 : i32
      memref.store %c45_i32, %arg0[] : memref<i32>
      acc.yield
    }
    return
  }
  acc.routine @acc_routine_kernels func(@kernels_construct) worker 
  func.func @kernels_construct(%arg0: memref<i32>) attributes {acc.specialized_routine = #acc.specialized_routine<@acc_routine_kernels, <worker>, "kernels_construct">} {
    acc.kernels {
      %c46_i32 = arith.constant 46 : i32
      memref.store %c46_i32, %arg0[] : memref<i32>
      acc.terminator
    }
    return
  }
  acc.routine @acc_routine_declare func(@dev_routine_declare) worker 
  func.func @dev_routine_declare() attributes {acc.specialized_routine = #acc.specialized_routine<@acc_routine_declare, <worker>, "dev_routine_declare">} {
    %alloca = memref.alloca() : memref<f32>
    %0 = acc.create varPtr(%alloca : memref<f32>) -> memref<f32>
    %1 = acc.declare_enter dataOperands(%0 : memref<f32>)
    acc.declare_exit token(%1) dataOperands(%0 : memref<f32>)
    return
  }
}

