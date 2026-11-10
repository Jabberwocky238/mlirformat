module {
  func.func @compute1(%arg0: memref<10x10xf32>, %arg1: memref<10x10xf32>, %arg2: memref<10x10xf32>) -> memref<10x10xf32> {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    %c1_i64 = arith.constant 1 : i64
    acc.parallel async(%c1_i64 : i64) {
      acc.loop gang vector control(%arg3 : index, %arg4 : index, %arg5 : index) = (%c0, %c0, %c0 : index, index, index) to (%c10, %c10, %c10 : index, index, index)  step (%c1, %c1, %c1 : index, index, index) {
        %0 = memref.load %arg0[%arg3, %arg5] : memref<10x10xf32>
        %1 = memref.load %arg1[%arg5, %arg4] : memref<10x10xf32>
        %2 = memref.load %arg2[%arg3, %arg4] : memref<10x10xf32>
        %3 = arith.mulf %0, %1 : f32
        %4 = arith.addf %2, %3 : f32
        memref.store %4, %arg2[%arg3, %arg4] : memref<10x10xf32>
        acc.yield
      } attributes {collapse = [3], collapseDeviceType = [#acc.device_type<none>], inclusiveUpperbound = array<i1: true, true, true>, independent = [#acc.device_type<none>]}
      acc.yield
    }
    return %arg2 : memref<10x10xf32>
  }
}

// -----
module {
  func.func @compute2(%arg0: memref<10x10xf32>, %arg1: memref<10x10xf32>, %arg2: memref<10x10xf32>) -> memref<10x10xf32> {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    acc.parallel {
      acc.loop control(%arg3 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
        scf.for %arg4 = %c0 to %c10 step %c1 {
          scf.for %arg5 = %c0 to %c10 step %c1 {
            %0 = memref.load %arg0[%arg3, %arg5] : memref<10x10xf32>
            %1 = memref.load %arg1[%arg5, %arg4] : memref<10x10xf32>
            %2 = memref.load %arg2[%arg3, %arg4] : memref<10x10xf32>
            %3 = arith.mulf %0, %1 : f32
            %4 = arith.addf %2, %3 : f32
            memref.store %4, %arg2[%arg3, %arg4] : memref<10x10xf32>
          }
        }
        acc.yield
      } attributes {inclusiveUpperbound = array<i1: true>, seq = [#acc.device_type<none>]}
      acc.yield
    }
    return %arg2 : memref<10x10xf32>
  }
}

// -----
module {
  acc.private.recipe @privatization_memref_10_f32 : memref<10xf32> init {
  ^bb0(%arg0: memref<10xf32>):
    %alloc = memref.alloc() : memref<10xf32>
    acc.yield %alloc : memref<10xf32>
  } destroy {
  ^bb0(%arg0: memref<10xf32>):
    memref.dealloc %arg0 : memref<10xf32>
    acc.terminator
  }
  func.func @compute3(%arg0: memref<10x10xf32>, %arg1: memref<10x10xf32>, %arg2: memref<10xf32>, %arg3: memref<10xf32>) -> memref<10xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %c10_i64 = arith.constant 10 : i64
    %c10_i64_0 = arith.constant 10 : i64
    %0 = acc.present varPtr(%arg0 : memref<10x10xf32>) varType(tensor<10x10xf32>) -> memref<10x10xf32>
    %1 = acc.present varPtr(%arg1 : memref<10x10xf32>) varType(tensor<10x10xf32>) -> memref<10x10xf32>
    %2 = acc.present varPtr(%arg2 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32>
    %3 = acc.present varPtr(%arg3 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32>
    acc.data dataOperands(%0, %1, %2, %3 : memref<10x10xf32>, memref<10x10xf32>, memref<10xf32>, memref<10xf32>) {
      %4 = acc.private varPtr(%arg2 : memref<10xf32>) varType(tensor<10xf32>) recipe(@privatization_memref_10_f32) -> memref<10xf32>
      acc.parallel num_gangs({%c10_i64 : i64}) num_workers(%c10_i64_0 : i64 [#acc.device_type<nvidia>]) private(%4 : memref<10xf32>) {
        acc.loop gang control(%arg4 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
          acc.loop worker control(%arg5 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
            %5 = memref.load %arg0[%arg4, %arg5] : memref<10x10xf32>
            %6 = memref.load %arg1[%arg4, %arg5] : memref<10x10xf32>
            %7 = arith.addf %5, %6 : f32
            memref.store %7, %arg2[%arg5] : memref<10xf32>
            acc.yield
          } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
          acc.loop control(%arg5 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
            %5 = memref.load %arg2[%arg5] : memref<10xf32>
            %6 = memref.load %arg3[%arg4] : memref<10xf32>
            %7 = arith.addf %5, %6 : f32
            memref.store %7, %arg3[%arg4] : memref<10xf32>
            acc.yield
          } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>], seq = [#acc.device_type<nvidia>]}
          acc.yield
        } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
        acc.yield
      }
      acc.terminator
    }
    return %arg3 : memref<10xf32>
  }
}

// -----
module {
  func.func @testloopop(%arg0: memref<10xf32>) {
    %c1_i64 = arith.constant 1 : i64
    %c128_i32 = arith.constant 128 : i32
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    acc.loop gang worker vector control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    acc.loop gang({num=%c1_i64 : i64}) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    acc.loop gang({static=%c1_i64 : i64}) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    acc.loop worker(%c1_i64 : i64) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    acc.loop worker(%c128_i32 : i32) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    acc.loop worker(%c8 : index) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    acc.loop vector(%c1_i64 : i64) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    acc.loop vector(%c128_i32 : i32) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    acc.loop vector(%c8 : index) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    acc.loop gang({num=%c1_i64 : i64}) worker vector control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    acc.loop gang({num=%c1_i64 : i64, static=%c1_i64 : i64}) worker(%c1_i64 : i64) vector(%c1_i64 : i64) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    acc.loop gang({num=%c128_i32 : i32, static=%c8 : index}) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    acc.loop tile({%c1_i64 : i64, %c1_i64 : i64}) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    acc.loop tile({%c128_i32 : i32, %c128_i32 : i32}) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    acc.loop gang({static=%c1_i64 : i64, num=%c1_i64 : i64}) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    acc.loop gang({dim=%c1_i64 : i64, static=%c1_i64 : i64}) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    %0 = acc.cache varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32>
    acc.loop cache(%0 : memref<10xf32>) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    return
  }
}

// -----
module {
  func.func @acc_loop_multiple_block() {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    acc.parallel {
      acc.loop control(%arg0 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
        %c1_0 = arith.constant 1 : index
        cf.br ^bb1(%c1_0 : index)
      ^bb1(%0: index):  // 2 preds: ^bb0, ^bb2
        %c0_1 = arith.constant 0 : index
        %1 = arith.cmpi sgt, %0, %c0_1 : index
        cf.cond_br %1, ^bb2, ^bb3
      ^bb2:  // pred: ^bb1
        %c1_2 = arith.constant 1 : index
        %c10_3 = arith.constant 10 : index
        %2 = arith.subi %c10_3, %c1_2 : index
        cf.br ^bb1(%2 : index)
      ^bb3:  // pred: ^bb1
        acc.yield
      } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
      acc.yield
    }
    return
  }
}

// -----
module {
  acc.firstprivate.recipe @firstprivatization_memref_10xf32 : memref<10xf32> init {
  ^bb0(%arg0: memref<10xf32>):
    %alloca = memref.alloca() : memref<10xf32>
    acc.yield %alloca : memref<10xf32>
  } copy {
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>):
    memref.copy %arg0, %arg1 : memref<10xf32> to memref<10xf32>
    acc.terminator
  } destroy {
  ^bb0(%arg0: memref<10xf32>):
    acc.terminator
  }
  func.func @testloopfirstprivate(%arg0: memref<10xf32>, %arg1: memref<10xf32>) {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    %0 = acc.firstprivate varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) recipe(@firstprivatization_memref_10xf32) -> memref<10xf32>
    acc.loop firstprivate(%0 : memref<10xf32>) control(%arg2 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      "test.openacc_dummy_op"() : () -> ()
      acc.yield
    } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
    return
  }
}

// -----
module {
  acc.private.recipe @privatization_memref_10_f32 : memref<10xf32> init {
  ^bb0(%arg0: memref<10xf32>):
    %alloc = memref.alloc() : memref<10xf32>
    acc.yield %alloc : memref<10xf32>
  } destroy {
  ^bb0(%arg0: memref<10xf32>):
    memref.dealloc %arg0 : memref<10xf32>
    acc.terminator
  }
  acc.private.recipe @privatization_memref_10_10_f32 : memref<10x10xf32> init {
  ^bb0(%arg0: memref<10x10xf32>):
    %alloc = memref.alloc() : memref<10x10xf32>
    acc.yield %alloc : memref<10x10xf32>
  } destroy {
  ^bb0(%arg0: memref<10x10xf32>):
    memref.dealloc %arg0 : memref<10x10xf32>
    acc.terminator
  }
  acc.firstprivate.recipe @privatization_memref_10xf32 : memref<10xf32> init {
  ^bb0(%arg0: memref<10xf32>):
    %alloc = memref.alloc() : memref<10xf32>
    acc.yield %alloc : memref<10xf32>
  } copy {
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>):
    acc.terminator
  } destroy {
  ^bb0(%arg0: memref<10xf32>):
    memref.dealloc %arg0 : memref<10xf32>
    acc.terminator
  }
  func.func @testparallelop(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10x10xf32>) {
    %c1_i64 = arith.constant 1 : i64
    %c1_i32 = arith.constant 1 : i32
    %c1 = arith.constant 1 : index
    acc.parallel async(%c1_i64 : i64) {
    }
    acc.parallel async(%c1_i32 : i32) {
    }
    acc.parallel async(%c1 : index) {
    }
    acc.parallel wait({%c1_i64 : i64}) {
    }
    acc.parallel wait({%c1_i32 : i32}) {
    }
    acc.parallel wait({%c1 : index}) {
    }
    acc.parallel wait({%c1_i64 : i64, %c1_i32 : i32, %c1 : index}) {
    }
    acc.parallel num_gangs({%c1_i64 : i64}) {
    }
    acc.parallel num_gangs({%c1_i32 : i32}) {
    }
    acc.parallel num_gangs({%c1 : index}) {
    }
    acc.parallel num_gangs({%c1_i64 : i64, %c1_i64 : i64, %c1 : index}) {
    }
    acc.parallel num_workers(%c1_i64 : i64 [#acc.device_type<nvidia>]) {
    }
    acc.parallel num_workers(%c1_i32 : i32 [#acc.device_type<default>]) {
    }
    acc.parallel num_workers(%c1 : index) {
    }
    acc.parallel vector_length(%c1_i64 : i64) {
    }
    acc.parallel vector_length(%c1_i32 : i32) {
    }
    acc.parallel vector_length(%c1 : index) {
    }
    %0 = acc.private varPtr(%arg0 : memref<10xf32>) recipe(@privatization_memref_10_f32) -> memref<10xf32>
    %1 = acc.private varPtr(%arg2 : memref<10x10xf32>) recipe(@privatization_memref_10_10_f32) -> memref<10x10xf32>
    %2 = acc.firstprivate varPtr(%arg1 : memref<10xf32>) recipe(@privatization_memref_10xf32) -> memref<10xf32>
    acc.parallel firstprivate(%2 : memref<10xf32>) private(%0, %1 : memref<10xf32>, memref<10x10xf32>) {
    }
    acc.parallel {
    } attributes {defaultAttr = #acc<defaultvalue none>}
    acc.parallel {
    } attributes {defaultAttr = #acc<defaultvalue present>}
    acc.parallel async {
    }
    acc.parallel wait {
    }
    acc.parallel {
    } attributes {selfAttr}
    return
  }
}

// -----
module {
  acc.private.recipe @privatization_memref_10_f32 : memref<10xf32> init {
  ^bb0(%arg0: memref<10xf32>):
    %alloc = memref.alloc() : memref<10xf32>
    acc.yield %alloc : memref<10xf32>
  } destroy {
  ^bb0(%arg0: memref<10xf32>):
    memref.dealloc %arg0 : memref<10xf32>
    acc.terminator
  }
  acc.private.recipe @privatization_memref_10_10_f32 : memref<10x10xf32> init {
  ^bb0(%arg0: memref<10x10xf32>):
    %alloc = memref.alloc() : memref<10x10xf32>
    acc.yield %alloc : memref<10x10xf32>
  } destroy {
  ^bb0(%arg0: memref<10x10xf32>):
    memref.dealloc %arg0 : memref<10x10xf32>
    acc.terminator
  }
  acc.firstprivate.recipe @firstprivatization_memref_20xf32 : memref<20xf32> init {
  ^bb0(%arg0: memref<20xf32>):
    %alloc = memref.alloc() : memref<20xf32>
    acc.yield %alloc : memref<20xf32>
  } copy {
  ^bb0(%arg0: memref<20xf32>, %arg1: memref<20xf32>):
    acc.terminator
  }
  acc.firstprivate.recipe @firstprivatization_memref_10xf32 : memref<10xf32> init {
  ^bb0(%arg0: memref<10xf32>):
    %alloc = memref.alloc() : memref<10xf32>
    acc.yield %alloc : memref<10xf32>
  } copy {
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>):
    memref.copy %arg0, %arg1 : memref<10xf32> to memref<10xf32>
    acc.terminator
  } destroy {
  ^bb0(%arg0: memref<10xf32>):
    memref.dealloc %arg0 : memref<10xf32>
    acc.terminator
  }
  func.func @testserialop(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10x10xf32>) {
    %c1_i64 = arith.constant 1 : i64
    %c1_i32 = arith.constant 1 : i32
    %c1 = arith.constant 1 : index
    acc.serial async(%c1_i64 : i64) {
    }
    acc.serial async(%c1_i32 : i32) {
    }
    acc.serial async(%c1 : index) {
    }
    acc.serial wait({%c1_i64 : i64}) {
    }
    acc.serial wait({%c1_i32 : i32}) {
    }
    acc.serial wait({%c1 : index}) {
    }
    acc.serial wait({%c1_i64 : i64, %c1_i32 : i32, %c1 : index}) {
    }
    %0 = acc.private varPtr(%arg0 : memref<10xf32>) recipe(@privatization_memref_10_f32) -> memref<10xf32>
    %1 = acc.private varPtr(%arg2 : memref<10x10xf32>) recipe(@privatization_memref_10_10_f32) -> memref<10x10xf32>
    %2 = acc.firstprivate varPtr(%arg1 : memref<10xf32>) varType(tensor<10xf32>) recipe(@firstprivatization_memref_10xf32) -> memref<10xf32>
    acc.serial firstprivate(%2 : memref<10xf32>) private(%0, %1 : memref<10xf32>, memref<10x10xf32>) {
    }
    acc.serial {
    } attributes {defaultAttr = #acc<defaultvalue none>}
    acc.serial {
    } attributes {defaultAttr = #acc<defaultvalue present>}
    acc.serial async {
    }
    acc.serial wait {
    }
    acc.serial {
    } attributes {selfAttr}
    acc.serial {
      acc.yield
    } attributes {selfAttr}
    return
  }
}

// -----
module {
  func.func @testserialop(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10x10xf32>) {
    %c1_i64 = arith.constant 1 : i64
    %c1_i32 = arith.constant 1 : i32
    %c1 = arith.constant 1 : index
    acc.kernels async(%c1_i64 : i64) {
    }
    acc.kernels async(%c1_i32 : i32) {
    }
    acc.kernels async(%c1 : index) {
    }
    acc.kernels wait({%c1_i64 : i64}) {
    }
    acc.kernels wait({%c1_i32 : i32}) {
    }
    acc.kernels wait({%c1 : index}) {
    }
    acc.kernels wait({%c1_i64 : i64, %c1_i32 : i32, %c1 : index}) {
    }
    acc.kernels {
    } attributes {defaultAttr = #acc<defaultvalue none>}
    acc.kernels {
    } attributes {defaultAttr = #acc<defaultvalue present>}
    acc.kernels async {
    }
    acc.kernels wait {
    }
    acc.kernels {
    } attributes {selfAttr}
    acc.kernels {
      acc.terminator
    } attributes {selfAttr}
    return
  }
}

// -----
module {
  acc.private.recipe @privatization_memref_10_f32 : memref<10xf32> init {
  ^bb0(%arg0: memref<10xf32>):
    %alloc = memref.alloc() : memref<10xf32>
    acc.yield %alloc : memref<10xf32>
  } destroy {
  ^bb0(%arg0: memref<10xf32>):
    memref.dealloc %arg0 : memref<10xf32>
    acc.terminator
  }
  acc.private.recipe @privatization_memref_10_10_f32 : memref<10x10xf32> init {
  ^bb0(%arg0: memref<10x10xf32>):
    %alloc = memref.alloc() : memref<10x10xf32>
    acc.yield %alloc : memref<10x10xf32>
  } destroy {
  ^bb0(%arg0: memref<10x10xf32>):
    memref.dealloc %arg0 : memref<10x10xf32>
    acc.terminator
  }
  acc.firstprivate.recipe @firstprivatization_memref_10xf32 : memref<10xf32> init {
  ^bb0(%arg0: memref<10xf32>):
    %alloca = memref.alloca() : memref<10xf32>
    acc.yield %alloca : memref<10xf32>
  } copy {
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>):
    memref.copy %arg0, %arg1 : memref<10xf32> to memref<10xf32>
    acc.terminator
  } destroy {
  ^bb0(%arg0: memref<10xf32>):
    acc.terminator
  }
  func.func @testkernelspriv(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10x10xf32>) {
    %0 = acc.private varPtr(%arg0 : memref<10xf32>) recipe(@privatization_memref_10_f32) -> memref<10xf32>
    %1 = acc.private varPtr(%arg2 : memref<10x10xf32>) recipe(@privatization_memref_10_10_f32) -> memref<10x10xf32>
    %2 = acc.firstprivate varPtr(%arg1 : memref<10xf32>) varType(tensor<10xf32>) recipe(@firstprivatization_memref_10xf32) -> memref<10xf32>
    acc.kernels firstprivate(%2 : memref<10xf32>) private(%0, %1 : memref<10xf32>, memref<10x10xf32>) {
    }
    return
  }
}

// -----
module {
  func.func @testdataop(%arg0: memref<f32>, %arg1: memref<f32>, %arg2: memref<f32>) {
    %true = arith.constant true
    %0 = acc.present varPtr(%arg0 : memref<f32>) -> memref<f32>
    acc.data if(%true) dataOperands(%0 : memref<f32>) {
    }
    %1 = acc.present varPtr(%arg0 : memref<f32>) -> memref<f32>
    acc.data if(%true) dataOperands(%1 : memref<f32>) {
    }
    %2 = acc.present varPtr(%arg0 : memref<f32>) -> memref<f32>
    %3 = acc.present varPtr(%arg1 : memref<f32>) -> memref<f32>
    %4 = acc.present varPtr(%arg2 : memref<f32>) -> memref<f32>
    acc.data dataOperands(%2, %3, %4 : memref<f32>, memref<f32>, memref<f32>) {
    }
    %5 = acc.copyin varPtr(%arg0 : memref<f32>) -> memref<f32>
    %6 = acc.copyin varPtr(%arg1 : memref<f32>) -> memref<f32>
    %7 = acc.copyin varPtr(%arg2 : memref<f32>) -> memref<f32>
    acc.data dataOperands(%5, %6, %7 : memref<f32>, memref<f32>, memref<f32>) {
    }
    %8 = acc.copyin varPtr(%arg0 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_copyin_readonly>}
    %9 = acc.copyin varPtr(%arg1 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_copyin_readonly>}
    %10 = acc.copyin varPtr(%arg2 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_copyin_readonly>}
    acc.data dataOperands(%8, %9, %10 : memref<f32>, memref<f32>, memref<f32>) {
    }
    %11 = acc.create varPtr(%arg0 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_copyout>}
    %12 = acc.create varPtr(%arg1 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_copyout>}
    %13 = acc.create varPtr(%arg2 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_copyout>}
    acc.data dataOperands(%11, %12, %13 : memref<f32>, memref<f32>, memref<f32>) {
    }
    acc.copyout accPtr(%11 : memref<f32>) to varPtr(%arg0 : memref<f32>)
    acc.copyout accPtr(%12 : memref<f32>) to varPtr(%arg1 : memref<f32>)
    acc.copyout accPtr(%13 : memref<f32>) to varPtr(%arg2 : memref<f32>)
    %14 = acc.create varPtr(%arg0 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_copyout_zero>}
    %15 = acc.create varPtr(%arg1 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_copyout_zero>}
    %16 = acc.create varPtr(%arg2 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_copyout_zero>}
    acc.data dataOperands(%14, %15, %16 : memref<f32>, memref<f32>, memref<f32>) {
    }
    acc.copyout accPtr(%14 : memref<f32>) to varPtr(%arg0 : memref<f32>) {dataClause = #acc<data_clause acc_copyout_zero>}
    acc.copyout accPtr(%15 : memref<f32>) to varPtr(%arg1 : memref<f32>) {dataClause = #acc<data_clause acc_copyout_zero>}
    acc.copyout accPtr(%16 : memref<f32>) to varPtr(%arg2 : memref<f32>) {dataClause = #acc<data_clause acc_copyout_zero>}
    %17 = acc.create varPtr(%arg0 : memref<f32>) -> memref<f32>
    %18 = acc.create varPtr(%arg1 : memref<f32>) -> memref<f32>
    %19 = acc.create varPtr(%arg2 : memref<f32>) -> memref<f32>
    acc.data dataOperands(%17, %18, %19 : memref<f32>, memref<f32>, memref<f32>) {
    }
    acc.delete accPtr(%17 : memref<f32>) {dataClause = #acc<data_clause acc_create>}
    acc.delete accPtr(%18 : memref<f32>) {dataClause = #acc<data_clause acc_create>}
    acc.delete accPtr(%19 : memref<f32>) {dataClause = #acc<data_clause acc_create>}
    %20 = acc.create varPtr(%arg0 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_create_zero>}
    %21 = acc.create varPtr(%arg1 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_create_zero>}
    %22 = acc.create varPtr(%arg2 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_create_zero>}
    acc.data dataOperands(%20, %21, %22 : memref<f32>, memref<f32>, memref<f32>) {
    }
    acc.delete accPtr(%20 : memref<f32>) {dataClause = #acc<data_clause acc_create_zero>}
    acc.delete accPtr(%21 : memref<f32>) {dataClause = #acc<data_clause acc_create_zero>}
    acc.delete accPtr(%22 : memref<f32>) {dataClause = #acc<data_clause acc_create_zero>}
    %23 = acc.nocreate varPtr(%arg0 : memref<f32>) -> memref<f32>
    %24 = acc.nocreate varPtr(%arg1 : memref<f32>) -> memref<f32>
    %25 = acc.nocreate varPtr(%arg2 : memref<f32>) -> memref<f32>
    acc.data dataOperands(%23, %24, %25 : memref<f32>, memref<f32>, memref<f32>) {
    }
    %26 = acc.deviceptr varPtr(%arg0 : memref<f32>) -> memref<f32>
    %27 = acc.deviceptr varPtr(%arg1 : memref<f32>) -> memref<f32>
    %28 = acc.deviceptr varPtr(%arg2 : memref<f32>) -> memref<f32>
    acc.data dataOperands(%26, %27, %28 : memref<f32>, memref<f32>, memref<f32>) {
    }
    %29 = acc.attach varPtr(%arg0 : memref<f32>) -> memref<f32>
    %30 = acc.attach varPtr(%arg1 : memref<f32>) -> memref<f32>
    %31 = acc.attach varPtr(%arg2 : memref<f32>) -> memref<f32>
    acc.data dataOperands(%29, %30, %31 : memref<f32>, memref<f32>, memref<f32>) {
    }
    %32 = acc.copyin varPtr(%arg0 : memref<f32>) -> memref<f32>
    %33 = acc.create varPtr(%arg1 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_copyout>}
    %34 = acc.present varPtr(%arg2 : memref<f32>) -> memref<f32>
    acc.data dataOperands(%32, %33, %34 : memref<f32>, memref<f32>, memref<f32>) {
    }
    acc.copyout accPtr(%33 : memref<f32>) to varPtr(%arg1 : memref<f32>)
    %35 = acc.present varPtr(%arg0 : memref<f32>) -> memref<f32>
    acc.data dataOperands(%35 : memref<f32>) {
    } attributes {defaultAttr = #acc<defaultvalue none>}
    %36 = acc.present varPtr(%arg0 : memref<f32>) -> memref<f32>
    acc.data dataOperands(%36 : memref<f32>) {
    } attributes {defaultAttr = #acc<defaultvalue present>}
    acc.data {
    } attributes {defaultAttr = #acc<defaultvalue none>}
    acc.data async {
    } attributes {defaultAttr = #acc<defaultvalue none>}
    %c1_i64 = arith.constant 1 : i64
    acc.data async(%c1_i64 : i64) {
    } attributes {defaultAttr = #acc<defaultvalue none>}
    acc.data wait {
    } attributes {defaultAttr = #acc<defaultvalue none>}
    %c1_i64_0 = arith.constant 1 : i64
    acc.data wait({%c1_i64_0 : i64}) {
    } attributes {defaultAttr = #acc<defaultvalue none>}
    %c1_i64_1 = arith.constant 1 : i64
    acc.data wait({devnum: %c1_i64_1 : i64, %c1_i64_0 : i64}) {
    } attributes {defaultAttr = #acc<defaultvalue none>}
    return
  }
}

// -----
module {
  func.func @testdataopmodifiers(%arg0: memref<f32>, %arg1: memref<f32>, %arg2: memref<f32>) {
    %0 = acc.create varPtr(%arg0 : memref<f32>) -> memref<f32> {modifiers = #acc<data_clause_modifier zero,capture>}
    %1 = acc.copyin varPtr(%arg1 : memref<f32>) -> memref<f32> {modifiers = #acc<data_clause_modifier always,readonly,capture>}
    %2 = acc.copyin varPtr(%arg2 : memref<f32>) -> memref<f32> {modifiers = #acc<data_clause_modifier always>}
    %3 = acc.create varPtr(%arg2 : memref<f32>) -> memref<f32> {modifiers = #acc<data_clause_modifier always>}
    acc.data dataOperands(%0, %1, %2, %3 : memref<f32>, memref<f32>, memref<f32>, memref<f32>) {
    }
    acc.copyout accPtr(%0 : memref<f32>) to varPtr(%arg0 : memref<f32>) {modifiers = #acc<data_clause_modifier always,zero,capture>}
    acc.delete accPtr(%2 : memref<f32>) {modifiers = #acc<data_clause_modifier always>}
    acc.copyout accPtr(%3 : memref<f32>) to varPtr(%arg2 : memref<f32>) {modifiers = #acc<data_clause_modifier always>}
    return
  }
}

// -----
module {
  func.func @testupdateop(%arg0: memref<f32>, %arg1: memref<f32>, %arg2: memref<f32>) {
    %c1_i64 = arith.constant 1 : i64
    %c1_i32 = arith.constant 1 : i32
    %c1 = arith.constant 1 : index
    %true = arith.constant true
    %0 = acc.update_device varPtr(%arg0 : memref<f32>) -> memref<f32>
    %1 = acc.update_device varPtr(%arg1 : memref<f32>) -> memref<f32>
    %2 = acc.update_device varPtr(%arg2 : memref<f32>) -> memref<f32>
    acc.update async(%c1_i64 : i64) dataOperands(%0 : memref<f32>)
    acc.update async(%c1_i32 : i32) dataOperands(%0 : memref<f32>)
    acc.update async(%c1_i32 : i32) dataOperands(%0 : memref<f32>)
    acc.update async(%c1 : index) dataOperands(%0 : memref<f32>)
    acc.update wait({devnum: %c1_i64 : i64, %c1_i32 : i32, %c1 : index}) dataOperands(%0 : memref<f32>)
    acc.update if(%true) dataOperands(%0 : memref<f32>)
    acc.update dataOperands(%0 : memref<f32>)
    acc.update dataOperands(%0, %1, %2 : memref<f32>, memref<f32>, memref<f32>)
    acc.update async dataOperands(%0, %1, %2 : memref<f32>, memref<f32>, memref<f32>)
    acc.update wait dataOperands(%0, %1, %2 : memref<f32>, memref<f32>, memref<f32>)
    acc.update dataOperands(%0, %1, %2 : memref<f32>, memref<f32>, memref<f32>) attributes {ifPresent}
    return
  }
}

// -----
module {
  %c1_i64 = arith.constant 1 : i64
  %c1_i32 = arith.constant 1 : i32
  %c1 = arith.constant 1 : index
  %true = arith.constant true
  acc.wait
  acc.wait(%c1_i64 : i64)
  acc.wait(%c1_i32 : i32)
  acc.wait(%c1 : index)
  acc.wait(%c1_i32, %c1 : i32, index)
  acc.wait async(%c1_i64 : i64)
  acc.wait async(%c1_i32 : i32)
  acc.wait async(%c1 : index)
  acc.wait(%c1_i32 : i32) async(%c1 : index)
  acc.wait(%c1_i64 : i64) wait_devnum(%c1_i32 : i32)
  acc.wait async
  acc.wait(%c1_i64 : i64) async(%c1 : index) wait_devnum(%c1_i32 : i32)
  acc.wait(%c1_i64 : i64) async(%c1 : index) wait_devnum(%c1_i32 : i32)
  acc.wait if(%true)
}

// -----
module {
  %c1_i64 = arith.constant 1 : i64
  %c1_i32 = arith.constant 1 : i32
  %c2_i32 = arith.constant 2 : i32
  %c1 = arith.constant 1 : index
  %true = arith.constant true
  acc.init
  acc.init attributes {acc.device_types = [#acc.device_type<nvidia>]}
  acc.init device_num(%c1_i64 : i64)
  acc.init device_num(%c1_i32 : i32)
  acc.init device_num(%c1 : index)
  acc.init if(%true)
  acc.init device_num(%c1 : index) if(%true)
  acc.init device_num(%c1 : index) if(%true)
}

// -----
module {
  %c1_i64 = arith.constant 1 : i64
  %c1_i32 = arith.constant 1 : i32
  %c2_i32 = arith.constant 2 : i32
  %c1 = arith.constant 1 : index
  %true = arith.constant true
  acc.shutdown
  acc.shutdown attributes {acc.device_types = [#acc.device_type<default>]}
  acc.shutdown device_num(%c1_i64 : i64)
  acc.shutdown device_num(%c1_i32 : i32)
  acc.shutdown device_num(%c1 : index)
  acc.shutdown if(%true)
  acc.shutdown device_num(%c1 : index) if(%true)
  acc.shutdown device_num(%c1 : index) if(%true)
}

// -----
module {
  %c2_i32 = arith.constant 2 : i32
  %0 = acc.on_device %c2_i32 : i32 -> i1
  %c2 = arith.constant 2 : index
  %1 = acc.on_device %c2 : index -> i1
}

// -----
module {
  func.func @testexitdataop(%arg0: !llvm.ptr) {
    %true = arith.constant true
    %c1_i64 = arith.constant 1 : i64
    %c1_i32 = arith.constant 1 : i32
    %c1 = arith.constant 1 : index
    %0 = acc.getdeviceptr varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.exit_data dataOperands(%0 : !llvm.ptr)
    acc.copyout accPtr(%0 : !llvm.ptr) to varPtr(%arg0 : !llvm.ptr) varType(f64)
    %1 = acc.getdeviceptr varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.exit_data dataOperands(%1 : !llvm.ptr)
    acc.delete accPtr(%1 : !llvm.ptr)
    %2 = acc.getdeviceptr varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.exit_data async dataOperands(%2 : !llvm.ptr) attributes {finalize}
    acc.delete accPtr(%2 : !llvm.ptr)
    %3 = acc.getdeviceptr varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.exit_data dataOperands(%3 : !llvm.ptr)
    acc.detach accPtr(%3 : !llvm.ptr)
    %4 = acc.getdeviceptr varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.exit_data async dataOperands(%4 : !llvm.ptr)
    acc.copyout accPtr(%4 : !llvm.ptr) to varPtr(%arg0 : !llvm.ptr) varType(f64)
    %5 = acc.getdeviceptr varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.exit_data wait dataOperands(%5 : !llvm.ptr)
    acc.delete accPtr(%5 : !llvm.ptr)
    %6 = acc.getdeviceptr varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.exit_data async(%c1_i64 : i64) dataOperands(%6 : !llvm.ptr)
    acc.copyout accPtr(%6 : !llvm.ptr) to varPtr(%arg0 : !llvm.ptr) varType(f64)
    %7 = acc.getdeviceptr varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.exit_data async(%c1_i64 : i64) dataOperands(%7 : !llvm.ptr)
    acc.copyout accPtr(%7 : !llvm.ptr) to varPtr(%arg0 : !llvm.ptr) varType(f64)
    %8 = acc.getdeviceptr varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.exit_data if(%true) dataOperands(%8 : !llvm.ptr)
    acc.copyout accPtr(%8 : !llvm.ptr) to varPtr(%arg0 : !llvm.ptr) varType(f64)
    %9 = acc.getdeviceptr varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.exit_data wait_devnum(%c1_i64 : i64) wait(%c1_i32, %c1 : i32, index) dataOperands(%9 : !llvm.ptr)
    acc.copyout accPtr(%9 : !llvm.ptr) to varPtr(%arg0 : !llvm.ptr) varType(f64)
    return
  }
}

// -----
module {
  func.func @testenterdataop(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    %true = arith.constant true
    %c1_i64 = arith.constant 1 : i64
    %c1_i32 = arith.constant 1 : i32
    %c1 = arith.constant 1 : index
    %0 = acc.copyin varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.enter_data dataOperands(%0 : !llvm.ptr)
    %1 = acc.create varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    %2 = acc.create varPtr(%arg1 : !llvm.ptr) varType(f64) -> !llvm.ptr {dataClause = #acc<data_clause acc_create_zero>}
    %3 = acc.create varPtr(%arg2 : !llvm.ptr) varType(f64) -> !llvm.ptr {dataClause = #acc<data_clause acc_create_zero>}
    acc.enter_data dataOperands(%1, %2, %3 : !llvm.ptr, !llvm.ptr, !llvm.ptr)
    %4 = acc.attach varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.enter_data dataOperands(%4 : !llvm.ptr)
    %5 = acc.copyin varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.enter_data async dataOperands(%5 : !llvm.ptr)
    %6 = acc.create varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.enter_data wait dataOperands(%6 : !llvm.ptr)
    %7 = acc.copyin varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.enter_data async(%c1_i64 : i64) dataOperands(%7 : !llvm.ptr)
    %8 = acc.copyin varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.enter_data async(%c1_i64 : i64) dataOperands(%8 : !llvm.ptr)
    %9 = acc.copyin varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.enter_data if(%true) dataOperands(%9 : !llvm.ptr)
    %10 = acc.copyin varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.enter_data wait_devnum(%c1_i64 : i64) wait(%c1_i32, %c1 : i32, index) dataOperands(%10 : !llvm.ptr)
    return
  }
}

// -----
module {
  func.func @teststructureddataclauseops(%arg0: memref<10xf32>, %arg1: memref<memref<10xf32>>, %arg2: memref<10x20xf32>) {
    %0 = acc.deviceptr varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32> {name = "arrayA"}
    acc.parallel dataOperands(%0 : memref<10xf32>) {
    }
    %1 = acc.present varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32>
    acc.data dataOperands(%1 : memref<10xf32>) {
    }
    %2 = acc.copyin varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32>
    acc.parallel dataOperands(%2 : memref<10xf32>) {
    }
    %3 = acc.copyin varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32> {dataClause = #acc<data_clause acc_copyin_readonly>}
    acc.kernels dataOperands(%3 : memref<10xf32>) {
    }
    %4 = acc.copyin varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32> {dataClause = #acc<data_clause acc_copy>}
    acc.serial dataOperands(%4 : memref<10xf32>) {
    }
    acc.copyout accPtr(%4 : memref<10xf32>) to varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) {dataClause = #acc<data_clause acc_copy>}
    %5 = acc.create varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32>
    %6 = acc.create varPtr(%arg2 : memref<10x20xf32>) varType(tensor<10x20xf32>) -> memref<10x20xf32> {implicit = true}
    acc.parallel dataOperands(%5, %6 : memref<10xf32>, memref<10x20xf32>) {
    }
    acc.delete accPtr(%5 : memref<10xf32>) {dataClause = #acc<data_clause acc_create>}
    acc.delete accPtr(%6 : memref<10x20xf32>) {dataClause = #acc<data_clause acc_create>, implicit = true}
    %7 = acc.create varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32> {dataClause = #acc<data_clause acc_copyout_zero>}
    acc.parallel dataOperands(%7 : memref<10xf32>) {
    }
    acc.copyout accPtr(%7 : memref<10xf32>) to varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) {dataClause = #acc<data_clause acc_copyout_zero>}
    %8 = acc.attach varPtr(%arg1 : memref<memref<10xf32>>) -> memref<memref<10xf32>>
    acc.parallel dataOperands(%8 : memref<memref<10xf32>>) {
    }
    acc.detach accPtr(%8 : memref<memref<10xf32>>) {dataClause = #acc<data_clause acc_attach>}
    %9 = acc.copyin varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) varPtrPtr(%arg1 : memref<memref<10xf32>>) -> memref<10xf32> {dataClause = #acc<data_clause acc_copy>}
    acc.parallel dataOperands(%9 : memref<10xf32>) {
    }
    acc.copyout accPtr(%9 : memref<10xf32>) to varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) {dataClause = #acc<data_clause acc_copy>}
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c9 = arith.constant 9 : index
    %c10 = arith.constant 10 : index
    %c20 = arith.constant 20 : index
    %10 = acc.bounds lowerbound(%c0 : index) upperbound(%c9 : index) stride(%c1 : index)
    %11 = acc.copyin varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) bounds(%10) -> memref<10xf32> {name = "arrayA[0:9]"}
    %12 = acc.bounds lowerbound(%c1 : index) upperbound(%c20 : index) extent(%c20 : index) stride(%c4 : index) startIdx(%c1 : index) {strideInBytes = true}
    %13 = acc.copyin varPtr(%arg2 : memref<10x20xf32>) varType(tensor<10x20xf32>) bounds(%10, %12) -> memref<10x20xf32>
    acc.parallel dataOperands(%11, %13 : memref<10xf32>, memref<10x20xf32>) {
    }
    %14 = acc.bounds lowerbound(%c4 : index) upperbound(%c9 : index) stride(%c1 : index)
    %15 = acc.copyin varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) bounds(%14) -> memref<10xf32> {dataClause = #acc<data_clause acc_copy>}
    acc.parallel dataOperands(%15 : memref<10xf32>) {
    }
    acc.copyout accPtr(%15 : memref<10xf32>) bounds(%14) to varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) {dataClause = #acc<data_clause acc_copy>}
    return
  }
}

// -----
module {
  func.func @testunstructuredclauseops(%arg0: memref<10xf32>) {
    %0 = acc.copyin varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32> {structured = false}
    acc.enter_data dataOperands(%0 : memref<10xf32>)
    %1 = acc.getdeviceptr varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32> {dataClause = #acc<data_clause acc_copyout>}
    acc.exit_data dataOperands(%1 : memref<10xf32>)
    acc.copyout accPtr(%1 : memref<10xf32>) to varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) {structured = false}
    return
  }
}

// -----
module {
  func.func @host_device_ops(%arg0: memref<f32>) {
    %0 = acc.getdeviceptr varPtr(%arg0 : memref<f32>) -> memref<f32>
    acc.update_host accPtr(%0 : memref<f32>) to varPtr(%arg0 : memref<f32>) {structured = false}
    acc.update dataOperands(%0 : memref<f32>)
    %1 = acc.update_device varPtr(%arg0 : memref<f32>) -> memref<f32>
    acc.update dataOperands(%1 : memref<f32>)
    return
  }
}

// -----
module {
  func.func @host_data_ops(%arg0: !llvm.ptr, %arg1: i1) {
    %0 = acc.use_device varPtr(%arg0 : !llvm.ptr) varType(f64) -> !llvm.ptr
    acc.host_data dataOperands(%0 : !llvm.ptr) {
    }
    acc.host_data dataOperands(%0 : !llvm.ptr) {
    } attributes {if_present}
    acc.host_data if(%arg1) dataOperands(%0 : !llvm.ptr) {
    }
    return
  }
}

// -----
module {
  acc.private.recipe @privatization_i32 : !llvm.ptr init {
  ^bb0(%arg0: !llvm.ptr):
    %c1_i32 = arith.constant 1 : i32
    %c0_i32 = arith.constant 0 : i32
    %0 = llvm.alloca %c1_i32 x i32 : (i32) -> !llvm.ptr
    llvm.store %c0_i32, %0 : i32, !llvm.ptr
    acc.yield %0 : !llvm.ptr
  }
}

// -----
module {
  func.func private @destroy_struct(!llvm.struct<(i32, i32)>)
  acc.private.recipe @privatization_struct_i32_i64 : !llvm.struct<(i32, i32)> init {
  ^bb0(%arg0: !llvm.struct<(i32, i32)>):
    %c1_i32 = arith.constant 1 : i32
    %0 = llvm.mlir.undef : !llvm.struct<(i32, i32)>
    %1 = llvm.insertvalue %c1_i32, %0[0] : !llvm.struct<(i32, i32)> 
    %2 = llvm.insertvalue %c1_i32, %1[1] : !llvm.struct<(i32, i32)> 
    acc.yield %2 : !llvm.struct<(i32, i32)>
  } destroy {
  ^bb0(%arg0: !llvm.struct<(i32, i32)>):
    func.call @destroy_struct(%arg0) : (!llvm.struct<(i32, i32)>) -> ()
    acc.terminator
  }
}

// -----
module {
  acc.reduction.recipe @reduction_add_memref_i64 : memref<i64> reduction_operator <add> init {
  ^bb0(%arg0: memref<i64>):
    %c0_i64 = arith.constant 0 : i64
    %alloca = memref.alloca() : memref<i64>
    memref.store %c0_i64, %alloca[] : memref<i64>
    acc.yield %alloca : memref<i64>
  } combiner {
  ^bb0(%arg0: memref<i64>, %arg1: memref<i64>):
    %0 = memref.load %arg0[] : memref<i64>
    %1 = memref.load %arg1[] : memref<i64>
    %2 = arith.addi %0, %1 : i64
    memref.store %2, %arg0[] : memref<i64>
    acc.yield %arg0 : memref<i64>
  }
  func.func @acc_reduc_test(%arg0: memref<i64>) {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    %0 = acc.reduction varPtr(%arg0 : memref<i64>) recipe(@reduction_add_memref_i64) -> memref<i64>
    acc.parallel reduction(%0 : memref<i64>) {
      acc.loop reduction(%0 : memref<i64>) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
        acc.yield
      } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
      acc.yield
    }
    return
  }
}

// -----
module {
  acc.reduction.recipe @reduction_add_memref_i64 : memref<i64> reduction_operator <add> init {
  ^bb0(%arg0: memref<i64>):
    %c0_i64 = arith.constant 0 : i64
    %alloca = memref.alloca() : memref<i64>
    memref.store %c0_i64, %alloca[] : memref<i64>
    acc.yield %alloca : memref<i64>
  } combiner {
  ^bb0(%arg0: memref<i64>, %arg1: memref<i64>):
    %0 = memref.load %arg0[] : memref<i64>
    %1 = memref.load %arg1[] : memref<i64>
    %2 = arith.addi %0, %1 : i64
    memref.store %2, %arg0[] : memref<i64>
    acc.yield %arg0 : memref<i64>
  }
  func.func @acc_reduc_test(%arg0: memref<i64>) {
    %0 = acc.reduction varPtr(%arg0 : memref<i64>) recipe(@reduction_add_memref_i64) -> memref<i64>
    acc.serial reduction(%0 : memref<i64>) {
    }
    return
  }
}

// -----
module {
  acc.reduction.recipe @reduction_add_memref_i64 : memref<i64> reduction_operator <add> init {
  ^bb0(%arg0: memref<i64>):
    %c0_i64 = arith.constant 0 : i64
    %alloca = memref.alloca() : memref<i64>
    memref.store %c0_i64, %alloca[] : memref<i64>
    acc.yield %alloca : memref<i64>
  } combiner {
  ^bb0(%arg0: memref<i64>, %arg1: memref<i64>):
    %0 = memref.load %arg0[] : memref<i64>
    %1 = memref.load %arg1[] : memref<i64>
    %2 = arith.addi %0, %1 : i64
    memref.store %2, %arg0[] : memref<i64>
    acc.yield %arg0 : memref<i64>
  }
  func.func @acc_kernels_reduc_test(%arg0: memref<i64>) {
    %0 = acc.reduction varPtr(%arg0 : memref<i64>) recipe(@reduction_add_memref_i64) -> memref<i64>
    acc.kernels reduction(%0 : memref<i64>) {
    }
    return
  }
}

// -----
module {
  func.func @testdeclareop(%arg0: memref<f32>, %arg1: memref<f32>, %arg2: memref<f32>) {
    %0 = acc.copyin varPtr(%arg0 : memref<f32>) -> memref<f32>
    %1 = acc.copyin varPtr(%arg1 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_copyin_readonly>}
    %2 = acc.copyin varPtr(%arg2 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_copy>}
    %3 = acc.declare_enter dataOperands(%0, %1, %2 : memref<f32>, memref<f32>, memref<f32>)
    %4 = acc.create varPtr(%arg0 : memref<f32>) -> memref<f32>
    %5 = acc.create varPtr(%arg1 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_copyout>}
    %6 = acc.present varPtr(%arg2 : memref<f32>) -> memref<f32>
    %7 = acc.declare_enter dataOperands(%4, %5, %6 : memref<f32>, memref<f32>, memref<f32>)
    %8 = acc.deviceptr varPtr(%arg0 : memref<f32>) -> memref<f32>
    %9 = acc.declare_device_resident varPtr(%arg1 : memref<f32>) -> memref<f32>
    %10 = acc.declare_link varPtr(%arg2 : memref<f32>) -> memref<f32>
    %11 = acc.declare_enter dataOperands(%8, %9, %10 : memref<f32>, memref<f32>, memref<f32>)
    acc.declare_exit dataOperands(%9, %10 : memref<f32>, memref<f32>)
    acc.delete accPtr(%9 : memref<f32>) {dataClause = #acc<data_clause acc_declare_device_resident>}
    acc.delete accPtr(%10 : memref<f32>) {dataClause = #acc<data_clause acc_declare_link>}
    acc.declare_exit dataOperands(%4, %5, %6 : memref<f32>, memref<f32>, memref<f32>)
    acc.delete accPtr(%4 : memref<f32>) {dataClause = #acc<data_clause acc_create>}
    acc.copyout accPtr(%5 : memref<f32>) to varPtr(%arg1 : memref<f32>)
    acc.delete accPtr(%6 : memref<f32>) {dataClause = #acc<data_clause acc_present>}
    acc.declare_exit dataOperands(%0, %1, %2 : memref<f32>, memref<f32>, memref<f32>)
    acc.delete accPtr(%0 : memref<f32>) {dataClause = #acc<data_clause acc_copyin>}
    acc.delete accPtr(%1 : memref<f32>) {dataClause = #acc<data_clause acc_copyin_readonly>}
    acc.copyout accPtr(%2 : memref<f32>) to varPtr(%arg2 : memref<f32>) {dataClause = #acc<data_clause acc_copy>}
    return
  }
}

// -----
module {
  llvm.mlir.global external @globalvar() {acc.declare = #acc.declare<dataClause = acc_create>, addr_space = 0 : i32} : i32 {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.return %0 : i32
  }
  acc.global_ctor @acc_constructor {
    %0 = llvm.mlir.addressof @globalvar {acc.declare = #acc.declare<dataClause = acc_create>} : !llvm.ptr
    %1 = acc.create varPtr(%0 : !llvm.ptr) varType(i32) -> !llvm.ptr
    %2 = acc.declare_enter dataOperands(%1 : !llvm.ptr)
    acc.terminator
  }
  acc.global_dtor @acc_destructor {
    %0 = llvm.mlir.addressof @globalvar {acc.declare = #acc.declare<dataClause = acc_create>} : !llvm.ptr
    %1 = acc.getdeviceptr varPtr(%0 : !llvm.ptr) varType(i32) -> !llvm.ptr {dataClause = #acc<data_clause acc_create>}
    acc.declare_exit dataOperands(%1 : !llvm.ptr)
    acc.delete accPtr(%1 : !llvm.ptr)
    acc.terminator
  }
}

// -----
module {
  func.func @acc_func(%arg0: i64) attributes {acc.routine_info = #acc.routine_info<[@acc_func_rout1, @acc_func_rout2, @acc_func_rout3, @acc_func_rout4, @acc_func_rout5, @acc_func_rout6, @acc_func_rout7, @acc_func_rout8, @acc_func_rout9]>} {
    return
  }
  acc.routine @acc_func_rout1 func(@acc_func)
  acc.routine @acc_func_rout2 func(@acc_func) bind("acc_func_gpu")
  acc.routine @acc_func_rout3 func(@acc_func) bind("acc_func_gpu_gang") gang
  acc.routine @acc_func_rout4 func(@acc_func) bind("acc_func_gpu_vector") vector 
  acc.routine @acc_func_rout5 func(@acc_func) bind("acc_func_gpu_worker") worker 
  acc.routine @acc_func_rout6 func(@acc_func) bind("acc_func_gpu_seq") seq 
  acc.routine @acc_func_rout7 func(@acc_func) bind("acc_func_gpu_imp_gang") gang implicit
  acc.routine @acc_func_rout8 func(@acc_func) bind("acc_func_gpu_vector_nohost") vector  nohost
  acc.routine @acc_func_rout9 func(@acc_func) bind("acc_func_gpu_gang_dim1") gang(dim: 1 : i64)
}

// -----
module {
  acc.routine @routine_seq func(@device_func_seq) seq 
  acc.routine @routine_gang func(@device_func_gang) gang
  acc.routine @routine_gang_dim2 func(@device_func_gang_dim2) gang(dim: 2 : i64)
  acc.routine @routine_gang_dim3 func(@device_func_gang_dim3) gang(dim: 3 : i64)
  acc.routine @routine_worker func(@device_func_worker) worker 
  acc.routine @routine_vector func(@device_func_vector) vector 
  func.func @device_func_seq() attributes {acc.specialized_routine = #acc.specialized_routine<@routine_seq, <seq>, "host_func_seq">} {
    return
  }
  func.func @device_func_gang() attributes {acc.specialized_routine = #acc.specialized_routine<@routine_gang, <gang_dim1>, "host_func_gang">} {
    return
  }
  func.func @device_func_gang_dim2() attributes {acc.specialized_routine = #acc.specialized_routine<@routine_gang_dim2, <gang_dim2>, "host_func_gang_dim2">} {
    return
  }
  func.func @device_func_gang_dim3() attributes {acc.specialized_routine = #acc.specialized_routine<@routine_gang_dim3, <gang_dim3>, "host_func_gang_dim3">} {
    return
  }
  func.func @device_func_worker() attributes {acc.specialized_routine = #acc.specialized_routine<@routine_worker, <worker>, "host_func_worker">} {
    return
  }
  func.func @device_func_vector() attributes {acc.specialized_routine = #acc.specialized_routine<@routine_vector, <vector>, "host_func_vector">} {
    return
  }
}

// -----
module {
  func.func @acc_func() {
    "test.openacc_dummy_op"() {acc.declare_action = #acc.declare_action<postAlloc = @_QMacc_declareFacc_declare_allocateEa_acc_declare_update_desc_post_alloc>} : () -> ()
    return
  }
}

// -----
module {
  func.func @compute3(%arg0: memref<10x10xf32>, %arg1: memref<10x10xf32>, %arg2: memref<10xf32>, %arg3: memref<10xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %c10_i64 = arith.constant 10 : i64
    %c10_i64_0 = arith.constant 10 : i64
    %c20_i32 = arith.constant 20 : i32
    %0 = llvm.alloca %c20_i32 x i32 {acc.declare = #acc.declare<dataClause = acc_create, implicit = true>} : (i32) -> !llvm.ptr
    %1 = acc.create varPtr(%0 : !llvm.ptr) varType(!llvm.array<20 x i32>) -> !llvm.ptr {implicit = true}
    %2 = acc.present varPtr(%arg0 : memref<10x10xf32>) varType(tensor<10x10xf32>) -> memref<10x10xf32>
    %3 = acc.present varPtr(%arg1 : memref<10x10xf32>) varType(tensor<10x10xf32>) -> memref<10x10xf32>
    %4 = acc.present varPtr(%arg2 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32>
    %5 = acc.present varPtr(%arg3 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32>
    acc.declare dataOperands(%2, %3, %4, %5, %1 : memref<10x10xf32>, memref<10x10xf32>, memref<10xf32>, memref<10xf32>, !llvm.ptr) {
    }
    return
  }
}

// -----
module {
  %c1_i64 = arith.constant 1 : i64
  %c1_i32 = arith.constant 1 : i32
  %c2_i32 = arith.constant 2 : i32
  %c1 = arith.constant 1 : index
  %true = arith.constant true
  acc.set attributes {device_type = #acc.device_type<nvidia>}
  acc.set device_num(%c1_i64 : i64)
  acc.set device_num(%c1_i32 : i32)
  acc.set device_num(%c1 : index)
  acc.set device_num(%c1 : index) if(%true)
  acc.set default_async(%c1_i32 : i32)
}

// -----
module {
  func.func @acc_atomic_read(%arg0: memref<i32>, %arg1: memref<i32>) {
    acc.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    %true = arith.constant true
    acc.atomic.read if(%true) %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    return
  }
}

// -----
module {
  func.func @acc_atomic_write(%arg0: memref<i32>, %arg1: i32) {
    acc.atomic.write %arg0 = %arg1 : memref<i32>, i32
    %true = arith.constant true
    acc.atomic.write if(%true) %arg0 = %arg1 : memref<i32>, i32
    return
  }
}

// -----
module {
  func.func @acc_atomic_update(%arg0: memref<i32>, %arg1: i32, %arg2: memref<i1>, %arg3: i1) {
    acc.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      acc.yield %0 : i32
    }
    %true = arith.constant true
    acc.atomic.update if(%true) %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      acc.yield %0 : i32
    }
    acc.atomic.update %arg2 : memref<i1> {
    ^bb0(%arg4: i1):
      %0 = llvm.and %arg4, %arg3 : i1
      acc.yield %0 : i1
    }
    acc.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.shl %arg4, %arg1 : i32
      acc.yield %0 : i32
    }
    acc.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.intr.smax(%arg4, %arg1) : (i32, i32) -> i32
      acc.yield %0 : i32
    }
    acc.atomic.update %arg2 : memref<i1> {
    ^bb0(%arg4: i1):
      %0 = llvm.icmp "eq" %arg4, %arg3 : i1
      acc.yield %0 : i1
    }
    acc.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      acc.yield %arg4 : i32
    }
    %c42_i32 = arith.constant 42 : i32
    acc.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      acc.yield %c42_i32 : i32
    }
    return
  }
}

// -----
module {
  func.func @acc_atomic_capture(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: i32) {
    acc.atomic.capture {
      acc.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        acc.yield %0 : i32
      }
      acc.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    acc.atomic.capture {
      acc.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
      acc.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        acc.yield %0 : i32
      }
    }
    acc.atomic.capture {
      acc.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
      acc.atomic.write %arg1 = %arg2 : memref<i32>, i32
    }
    %true = arith.constant true
    acc.atomic.capture if(%true) {
      acc.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
      acc.atomic.write %arg1 = %arg2 : memref<i32>, i32
    }
    return
  }
}

// -----
module {
  func.func @acc_num_gangs() {
    %c2_i32 = arith.constant 2 : i32
    %c1_i32 = arith.constant 1 : i32
    acc.parallel num_gangs({%c2_i32 : i32} [#acc.device_type<default>], {%c1_i32 : i32, %c1_i32 : i32, %c1_i32 : i32} [#acc.device_type<nvidia>]) {
    }
    return
  }
}

// -----
module {
  func.func @acc_combined() {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    acc.parallel combined(loop) {
      acc.loop combined(parallel) control(%arg0 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
        acc.yield
      } attributes {independent = [#acc.device_type<none>]}
      acc.terminator
    }
    acc.kernels combined(loop) {
      acc.loop combined(kernels) control(%arg0 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
        acc.yield
      } attributes {auto_ = [#acc.device_type<none>]}
      acc.terminator
    }
    acc.serial combined(loop) {
      acc.loop combined(serial) control(%arg0 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
        acc.yield
      } attributes {seq = [#acc.device_type<none>]}
      acc.terminator
    }
    return
  }
  acc.firstprivate.recipe @firstprivatization_memref_i32 : memref<i32> init {
  ^bb0(%arg0: memref<i32>):
    %alloca = memref.alloca() : memref<i32>
    acc.yield %alloca : memref<i32>
  } copy {
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %0 = memref.load %arg1[] : memref<i32>
    memref.store %0, %arg0[] : memref<i32>
    acc.terminator
  }
  acc.reduction.recipe @reduction_add_memref_i32 : memref<i32> reduction_operator <add> init {
  ^bb0(%arg0: memref<i32>):
    %c0_i32 = arith.constant 0 : i32
    %alloca = memref.alloca() : memref<i32>
    memref.store %c0_i32, %alloca[] : memref<i32>
    acc.yield %alloca : memref<i32>
  } combiner {
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %0 = memref.load %arg0[] : memref<i32>
    %1 = memref.load %arg1[] : memref<i32>
    %2 = arith.addi %0, %1 : i32
    memref.store %2, %arg0[] : memref<i32>
    acc.yield %arg0 : memref<i32>
  }
}

// -----
module {
  acc.reduction.recipe @reduction_add_with_destroy : memref<?xf32> reduction_operator <add> init {
  ^bb0(%arg0: memref<?xf32>):
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?xf32>
    %alloc = memref.alloc(%dim) : memref<?xf32>
    %c1 = arith.constant 1 : index
    scf.for %arg1 = %c0 to %dim step %c1 {
      memref.store %cst, %alloc[%arg1] : memref<?xf32>
    }
    acc.yield %alloc : memref<?xf32>
  } combiner {
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg0, %c0 : memref<?xf32>
    scf.for %arg2 = %c0 to %dim step %c1 {
      %0 = memref.load %arg0[%arg2] : memref<?xf32>
      %1 = memref.load %arg1[%arg2] : memref<?xf32>
      %2 = arith.addf %0, %1 : f32
      memref.store %2, %arg0[%arg2] : memref<?xf32>
    }
    acc.yield %arg0 : memref<?xf32>
  } destroy {
  ^bb0(%arg0: memref<?xf32>):
    memref.dealloc %arg0 : memref<?xf32>
    acc.yield
  }
}

// -----
module {
  acc.private.recipe @privatization_memref_i32 : memref<i32> init {
  ^bb0(%arg0: memref<i32>):
    %alloca = memref.alloca() : memref<i32>
    acc.yield %alloca : memref<i32>
  }
}

// -----
module {
  func.func @acc_loop_container() {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    acc.loop {
      scf.for %arg0 = %c0 to %c10 step %c1 {
      }
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
}

// -----
module {
  func.func @acc_loop_container() {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    acc.loop {
      scf.for %arg0 = %c0 to %c10 step %c1 {
        scf.for %arg1 = %c0 to %c10 step %c1 {
        }
      }
      acc.yield
    } attributes {collapse = [2], collapseDeviceType = [#acc.device_type<none>], independent = [#acc.device_type<none>]}
    return
  }
}

// -----
module {
  func.func @acc_unstructured_loop() {
    acc.loop {
      acc.yield
    } attributes {independent = [#acc.device_type<none>], unstructured}
    return
  }
}

// -----
module {
  acc.private.recipe @privatization_memref_slice : memref<10x10xf32> init {
  ^bb0(%arg0: memref<10x10xf32>, %arg1: !acc.data_bounds_ty, %arg2: !acc.data_bounds_ty):
    %0 = acc.get_lowerbound %arg1 : (!acc.data_bounds_ty) -> index
    %1 = acc.get_extent %arg1 : (!acc.data_bounds_ty) -> index
    %2 = acc.get_stride %arg1 : (!acc.data_bounds_ty) -> index
    %3 = acc.get_lowerbound %arg2 : (!acc.data_bounds_ty) -> index
    %4 = acc.get_extent %arg2 : (!acc.data_bounds_ty) -> index
    %5 = acc.get_stride %arg2 : (!acc.data_bounds_ty) -> index
    %alloca = memref.alloca(%4, %1) : memref<?x?xf32>
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    %6 = arith.muli %3, %c10 : index
    %7 = arith.muli %0, %c1 : index
    %8 = arith.addi %6, %7 : index
    %9 = arith.subi %c0, %8 : index
    %reinterpret_cast = memref.reinterpret_cast %alloca to offset: [%9], sizes: [10, 10], strides: [%c10, %c1] : memref<?x?xf32> to memref<10x10xf32, strided<[?, ?], offset: ?>>
    %cast = memref.cast %reinterpret_cast : memref<10x10xf32, strided<[?, ?], offset: ?>> to memref<10x10xf32>
    acc.yield %cast : memref<10x10xf32>
  }
}

// -----
module {
  func.func @test_firstprivate_map(%arg0: memref<10xf32>) {
    %0 = acc.firstprivate_map varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32>
    acc.parallel {
      %alloca = memref.alloca() : memref<10xf32>
      %c0 = arith.constant 0 : index
      %c10 = arith.constant 10 : index
      %c1 = arith.constant 1 : index
      scf.for %arg1 = %c0 to %c10 step %c1 {
        %1 = memref.load %0[%arg1] : memref<10xf32>
        memref.store %1, %alloca[%arg1] : memref<10xf32>
      }
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @test_kernel_environment(%arg0: memref<1024xf32>, %arg1: memref<1024xf32>) {
    %c1 = arith.constant 1 : index
    %c1024 = arith.constant 1024 : index
    %0 = acc.copyin varPtr(%arg0 : memref<1024xf32>) -> memref<1024xf32>
    %1 = acc.create varPtr(%arg1 : memref<1024xf32>) -> memref<1024xf32>
    acc.kernel_environment dataOperands(%0, %1 : memref<1024xf32>, memref<1024xf32>) {
      gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %c1, %arg9 = %c1, %arg10 = %c1) threads(%arg5, %arg6, %arg7) in (%arg11 = %c1024, %arg12 = %c1, %arg13 = %c1) {
        %2 = memref.load %0[%arg5] : memref<1024xf32>
        %3 = arith.mulf %2, %2 : f32
        memref.store %3, %1[%arg5] : memref<1024xf32>
        gpu.terminator
      }
    }
    acc.copyout accPtr(%1 : memref<1024xf32>) to varPtr(%arg1 : memref<1024xf32>)
    acc.delete accPtr(%0 : memref<1024xf32>)
    return
  }
}

// -----
module {
  func.func @test_kernel_environment_with_async(%arg0: memref<1024xf32>) {
    %c1 = arith.constant 1 : index
    %c1024 = arith.constant 1024 : index
    %c1_i32 = arith.constant 1 : i32
    %0 = acc.create varPtr(%arg0 : memref<1024xf32>) async(%c1_i32 : i32) -> memref<1024xf32>
    acc.kernel_environment dataOperands(%0 : memref<1024xf32>) async(%c1_i32 : i32) {
      gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %c1, %arg8 = %c1, %arg9 = %c1) threads(%arg4, %arg5, %arg6) in (%arg10 = %c1024, %arg11 = %c1, %arg12 = %c1) {
        %cst = arith.constant 0.000000e+00 : f32
        memref.store %cst, %0[%arg4] : memref<1024xf32>
        gpu.terminator
      }
    }
    acc.copyout accPtr(%0 : memref<1024xf32>) async(%c1_i32 : i32) to varPtr(%arg0 : memref<1024xf32>)
    return
  }
}

// -----
module {
  func.func @test_acc_reduction_combine(%arg0: memref<i32>, %arg1: memref<i32>) {
    acc.reduction_combine %arg0 into %arg1 <add> : memref<i32>
    return
  }
}

// -----
module {
  func.func @test_getdeviceptr_opaque_ptr(%arg0: !llvm.ptr) {
    %0 = acc.getdeviceptr varPtr(%arg0 : !llvm.ptr) -> !llvm.ptr
    %1 = acc.declare_enter dataOperands(%0 : !llvm.ptr)
    return
  }
}

// -----
module {
  acc.reduction.recipe @reduction_maximum_memref_f32 : memref<f32> reduction_operator <maximumf> init {
  ^bb0(%arg0: memref<f32>):
    %alloca = memref.alloca() : memref<f32>
    acc.yield %alloca : memref<f32>
  } combiner {
  ^bb0(%arg0: memref<f32>, %arg1: memref<f32>):
    acc.yield %arg0 : memref<f32>
  }
  acc.reduction.recipe @reduction_maxnum_memref_f32 : memref<f32> reduction_operator <maxnumf> init {
  ^bb0(%arg0: memref<f32>):
    %alloca = memref.alloca() : memref<f32>
    acc.yield %alloca : memref<f32>
  } combiner {
  ^bb0(%arg0: memref<f32>, %arg1: memref<f32>):
    acc.yield %arg0 : memref<f32>
  }
  acc.reduction.recipe @reduction_minimum_memref_f32 : memref<f32> reduction_operator <minimumf> init {
  ^bb0(%arg0: memref<f32>):
    %alloca = memref.alloca() : memref<f32>
    acc.yield %alloca : memref<f32>
  } combiner {
  ^bb0(%arg0: memref<f32>, %arg1: memref<f32>):
    acc.yield %arg0 : memref<f32>
  }
  acc.reduction.recipe @reduction_minnum_memref_f32 : memref<f32> reduction_operator <minnumf> init {
  ^bb0(%arg0: memref<f32>):
    %alloca = memref.alloca() : memref<f32>
    acc.yield %alloca : memref<f32>
  } combiner {
  ^bb0(%arg0: memref<f32>, %arg1: memref<f32>):
    acc.yield %arg0 : memref<f32>
  }
}

