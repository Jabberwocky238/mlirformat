module {
  func.func @omp_barrier() {
    omp.barrier
    return
  }
  func.func @omp_master() {
    omp.master {
      omp.terminator
    }
    return
  }
  func.func @omp_masked(%arg0: i32) {
    omp.masked filter(%arg0 : i32) {
      omp.terminator
    }
    omp.masked {
      omp.terminator
    }
    return
  }
  func.func @omp_taskwait() {
    omp.taskwait
    return
  }
  func.func @omp_taskyield() {
    omp.taskyield
    return
  }
  func.func @omp_flush(%arg0: memref<i32>) {
    omp.flush
    omp.flush(%arg0 : memref<i32>)
    omp.flush(%arg0, %arg0 : memref<i32>, memref<i32>)
    return
  }
  func.func @omp_terminator() {
    omp.terminator
  }
  func.func @omp_parallel(%arg0: memref<i32>, %arg1: i1, %arg2: i32, %arg3: index) {
    omp.parallel allocate(%arg0 : memref<i32> -> %arg0 : memref<i32>) if(%arg1) num_threads(%arg2 : i32) proc_bind(spread) {
      omp.parallel allocate(%arg0 : memref<i32> -> %arg0 : memref<i32>) num_threads(%arg2 : i32) {
        omp.terminator
      }
      omp.barrier
      omp.parallel allocate(%arg0 : memref<i32> -> %arg0 : memref<i32>) if(%arg1) {
        omp.terminator
      }
      omp.parallel if(%arg1) num_threads(%arg2 : i32) {
        omp.terminator
      }
      omp.terminator
    }
    omp.parallel allocate(%arg0 : memref<i32> -> %arg0 : memref<i32>) {
      omp.terminator
    }
    omp.parallel {
      omp.distribute {
        omp.wsloop {
          omp.loop_nest (%arg4) : index = (%arg3) to (%arg3) step (%arg3) {
            omp.yield
          }
        } {omp.composite}
      } {omp.composite}
      omp.terminator
    } {omp.composite}
    omp.parallel {
      omp.distribute {
        omp.wsloop {
          omp.simd {
            omp.loop_nest (%arg4) : index = (%arg3) to (%arg3) step (%arg3) {
              omp.yield
            }
          } {omp.composite}
        } {omp.composite}
      } {omp.composite}
      omp.terminator
    } {omp.composite}
    return
  }
  func.func @omp_parallel_pretty(%arg0: memref<i32>, %arg1: i1, %arg2: i32, %arg3: si32) {
    omp.parallel {
      omp.terminator
    }
    omp.parallel num_threads(%arg2 : i32) {
      omp.terminator
    }
    %c2 = arith.constant 2 : index
    omp.parallel num_threads(%c2 : index) {
      omp.terminator
    }
    %c4_i64 = arith.constant 4 : i64
    omp.parallel num_threads(%c4_i64 : i64) {
      omp.terminator
    }
    omp.parallel num_threads(%c4_i64, %c4_i64 : i64, i64) {
      omp.terminator
    }
    %c8_i16 = arith.constant 8 : i16
    omp.parallel num_threads(%arg2, %c4_i64, %c8_i16 : i32, i64, i16) {
      omp.terminator
    }
    omp.parallel allocate(%arg0 : memref<i32> -> %arg0 : memref<i32>) {
      omp.terminator
    }
    omp.parallel {
      omp.parallel if(%arg1) {
        omp.terminator
      }
      omp.terminator
    }
    omp.parallel if(%arg1) num_threads(%arg2 : i32) proc_bind(close) {
      omp.terminator
    }
    return
  }
  func.func @omp_loop_nest(%arg0: index, %arg1: index, %arg2: index) {
    omp.wsloop {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    omp.wsloop {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) inclusive step (%arg2) {
        omp.yield
      }
    }
    omp.wsloop {
      omp.loop_nest (%arg3, %arg4) : index = (%arg0, %arg0) to (%arg1, %arg1) step (%arg2, %arg2) {
        omp.yield
      }
    }
    omp.wsloop {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        "test.op1"(%arg0) : (index) -> ()
        "test.op2"() : () -> ()
        omp.yield
      }
    }
    return
  }
  func.func @omp_loop_nest_pretty(%arg0: index, %arg1: index, %arg2: index) {
    omp.wsloop {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    omp.wsloop {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) inclusive step (%arg2) {
        omp.yield
      }
    }
    omp.wsloop {
      omp.loop_nest (%arg3, %arg4) : index = (%arg0, %arg0) to (%arg1, %arg1) step (%arg2, %arg2) {
        omp.yield
      }
    }
    omp.wsloop {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        "test.op1"(%arg0) : (index) -> ()
        "test.op2"() : () -> ()
        omp.yield
      }
    }
    return
  }
  func.func @omp_loop_nest_pretty_multi_block(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<?xi32>, %arg4: memref<?xi32>) {
    omp.wsloop {
      omp.loop_nest (%arg5) : index = (%arg0) to (%arg1) step (%arg2) {
        %0 = "test.payload"(%arg5) : (index) -> i32
        cf.br ^bb1(%0 : i32)
      ^bb1(%1: i32):  // pred: ^bb0
        memref.store %1, %arg3[%arg5] : memref<?xi32>
        omp.yield
      }
    }
    omp.wsloop {
      omp.loop_nest (%arg5) : index = (%arg0) to (%arg1) step (%arg2) {
        %0 = "test.condition"(%arg5) : (index) -> i1
        %1 = "test.payload"(%arg5) : (index) -> i32
        cf.cond_br %0, ^bb1(%1 : i32), ^bb2(%1 : i32)
      ^bb1(%2: i32):  // pred: ^bb0
        memref.store %2, %arg3[%arg5] : memref<?xi32>
        cf.br ^bb3
      ^bb2(%3: i32):  // pred: ^bb0
        memref.store %3, %arg4[%arg5] : memref<?xi32>
        cf.br ^bb3
      ^bb3:  // 2 preds: ^bb1, ^bb2
        omp.yield
      }
    }
    omp.wsloop {
      omp.loop_nest (%arg5) : index = (%arg0) to (%arg1) step (%arg2) {
        %0 = "test.condition"(%arg5) : (index) -> i1
        %1 = "test.payload"(%arg5) : (index) -> i32
        cf.cond_br %0, ^bb1(%1 : i32), ^bb2(%1 : i32)
      ^bb1(%2: i32):  // pred: ^bb0
        memref.store %2, %arg3[%arg5] : memref<?xi32>
        omp.yield
      ^bb2(%3: i32):  // pred: ^bb0
        memref.store %3, %arg4[%arg5] : memref<?xi32>
        omp.yield
      }
    }
    return
  }
  func.func @omp_loop_nest_pretty_non_index(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: memref<?xi32>, %arg7: memref<?xi64>) {
    omp.wsloop {
      omp.loop_nest (%arg8) : i32 = (%arg0) to (%arg1) step (%arg2) {
        %0 = "test.payload"(%arg8) : (i32) -> index
        cf.br ^bb1(%0 : index)
      ^bb1(%1: index):  // pred: ^bb0
        memref.store %arg8, %arg6[%1] : memref<?xi32>
        omp.yield
      }
    }
    omp.wsloop {
      omp.loop_nest (%arg8) : i64 = (%arg3) to (%arg4) step (%arg5) {
        %0 = "test.payload"(%arg8) : (i64) -> index
        cf.br ^bb1(%0 : index)
      ^bb1(%1: index):  // pred: ^bb0
        memref.store %arg8, %arg7[%1] : memref<?xi64>
        omp.yield
      }
    }
    return
  }
  func.func @omp_loop_nest_pretty_multiple(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: memref<?xi32>) {
    omp.wsloop {
      omp.loop_nest (%arg7, %arg8) : i32 = (%arg0, %arg3) to (%arg1, %arg4) step (%arg2, %arg5) {
        %0 = "test.payload"(%arg7) : (i32) -> index
        %1 = "test.payload"(%arg8) : (i32) -> index
        memref.store %arg7, %arg6[%0] : memref<?xi32>
        memref.store %arg8, %arg6[%1] : memref<?xi32>
        omp.yield
      }
    }
    return
  }
  func.func @omp_loop_nest_pretty_multiple_collapse(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: memref<?xi32>) {
    omp.wsloop {
      omp.loop_nest (%arg7, %arg8) : i32 = (%arg0, %arg3) to (%arg1, %arg4) step (%arg2, %arg5) collapse(2) {
        %0 = "test.payload"(%arg7) : (i32) -> index
        %1 = "test.payload"(%arg8) : (i32) -> index
        memref.store %arg7, %arg6[%0] : memref<?xi32>
        memref.store %arg8, %arg6[%1] : memref<?xi32>
        omp.yield
      }
    }
    return
  }
  func.func @omp_loop_nest_pretty_multiple_tiles(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: memref<?xi32>) {
    omp.wsloop {
      omp.loop_nest (%arg7, %arg8) : i32 = (%arg0, %arg3) to (%arg1, %arg4) step (%arg2, %arg5) tiles(5, 10) {
        %0 = "test.payload"(%arg7) : (i32) -> index
        %1 = "test.payload"(%arg8) : (i32) -> index
        memref.store %arg7, %arg6[%0] : memref<?xi32>
        memref.store %arg8, %arg6[%1] : memref<?xi32>
        omp.yield
      }
    }
    return
  }
  func.func @omp_loop_nest_pretty_multiple_collapse_tiles(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: memref<?xi32>) {
    omp.wsloop {
      omp.loop_nest (%arg7, %arg8) : i32 = (%arg0, %arg3) to (%arg1, %arg4) step (%arg2, %arg5) collapse(2) tiles(5, 10) {
        %0 = "test.payload"(%arg7) : (i32) -> index
        %1 = "test.payload"(%arg8) : (i32) -> index
        memref.store %arg7, %arg6[%0] : memref<?xi32>
        memref.store %arg8, %arg6[%1] : memref<?xi32>
        omp.yield
      }
    }
    return
  }
  func.func @omp_wsloop(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<i32>, %arg4: i32, %arg5: i32) {
    omp.wsloop ordered(1) {
      omp.loop_nest (%arg6) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    omp.wsloop linear(%arg3 : memref<i32> = %arg4 : i32) schedule(static) {
      omp.loop_nest (%arg6) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    } {linear_var_types = [i32]}
    omp.wsloop linear(%arg3 : memref<i32> = %arg4 : i32, %arg3 : memref<i32> = %arg4 : i32) schedule(static) {
      omp.loop_nest (%arg6) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    } {linear_var_types = [i32, i32]}
    omp.wsloop linear(%arg3 : memref<i32> = %arg4 : i32) ordered(2) schedule(dynamic = %arg5 : i32) {
      omp.loop_nest (%arg6) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    } {linear_var_types = [i32]}
    omp.wsloop nowait schedule(auto) {
      omp.loop_nest (%arg6) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    omp.wsloop {
      omp.simd {
        omp.loop_nest (%arg6) : index = (%arg0) to (%arg1) step (%arg2) {
          omp.yield
        }
      } {omp.composite}
    } {omp.composite}
    return
  }
  func.func @omp_wsloop_pretty(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<i32>, %arg4: i32, %arg5: i32, %arg6: i16) {
    omp.wsloop ordered(2) {
      omp.loop_nest (%arg7) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    omp.wsloop linear(%arg3 : memref<i32> = %arg4 : i32) schedule(static) {
      omp.loop_nest (%arg7) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    } {linear_var_types = [i32]}
    omp.wsloop linear(val(%arg3 : memref<i32> = %arg4 : i32), val(%arg3 : memref<i32> = %arg4 : i32)) schedule(static) {
      omp.loop_nest (%arg7) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    } {linear_var_types = [i32, i32]}
    omp.wsloop linear(%arg3 : memref<i32> = %arg4 : i32) ordered(2) schedule(static = %arg5 : i32) {
      omp.loop_nest (%arg7) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    } {linear_var_types = [i32]}
    omp.wsloop linear(%arg3 : memref<i32> = %arg4 : i32) ordered(2) schedule(dynamic = %arg5 : i32, nonmonotonic) {
      omp.loop_nest (%arg7) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    } {linear_var_types = [i32]}
    omp.wsloop linear(%arg3 : memref<i32> = %arg4 : i32) ordered(2) schedule(dynamic = %arg6 : i16, monotonic) {
      omp.loop_nest (%arg7) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    } {linear_var_types = [i32]}
    omp.wsloop {
      omp.loop_nest (%arg7) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    omp.wsloop nowait {
      omp.loop_nest (%arg7) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    omp.wsloop nowait order(concurrent) {
      omp.loop_nest (%arg7) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    omp.wsloop nowait order(reproducible:concurrent) {
      omp.loop_nest (%arg7) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    omp.wsloop nowait order(unconstrained:concurrent) {
      omp.loop_nest (%arg7) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    omp.wsloop {
      omp.simd {
        omp.loop_nest (%arg7) : index = (%arg0) to (%arg1) step (%arg2) {
          omp.yield
        }
      } {omp.composite}
    } {omp.composite}
    return
  }
  func.func @omp_simd(%arg0: index, %arg1: index, %arg2: index) {
    omp.simd {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    return
  }
  func.func @omp_simd_aligned_list(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<i32>, %arg4: memref<i32>) {
    omp.simd aligned(%arg3 : memref<i32> -> 32 : i64, %arg4 : memref<i32> -> 128 : i64) {
      omp.loop_nest (%arg5) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    return
  }
  func.func @omp_simd_aligned_single(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<i32>, %arg4: memref<i32>) {
    omp.simd aligned(%arg3 : memref<i32> -> 32 : i64) {
      omp.loop_nest (%arg5) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    return
  }
  func.func @omp_simd_nontemporal_list(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<i32>, %arg4: memref<i64>) {
    omp.simd nontemporal(%arg3, %arg4 : memref<i32>, memref<i64>) {
      omp.loop_nest (%arg5) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    return
  }
  func.func @omp_simd_nontemporal_single(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<i32>, %arg4: memref<i64>) {
    omp.simd nontemporal(%arg3 : memref<i32>) {
      omp.loop_nest (%arg5) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    return
  }
  func.func @omp_simd_pretty(%arg0: index, %arg1: index, %arg2: index) {
    omp.simd {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    return
  }
  func.func @omp_simd_pretty_aligned(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<i32>, %arg4: memref<i32>) {
    omp.simd aligned(%arg3 : memref<i32> -> 32 : i64, %arg4 : memref<i32> -> 128 : i64) {
      omp.loop_nest (%arg5) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    return
  }
  func.func @omp_simd_pretty_if(%arg0: index, %arg1: index, %arg2: index, %arg3: i1) {
    omp.simd if(%arg3) {
      omp.loop_nest (%arg4) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    return
  }
  func.func @omp_simd_pretty_nontemporal(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<i32>, %arg4: memref<i32>) {
    omp.simd nontemporal(%arg3, %arg4 : memref<i32>, memref<i32>) {
      omp.loop_nest (%arg5) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    return
  }
  func.func @omp_simd_pretty_order(%arg0: index, %arg1: index, %arg2: index) {
    omp.simd order(concurrent) {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    omp.simd order(reproducible:concurrent) {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    omp.simd order(unconstrained:concurrent) {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    return
  }
  func.func @omp_simd_linear_val(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<i32>, %arg4: i32) {
    omp.simd linear(val(%arg3 : memref<i32> = %arg4 : i32)) {
      omp.loop_nest (%arg5) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    } {linear_var_types = [i32]}
    return
  }
  func.func @omp_simd_linear_val_multiple(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<i32>, %arg4: memref<i32>, %arg5: i32, %arg6: i32) {
    omp.simd linear(val(%arg3 : memref<i32> = %arg5 : i32), val(%arg4 : memref<i32> = %arg6 : i32)) {
      omp.loop_nest (%arg7) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    } {linear_var_types = [i32, i32]}
    return
  }
  func.func @omp_simd_pretty_simdlen(%arg0: index, %arg1: index, %arg2: index) {
    omp.simd simdlen(2) {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    return
  }
  func.func @omp_simd_pretty_safelen(%arg0: index, %arg1: index, %arg2: index) {
    omp.simd safelen(2) {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    return
  }
  func.func @omp_distribute(%arg0: i32, %arg1: memref<i32>, %arg2: i32) {
    omp.distribute {
      omp.loop_nest (%arg3) : i32 = (%arg2) to (%arg2) step (%arg2) {
        omp.yield
      }
    }
    omp.distribute {
      omp.loop_nest (%arg3) : i32 = (%arg2) to (%arg2) step (%arg2) {
        omp.yield
      }
    }
    omp.distribute dist_schedule_static {
      omp.loop_nest (%arg3) : i32 = (%arg2) to (%arg2) step (%arg2) {
        omp.yield
      }
    }
    omp.distribute dist_schedule_static dist_schedule_chunk_size(%arg0 : i32) {
      omp.loop_nest (%arg3) : i32 = (%arg2) to (%arg2) step (%arg2) {
        omp.yield
      }
    }
    omp.distribute order(concurrent) {
      omp.loop_nest (%arg3) : i32 = (%arg2) to (%arg2) step (%arg2) {
        omp.yield
      }
    }
    omp.distribute order(reproducible:concurrent) {
      omp.loop_nest (%arg3) : i32 = (%arg2) to (%arg2) step (%arg2) {
        omp.yield
      }
    }
    omp.distribute order(unconstrained:concurrent) {
      omp.loop_nest (%arg3) : i32 = (%arg2) to (%arg2) step (%arg2) {
        omp.yield
      }
    }
    omp.distribute allocate(%arg1 : memref<i32> -> %arg1 : memref<i32>) {
      omp.loop_nest (%arg3) : i32 = (%arg2) to (%arg2) step (%arg2) {
        omp.yield
      }
    }
    omp.distribute {
      omp.simd {
        omp.loop_nest (%arg3) : i32 = (%arg2) to (%arg2) step (%arg2) {
          omp.yield
        }
      } {omp.composite}
    } {omp.composite}
    return
  }
  func.func @omp_target(%arg0: i1, %arg1: si32, %arg2: i32, %arg3: memref<i32>, %arg4: memref<?xi32>, %arg5: memref<?xi32>, %arg6: memref<?xi32>, %arg7: i32) {
    omp.target kernel_type(generic) device(%arg1 : si32) if(%arg0) nowait thread_limit(%arg2 : i32) {
      omp.terminator
    }
    %0 = omp.map.info var_ptr(%arg4 : memref<?xi32>, tensor<?xi32>) map_clauses(always, to) capture(ByRef) -> memref<?xi32> {name = ""}
    %1 = omp.map.info var_ptr(%arg5 : memref<?xi32>, tensor<?xi32>) map_clauses(tofrom) capture(ByRef) -> memref<?xi32> {name = ""}
    %2 = omp.map.info var_ptr(%arg6 : memref<?xi32>, tensor<?xi32>) map_clauses(storage) capture(ByRef) -> memref<?xi32> {name = ""}
    omp.target kernel_type(generic) is_device_ptr(%arg3 : memref<i32>) has_device_addr(%0 -> %arg8 : memref<?xi32>) map_entries(%1 -> %arg9, %2 -> %arg10 : memref<?xi32>, memref<?xi32>) {
      omp.terminator
    }
    %3 = omp.map.info var_ptr(%arg5 : memref<?xi32>, tensor<?xi32>) map_clauses(to) capture(ByRef) -> memref<?xi32> {name = ""}
    %4 = omp.map.info var_ptr(%arg6 : memref<?xi32>, tensor<?xi32>) map_clauses(always, from) capture(ByRef) -> memref<?xi32> {name = ""}
    omp.target kernel_type(generic) map_entries(%3 -> %arg8, %4 -> %arg9 : memref<?xi32>, memref<?xi32>) {
      omp.terminator
    }
    omp.target kernel_type(bare) {
      omp.teams {
        omp.terminator
      }
      omp.terminator
    } {omp.combined}
    omp.target kernel_type(spmd) host_eval(%arg7 -> %arg8 : i32) {
      omp.parallel {
        omp.wsloop {
          omp.loop_nest (%arg9) : i32 = (%arg8) to (%arg8) step (%arg8) {
            omp.yield
          }
        }
        omp.terminator
      } {omp.combined}
      omp.terminator
    } {omp.combined}
    omp.target kernel_type(spmd_no_loop) host_eval(%arg7 -> %arg8 : i32) {
      omp.teams {
        omp.parallel {
          omp.distribute {
            omp.wsloop {
              omp.loop_nest (%arg9) : i32 = (%arg8) to (%arg8) step (%arg8) {
                omp.yield
              }
            } {omp.composite}
          } {omp.composite}
          omp.terminator
        } {omp.composite}
        omp.terminator
      } {omp.combined}
      omp.terminator
    } {omp.combined}
    return
  }
  func.func @omp_target_data(%arg0: i1, %arg1: si32, %arg2: memref<i32>, %arg3: memref<?xi32>, %arg4: memref<?xi32>, %arg5: memref<?xi32>) {
    %0 = omp.map.info var_ptr(%arg4 : memref<?xi32>, tensor<?xi32>) map_clauses(always, from) capture(ByRef) -> memref<?xi32> {name = ""}
    omp.target_data device(%arg1 : si32) if(%arg0) map_entries(%0 : memref<?xi32>) {
    }
    %1 = omp.map.info var_ptr(%arg4 : memref<?xi32>, tensor<?xi32>) map_clauses(close, present, to) capture(ByRef) -> memref<?xi32> {name = ""}
    %2 = omp.map.info var_ptr(%arg3 : memref<?xi32>, tensor<?xi32>) map_clauses(return_param) capture(ByRef) -> memref<?xi32> {name = ""}
    %3 = omp.map.info var_ptr(%arg2 : memref<i32>, tensor<i32>) map_clauses(return_param) capture(ByRef) -> memref<i32> {name = ""}
    omp.target_data map_entries(%1 : memref<?xi32>) use_device_addr(%2 -> %arg6 : memref<?xi32>) use_device_ptr(%3 -> %arg7 : memref<i32>) {
      omp.terminator
    }
    %4 = omp.map.info var_ptr(%arg4 : memref<?xi32>, tensor<?xi32>) map_clauses(tofrom) capture(ByRef) -> memref<?xi32> {name = ""}
    %5 = omp.map.info var_ptr(%arg5 : memref<?xi32>, tensor<?xi32>) map_clauses(storage) capture(ByRef) -> memref<?xi32> {name = ""}
    omp.target_data map_entries(%4, %5 : memref<?xi32>, memref<?xi32>) {
    }
    %6 = omp.map.info var_ptr(%arg4 : memref<?xi32>, tensor<?xi32>) map_clauses(storage) capture(ByRef) -> memref<?xi32> {name = ""}
    omp.target_enter_data device(%arg1 : si32) if(%arg0) map_entries(%6 : memref<?xi32>) nowait
    %7 = omp.map.info var_ptr(%arg5 : memref<?xi32>, tensor<?xi32>) map_clauses(storage) capture(ByRef) -> memref<?xi32> {name = ""}
    omp.target_exit_data device(%arg1 : si32) if(%arg0) map_entries(%7 : memref<?xi32>) nowait
    %8 = omp.map.info var_ptr(%arg4 : memref<?xi32>, tensor<?xi32>) map_clauses(ompx_hold, to) capture(ByRef) -> memref<?xi32> {name = ""}
    omp.target_data map_entries(%8 : memref<?xi32>) {
      omp.terminator
    }
    return
  }
  func.func @omp_target_pretty(%arg0: i1, %arg1: si32, %arg2: i32) {
    omp.target kernel_type(generic) device(%arg1 : si32) if(%arg0) {
      omp.terminator
    }
    omp.target kernel_type(generic) device(%arg1 : si32) if(%arg0) nowait thread_limit(%arg2 : i32) {
      omp.terminator
    }
    return
  }
  omp.declare_reduction @add_f32 : f32 init {
  ^bb0(%arg0: f32):
    %cst = arith.constant 0.000000e+00 : f32
    omp.yield(%cst : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = arith.addf %arg0, %arg1 : f32
    omp.yield(%0 : f32)
  } atomic {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg1 : !llvm.ptr -> f32
    %1 = llvm.atomicrmw fadd %arg0, %0 monotonic : !llvm.ptr, f32
    omp.yield
  } cleanup {
  ^bb0(%arg0: f32):
    omp.yield
  }
  omp.declare_mapper @my_mapper : !llvm.struct<"my_type", (i32)> {
  ^bb0(%arg0: !llvm.ptr):
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<"my_type", (i32)>) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.declare_mapper.info map_entries(%0 : !llvm.ptr)
  }
  omp.declare_mapper @my_mapper_iterated : !llvm.struct<"my_iter_type", (i32)> {
  ^bb0(%arg0: !llvm.ptr):
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    %0 = omp.iterator(%arg1: index) = (%c0 to %c4 step %c1) {
      %1 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<"my_iter_type", (i32)>) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
      omp.yield(%1 : !llvm.ptr)
    } -> !omp.iterated<!llvm.ptr>
    omp.declare_mapper.info map_iterated(%0 : !omp.iterated<!llvm.ptr>)
  }
  func.func @wsloop_reduction(%arg0: index, %arg1: index, %arg2: index) {
    %c1_i32 = arith.constant 1 : i32
    %0 = llvm.alloca %c1_i32 x i32 : (i32) -> !llvm.ptr
    omp.wsloop reduction(@add_f32 %0 -> %arg3 : !llvm.ptr) {
      omp.loop_nest (%arg4) : index = (%arg0) to (%arg1) step (%arg2) {
        %cst = arith.constant 2.000000e+00 : f32
        %1 = llvm.load %arg3 : !llvm.ptr -> f32
        %2 = llvm.fadd %1, %cst : f32
        llvm.store %2, %arg3 : f32, !llvm.ptr
        omp.yield
      }
    }
    return
  }
  func.func @wsloop_inscan_reduction(%arg0: index, %arg1: index, %arg2: index) {
    %c1_i32 = arith.constant 1 : i32
    %0 = llvm.alloca %c1_i32 x i32 : (i32) -> !llvm.ptr
    omp.wsloop reduction(mod: inscan, @add_f32 %0 -> %arg3 : !llvm.ptr) {
      omp.loop_nest (%arg4) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.scan inclusive(%arg3 : !llvm.ptr)
        omp.yield
      }
    }
    omp.wsloop reduction(mod: inscan, @add_f32 %0 -> %arg3 : !llvm.ptr) {
      omp.loop_nest (%arg4) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.scan exclusive(%arg3 : !llvm.ptr)
        omp.yield
      }
    }
    return
  }
  func.func @wsloop_reduction_byref(%arg0: index, %arg1: index, %arg2: index) {
    %c1_i32 = arith.constant 1 : i32
    %0 = llvm.alloca %c1_i32 x i32 : (i32) -> !llvm.ptr
    omp.wsloop reduction(byref @add_f32 %0 -> %arg3 : !llvm.ptr) {
      omp.loop_nest (%arg4) : index = (%arg0) to (%arg1) step (%arg2) {
        %cst = arith.constant 2.000000e+00 : f32
        %1 = llvm.load %arg3 : !llvm.ptr -> f32
        %2 = llvm.fadd %1, %cst : f32
        llvm.store %2, %arg3 : f32, !llvm.ptr
        omp.yield
      }
    }
    return
  }
  func.func @parallel_reduction() {
    %c1_i32 = arith.constant 1 : i32
    %0 = llvm.alloca %c1_i32 x i32 : (i32) -> !llvm.ptr
    omp.parallel reduction(@add_f32 %0 -> %arg0 : !llvm.ptr) {
      %cst = arith.constant 2.000000e+00 : f32
      %1 = llvm.load %arg0 : !llvm.ptr -> f32
      %2 = llvm.fadd %cst, %1 : f32
      llvm.store %2, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    return
  }
  func.func @parallel_reduction_byref() {
    %c1_i32 = arith.constant 1 : i32
    %0 = llvm.alloca %c1_i32 x i32 : (i32) -> !llvm.ptr
    omp.parallel reduction(byref @add_f32 %0 -> %arg0 : !llvm.ptr) {
      %cst = arith.constant 2.000000e+00 : f32
      %1 = llvm.load %arg0 : !llvm.ptr -> f32
      %2 = llvm.fadd %cst, %1 : f32
      llvm.store %2, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    return
  }
  func.func @parallel_wsloop_reduction(%arg0: index, %arg1: index, %arg2: index) {
    %c1_i32 = arith.constant 1 : i32
    %0 = llvm.alloca %c1_i32 x i32 : (i32) -> !llvm.ptr
    omp.parallel {
      omp.wsloop reduction(@add_f32 %0 -> %arg3 : !llvm.ptr) {
        omp.loop_nest (%arg4) : index = (%arg0) to (%arg1) step (%arg2) {
          %cst = arith.constant 2.000000e+00 : f32
          %1 = llvm.load %arg3 : !llvm.ptr -> f32
          %2 = llvm.fadd %cst, %1 : f32
          omp.yield
        }
      }
      omp.terminator
    }
    return
  }
  func.func @omp_teams(%arg0: i32, %arg1: i32, %arg2: i1, %arg3: i32, %arg4: memref<i32>, %arg5: i64, %arg6: i16, %arg7: i32) {
    omp.target kernel_type(generic) {
      omp.teams {
        omp.terminator
      }
      omp.terminator
    }
    omp.teams {
      %c1_i32_0 = arith.constant 1 : i32
      omp.terminator
    }
    omp.teams num_teams(%arg0 : i32 to %arg1 : i32) {
      omp.terminator
    }
    omp.teams num_teams( to %arg1 : i32) {
      omp.terminator
    }
    omp.teams num_teams( to %arg0, %arg1, %arg1 : i32, i32, i32) {
      omp.terminator
    }
    omp.teams num_teams( to %arg0, %arg5, %arg6 : i32, i64, i16) {
      omp.terminator
    }
    omp.teams if(%arg2) {
      omp.terminator
    }
    omp.teams thread_limit(%arg3 : i32) {
      omp.terminator
    }
    omp.teams thread_limit(%arg0, %arg1 : i32, i32) {
      omp.terminator
    }
    omp.teams thread_limit(%arg0, %arg5, %arg6 : i32, i64, i16) {
      omp.terminator
    }
    %c1_i32 = arith.constant 1 : i32
    %0 = llvm.alloca %c1_i32 x i32 : (i32) -> !llvm.ptr
    omp.teams reduction(@add_f32 %0 -> %arg8 : !llvm.ptr) {
      %cst = arith.constant 2.000000e+00 : f32
      omp.terminator
    }
    omp.teams reduction(byref @add_f32 %0 -> %arg8 : !llvm.ptr) {
      %cst = arith.constant 2.000000e+00 : f32
      omp.terminator
    }
    omp.teams allocate(%arg4 : memref<i32> -> %arg4 : memref<i32>) {
      omp.terminator
    }
    omp.teams dyn_groupprivate(cgroup, fallback(null), %arg7 : i32) {
      omp.terminator
    }
    return
  }
  func.func @sections_reduction() {
    %c1_i32 = arith.constant 1 : i32
    %0 = llvm.alloca %c1_i32 x i32 : (i32) -> !llvm.ptr
    omp.sections reduction(@add_f32 %0 -> %arg0 : !llvm.ptr) {
      omp.section {
      ^bb0(%arg1: !llvm.ptr):
        %cst = arith.constant 2.000000e+00 : f32
        omp.terminator
      }
      omp.section {
      ^bb0(%arg1: !llvm.ptr):
        %cst = arith.constant 3.000000e+00 : f32
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @sections_reduction_byref() {
    %c1_i32 = arith.constant 1 : i32
    %0 = llvm.alloca %c1_i32 x i32 : (i32) -> !llvm.ptr
    omp.sections reduction(byref @add_f32 %0 -> %arg0 : !llvm.ptr) {
      omp.section {
      ^bb0(%arg1: !llvm.ptr):
        %cst = arith.constant 2.000000e+00 : f32
        omp.terminator
      }
      omp.section {
      ^bb0(%arg1: !llvm.ptr):
        %cst = arith.constant 3.000000e+00 : f32
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  omp.declare_reduction @add2_f32 : f32 init {
  ^bb0(%arg0: f32):
    %cst = arith.constant 0.000000e+00 : f32
    omp.yield(%cst : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = arith.addf %arg0, %arg1 : f32
    omp.yield(%0 : f32)
  }
  func.func @wsloop_reduction2(%arg0: index, %arg1: index, %arg2: index) {
    %alloca = memref.alloca() : memref<1xf32>
    omp.wsloop reduction(@add2_f32 %alloca -> %arg3 : memref<1xf32>) {
      omp.loop_nest (%arg4) : index = (%arg0) to (%arg1) step (%arg2) {
        %cst = arith.constant 2.000000e+00 : f32
        %c0 = arith.constant 0 : index
        %0 = memref.load %arg3[%c0] : memref<1xf32>
        %1 = llvm.fadd %cst, %0 : f32
        memref.store %1, %arg3[%c0] : memref<1xf32>
        omp.yield
      }
    }
    return
  }
  func.func @parallel_reduction2() {
    %alloca = memref.alloca() : memref<1xf32>
    omp.parallel reduction(@add2_f32 %alloca -> %arg0 : memref<1xf32>) {
      %cst = arith.constant 2.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %0 = memref.load %arg0[%c0] : memref<1xf32>
      %1 = llvm.fadd %cst, %0 : f32
      memref.store %1, %arg0[%c0] : memref<1xf32>
      omp.terminator
    }
    return
  }
  func.func @parallel_wsloop_reduction2(%arg0: index, %arg1: index, %arg2: index) {
    %c1_i32 = arith.constant 1 : i32
    %0 = llvm.alloca %c1_i32 x i32 : (i32) -> !llvm.ptr
    omp.parallel {
      omp.wsloop reduction(@add2_f32 %0 -> %arg3 : !llvm.ptr) {
        omp.loop_nest (%arg4) : index = (%arg0) to (%arg1) step (%arg2) {
          %cst = arith.constant 2.000000e+00 : f32
          %1 = llvm.load %arg3 : !llvm.ptr -> f32
          %2 = llvm.fadd %cst, %1 : f32
          omp.yield
        }
      }
      omp.terminator
    }
    return
  }
  func.func @sections_reduction2() {
    %alloca = memref.alloca() : memref<1xf32>
    omp.sections reduction(@add2_f32 %alloca -> %arg0 : memref<1xf32>) {
      omp.section {
      ^bb0(%arg1: !llvm.ptr):
        %cst = arith.constant 2.000000e+00 : f32
        omp.terminator
      }
      omp.section {
      ^bb0(%arg1: !llvm.ptr):
        %cst = arith.constant 2.000000e+00 : f32
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  omp.critical.declare @mutex1 hint(uncontended)
  omp.critical.declare @mutex2 hint(contended)
  omp.critical.declare @mutex3 hint(nonspeculative)
  omp.critical.declare @mutex4 hint(speculative)
  omp.critical.declare @mutex5 hint(uncontended, nonspeculative)
  omp.critical.declare @mutex6 hint(contended, nonspeculative)
  omp.critical.declare @mutex7 hint(uncontended, speculative)
  omp.critical.declare @mutex8 hint(contended, speculative)
  omp.critical.declare @mutex9
  omp.critical.declare @mutex10
  func.func @omp_critical() {
    omp.critical {
      omp.terminator
    }
    omp.critical(@mutex1) {
      omp.terminator
    }
    return
  }
  func.func @omp_ordered(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64) {
    omp.ordered.region {
      omp.terminator
    }
    omp.wsloop ordered(0) {
      omp.loop_nest (%arg7) : i32 = (%arg0) to (%arg1) step (%arg2) {
        omp.ordered.region {
          omp.terminator
        }
        omp.yield
      }
    }
    omp.wsloop ordered(1) {
      omp.loop_nest (%arg7) : i32 = (%arg0) to (%arg1) step (%arg2) {
        omp.ordered depend_type(dependsink) depend_vec(%arg3 : i64) {doacross_num_loops = 1 : i64}
        omp.ordered depend_type(dependsource) depend_vec(%arg3 : i64) {doacross_num_loops = 1 : i64}
        omp.yield
      }
    }
    omp.wsloop ordered(2) {
      omp.loop_nest (%arg7) : i32 = (%arg0) to (%arg1) step (%arg2) {
        omp.ordered depend_type(dependsink) depend_vec(%arg3, %arg4, %arg5, %arg6 : i64, i64, i64, i64) {doacross_num_loops = 2 : i64}
        omp.ordered depend_type(dependsource) depend_vec(%arg3, %arg4 : i64, i64) {doacross_num_loops = 2 : i64}
        omp.yield
      }
    }
    return
  }
  func.func @omp_atomic_read(%arg0: memref<i32>, %arg1: memref<i32>) {
    omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    omp.atomic.read %arg0 = %arg1 memory_order(seq_cst) : memref<i32>, memref<i32>, i32
    omp.atomic.read %arg0 = %arg1 memory_order(acquire) : memref<i32>, memref<i32>, i32
    omp.atomic.read %arg0 = %arg1 memory_order(relaxed) : memref<i32>, memref<i32>, i32
    omp.atomic.read %arg0 = %arg1 hint(contended, nonspeculative) : memref<i32>, memref<i32>, i32
    omp.atomic.read %arg0 = %arg1 hint(contended, speculative) memory_order(seq_cst) : memref<i32>, memref<i32>, i32
    omp.atomic.read %arg0 = %arg1 memory_order(seq_cst) : memref<i32>, memref<i32>, i32
    return
  }
  func.func @omp_atomic_write(%arg0: memref<i32>, %arg1: i32) {
    omp.atomic.write %arg0 = %arg1 : memref<i32>, i32
    omp.atomic.write %arg0 = %arg1 memory_order(seq_cst) : memref<i32>, i32
    omp.atomic.write %arg0 = %arg1 memory_order(release) : memref<i32>, i32
    omp.atomic.write %arg0 = %arg1 memory_order(relaxed) : memref<i32>, i32
    omp.atomic.write %arg0 = %arg1 hint(uncontended, speculative) : memref<i32>, i32
    omp.atomic.write %arg0 = %arg1 : memref<i32>, i32
    return
  }
  func.func @omp_atomic_update(%arg0: memref<i32>, %arg1: i32, %arg2: memref<i1>, %arg3: i1) {
    omp.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update %arg2 : memref<i1> {
    ^bb0(%arg4: i1):
      %0 = llvm.and %arg4, %arg3 : i1
      omp.yield(%0 : i1)
    }
    omp.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.shl %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.intr.smax(%arg4, %arg1) : (i32, i32) -> i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update %arg2 : memref<i1> {
    ^bb0(%arg4: i1):
      %0 = llvm.icmp "eq" %arg4, %arg3 : i1
      omp.yield(%0 : i1)
    }
    omp.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      omp.yield(%arg4 : i32)
    }
    %c42_i32 = arith.constant 42 : i32
    omp.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      omp.yield(%c42_i32 : i32)
    }
    omp.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update hint(uncontended) %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update hint(contended) %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update hint(nonspeculative) %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update hint(speculative) %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update hint(uncontended, nonspeculative) %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update hint(contended, nonspeculative) %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update hint(uncontended, speculative) %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update hint(contended, speculative) %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update memory_order(seq_cst) %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update memory_order(release) %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update memory_order(relaxed) %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update hint(uncontended, speculative) memory_order(seq_cst) %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update %arg0 : memref<i32> {
    ^bb0(%arg4: i32):
      omp.yield(%c42_i32 : i32)
    } {atomic_control = #omp.atomic_control<ignore_denormal_mode = true, fine_grained_memory = true, remote_memory = true>}
    return
  }
  func.func @omp_atomic_capture(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: i32) {
    omp.atomic.capture {
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    omp.atomic.capture {
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
      omp.atomic.write %arg1 = %arg2 : memref<i32>, i32
    }
    omp.atomic.capture {
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    omp.atomic.capture hint(uncontended) {
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    omp.atomic.capture hint(contended) {
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    omp.atomic.capture hint(nonspeculative) {
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    omp.atomic.capture hint(speculative) {
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    omp.atomic.capture hint(uncontended, nonspeculative) {
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    omp.atomic.capture hint(contended, nonspeculative) {
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    omp.atomic.capture hint(uncontended, speculative) {
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    omp.atomic.capture hint(contended, speculative) {
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    omp.atomic.capture memory_order(seq_cst) {
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    omp.atomic.capture memory_order(acq_rel) {
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    omp.atomic.capture memory_order(acquire) {
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    omp.atomic.capture memory_order(release) {
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    omp.atomic.capture memory_order(relaxed) {
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    omp.atomic.capture hint(contended, speculative) memory_order(seq_cst) {
      omp.atomic.update %arg1 : memref<i32> {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg0 = %arg1 : memref<i32>, memref<i32>, i32
    }
    return
  }
  func.func @omp_atomic_compare(%arg0: memref<i32>, %arg1: i32, %arg2: i32) {
    omp.atomic.compare %arg0 : memref<i32> {
    ^bb0(%arg3: i32):
      %0 = arith.cmpi eq, %arg3, %arg1 : i32
      %1 = arith.select %0, %arg2, %arg3 : i32
      omp.yield(%1 : i32)
    }
    omp.atomic.compare %arg0 : memref<i32> {
    ^bb0(%arg3: i32):
      %0 = arith.cmpi eq, %arg3, %arg1 : i32
      %1 = arith.select %0, %arg2, %arg3 : i32
      omp.yield(%1 : i32)
    } {weak}
    omp.atomic.compare memory_order(seq_cst) %arg0 : memref<i32> {
    ^bb0(%arg3: i32):
      %0 = arith.cmpi eq, %arg3, %arg1 : i32
      %1 = arith.select %0, %arg2, %arg3 : i32
      omp.yield(%1 : i32)
    } {weak}
    return
  }
  func.func @omp_sectionsop(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: memref<i32>, %arg3: !llvm.ptr) {
    omp.sections allocate(%arg0 : memref<i32> -> %arg0 : memref<i32>) {
      omp.terminator
    }
    omp.sections reduction(@add_f32 %arg3 -> %arg4 : !llvm.ptr) {
      omp.terminator
    }
    omp.sections nowait {
      omp.terminator
    }
    omp.sections reduction(@add_f32 %arg3 -> %arg4 : !llvm.ptr) {
      omp.terminator
    }
    omp.sections allocate(%arg0 : memref<i32> -> %arg0 : memref<i32>) {
      omp.terminator
    }
    omp.sections nowait {
      omp.section {
        %0 = "test.payload"() : () -> i32
        %1 = "test.payload"() : () -> i32
        %2 = "test.payload"(%0, %1) : (i32, i32) -> i32
      }
      omp.section {
        %0 = "test.payload"(%arg3) : (!llvm.ptr) -> i32
      }
      omp.section {
        "test.payload"(%arg3) : (!llvm.ptr) -> ()
      }
      omp.terminator
    }
    return
  }
  func.func @omp_single() {
    omp.parallel {
      omp.single {
        "test.payload"() : () -> ()
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_single_nowait() {
    omp.parallel {
      omp.single nowait {
        "test.payload"() : () -> ()
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_single_allocate(%arg0: memref<i32>) {
    omp.parallel {
      omp.single allocate(%arg0 : memref<i32> -> %arg0 : memref<i32>) {
        "test.payload"() : () -> ()
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_single_allocate_nowait(%arg0: memref<i32>) {
    omp.parallel {
      omp.single allocate(%arg0 : memref<i32> -> %arg0 : memref<i32>) nowait {
        "test.payload"() : () -> ()
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_single_multiple_blocks() {
    omp.single {
      cf.br ^bb1
    ^bb1:  // pred: ^bb0
      omp.terminator
    }
    return
  }
  func.func private @copy_i32(memref<i32>, memref<i32>)
  func.func @omp_single_copyprivate(%arg0: memref<i32>) {
    omp.parallel {
      omp.single copyprivate(%arg0 -> @copy_i32 : memref<i32>) {
        "test.payload"() : () -> ()
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_task(%arg0: i1, %arg1: i64, %arg2: i32, %arg3: memref<i32>, %arg4: !llvm.ptr) {
    omp.task {
      "test.foo"() : () -> ()
      omp.terminator
    }
    omp.task if(%arg0) {
      "test.foo"() : () -> ()
      omp.terminator
    }
    omp.task final(%arg0) {
      "test.foo"() : () -> ()
      omp.terminator
    }
    omp.task untied {
      "test.foo"() : () -> ()
      omp.terminator
    }
    %c1_i32 = arith.constant 1 : i32
    %0 = llvm.alloca %c1_i32 x f32 : (i32) -> !llvm.ptr
    %1 = llvm.alloca %c1_i32 x f32 : (i32) -> !llvm.ptr
    omp.task in_reduction(@add_f32 %0 -> %arg5, @add_f32 %1 -> %arg6 : !llvm.ptr, !llvm.ptr) {
      "test.foo"() : () -> ()
      omp.terminator
    }
    omp.task in_reduction(byref @add_f32 %0 -> %arg5, @add_f32 %1 -> %arg6 : !llvm.ptr, !llvm.ptr) {
      "test.foo"() : () -> ()
      omp.terminator
    }
    omp.task priority(%arg2 : i32) {
      "test.foo"() : () -> ()
      omp.terminator
    }
    omp.task allocate(%arg3 : memref<i32> -> %arg3 : memref<i32>) {
      "test.foo"() : () -> ()
      omp.terminator
    }
    omp.task detach(%arg4 : !llvm.ptr) {
      omp.terminator
    }
    omp.task allocate(%arg3 : memref<i32> -> %arg3 : memref<i32>) final(%arg0) if(%arg0) priority(%arg2 : i32) untied in_reduction(@add_f32 %0 -> %arg5, byref @add_f32 %1 -> %arg6 : !llvm.ptr, !llvm.ptr) {
      "test.foo"() : () -> ()
      omp.terminator
    }
    return
  }
  func.func @omp_task_depend(%arg0: memref<i32>, %arg1: memref<i32>) {
    omp.task depend(taskdependin -> %arg0 : memref<i32>, taskdependin -> %arg1 : memref<i32>, taskdependinout -> %arg0 : memref<i32>) {
      "test.foo"() : () -> ()
      omp.terminator
    }
    return
  }
  func.func @omp_task_depend_iterated(%arg0: index, %arg1: index, %arg2: index, %arg3: !llvm.ptr) {
    %0 = omp.iterator(%arg4: index) = (%arg0 to %arg1 step %arg2) {
      omp.yield(%arg3 : !llvm.ptr)
    } -> !omp.iterated<!llvm.ptr>
    omp.task depend(taskdependin -> %0 : !omp.iterated<!llvm.ptr>) {
      omp.terminator
    }
    return
  }
  func.func @omp_task_depend_iterated_mixed(%arg0: index, %arg1: index, %arg2: index, %arg3: !llvm.ptr, %arg4: memref<i32>) {
    %0 = omp.iterator(%arg5: index) = (%arg0 to %arg1 step %arg2) {
      omp.yield(%arg3 : !llvm.ptr)
    } -> !omp.iterated<!llvm.ptr>
    omp.task depend(taskdependout -> %arg4 : memref<i32>, taskdependin -> %0 : !omp.iterated<!llvm.ptr>) {
      omp.terminator
    }
    return
  }
  func.func @omp_target_depend(%arg0: memref<i32>, %arg1: memref<i32>) {
    omp.target kernel_type(generic) depend(taskdependin -> %arg0 : memref<i32>, taskdependin -> %arg1 : memref<i32>, taskdependinout -> %arg0 : memref<i32>) {
      omp.terminator
    }
    return
  }
  func.func @omp_target_dyn_groupprivate(%arg0: i32, %arg1: i64) {
    omp.target kernel_type(generic) dyn_groupprivate(%arg0 : i32) {
      omp.terminator
    }
    omp.target kernel_type(generic) dyn_groupprivate(cgroup, %arg1 : i64) {
      omp.terminator
    }
    omp.target kernel_type(generic) dyn_groupprivate(cgroup, fallback(abort), %arg0 : i32) {
      omp.terminator
    }
    omp.target kernel_type(generic) dyn_groupprivate(cgroup, fallback(null), %arg0 : i32) {
      omp.terminator
    }
    omp.target kernel_type(generic) dyn_groupprivate(%arg1 : i64) {
      omp.terminator
    }
    return
  }
  func.func @omp_threadprivate() {
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c3_i32 = arith.constant 3 : i32
    %0 = llvm.mlir.addressof @_QFsubEx : !llvm.ptr
    %1 = omp.threadprivate %0 : !llvm.ptr -> !llvm.ptr
    llvm.store %c1_i32, %1 : i32, !llvm.ptr
    omp.parallel {
      %2 = omp.threadprivate %0 : !llvm.ptr -> !llvm.ptr
      llvm.store %c2_i32, %2 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.store %c3_i32, %1 : i32, !llvm.ptr
    return
  }
  llvm.mlir.global internal @_QFsubEx() {addr_space = 0 : i32} : i32
  func.func @omp_cancel_parallel(%arg0: i1) {
    omp.parallel {
      omp.cancel cancellation_construct_type(parallel) if(%arg0)
      omp.terminator
    }
    return
  }
  func.func @omp_cancel_wsloop(%arg0: index, %arg1: index, %arg2: index) {
    omp.wsloop {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.cancel cancellation_construct_type(loop)
        omp.yield
      }
    }
    return
  }
  func.func @omp_cancel_sections() {
    omp.sections {
      omp.section {
        omp.cancel cancellation_construct_type(sections)
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_cancel_taskgroup() {
    omp.taskgroup {
      omp.task {
        omp.cancel cancellation_construct_type(taskgroup)
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_taskloop_cancel_taskgroup(%arg0: index, %arg1: index, %arg2: index) {
    omp.taskloop.context {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
          omp.cancel cancellation_construct_type(taskgroup)
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    return
  }
  func.func @omp_cancel_parallel_nested(%arg0: i1) {
    omp.parallel {
      scf.if %arg0 {
        omp.cancel cancellation_construct_type(parallel)
      }
      omp.terminator
    }
    return
  }
  func.func @omp_cancel_wsloop_nested(%arg0: index, %arg1: index, %arg2: index, %arg3: i1) {
    omp.wsloop {
      omp.loop_nest (%arg4) : index = (%arg0) to (%arg1) step (%arg2) {
        scf.if %arg3 {
          omp.cancel cancellation_construct_type(loop)
        }
        omp.yield
      }
    }
    return
  }
  func.func @omp_cancel_sections_nested(%arg0: i1) {
    omp.sections {
      omp.section {
        scf.if %arg0 {
          omp.cancel cancellation_construct_type(sections)
        }
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_cancel_taskgroup_nested(%arg0: i1) {
    omp.taskgroup {
      omp.task {
        scf.if %arg0 {
          omp.cancel cancellation_construct_type(taskgroup)
        }
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_cancellationpoint_parallel() {
    omp.parallel {
      omp.cancellation_point cancellation_construct_type(parallel)
      omp.cancel cancellation_construct_type(parallel)
      omp.terminator
    }
    return
  }
  func.func @omp_cancellationpoint_wsloop(%arg0: index, %arg1: index, %arg2: index) {
    omp.wsloop {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.cancellation_point cancellation_construct_type(loop)
        omp.cancel cancellation_construct_type(loop)
        omp.yield
      }
    }
    return
  }
  func.func @omp_cancellationpoint_sections() {
    omp.sections {
      omp.section {
        omp.cancellation_point cancellation_construct_type(sections)
        omp.cancel cancellation_construct_type(sections)
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_cancellationpoint_taskgroup() {
    omp.taskgroup {
      omp.task {
        omp.cancellation_point cancellation_construct_type(taskgroup)
        omp.cancel cancellation_construct_type(taskgroup)
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_cancellationpoint_parallel_nested(%arg0: i1) {
    omp.parallel {
      scf.if %arg0 {
        omp.cancellation_point cancellation_construct_type(parallel)
      }
      omp.terminator
    }
    return
  }
  func.func @omp_cancellationpoint_wsloop_nested(%arg0: index, %arg1: index, %arg2: index, %arg3: i1) {
    omp.wsloop {
      omp.loop_nest (%arg4) : index = (%arg0) to (%arg1) step (%arg2) {
        scf.if %arg3 {
          omp.cancellation_point cancellation_construct_type(loop)
        }
        omp.yield
      }
    }
    return
  }
  func.func @omp_cancellationpoint_sections_nested(%arg0: i1) {
    omp.sections {
      omp.section {
        scf.if %arg0 {
          omp.cancellation_point cancellation_construct_type(sections)
        }
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_cancellationpoint_taskgroup_nested(%arg0: i1) {
    omp.taskgroup {
      omp.task {
        scf.if %arg0 {
          omp.cancellation_point cancellation_construct_type(taskgroup)
        }
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_taskgroup_no_tasks() {
    omp.taskgroup {
      "test.foo"() : () -> ()
      omp.terminator
    }
    return
  }
  func.func @omp_taskgroup_multiple_tasks() {
    omp.taskgroup {
      omp.task {
        "test.foo"() : () -> ()
        omp.terminator
      }
      omp.task {
        "test.foo"() : () -> ()
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_taskgroup_clauses() {
    %0 = "test.memref"() : () -> memref<i32>
    %1 = "test.f32"() : () -> !llvm.ptr
    omp.taskgroup allocate(%0 : memref<i32> -> %0 : memref<i32>) task_reduction(@add_f32 %1 -> %arg0 : !llvm.ptr) {
      omp.task {
        "test.foo"() : () -> ()
        omp.terminator
      }
      omp.task {
        "test.foo"() : () -> ()
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_taskloop(%arg0: i32, %arg1: i32, %arg2: i32) {
    omp.taskloop.context {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg3) : i32 = (%arg0) to (%arg1) step (%arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    %0 = "test.bool"() : () -> i1
    omp.taskloop.context if(%0) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg3, %arg4) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    omp.taskloop.context final(%0) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg3, %arg4) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    omp.taskloop.context untied {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg3, %arg4) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    omp.taskloop.context mergeable {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg3, %arg4) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    %1 = "test.f32"() : () -> !llvm.ptr
    %2 = "test.f32"() : () -> !llvm.ptr
    omp.taskloop.context in_reduction(@add_f32 %1 -> %arg3, @add_f32 %2 -> %arg4 : !llvm.ptr, !llvm.ptr) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg5, %arg6) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    omp.taskloop.context in_reduction(byref @add_f32 %1 -> %arg3, @add_f32 %2 -> %arg4 : !llvm.ptr, !llvm.ptr) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg5, %arg6) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    omp.taskloop.context reduction(byref @add_f32 %1 -> %arg3, @add_f32 %2 -> %arg4 : !llvm.ptr, !llvm.ptr) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg5, %arg6) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    omp.taskloop.context reduction(byref @add_f32 %1 -> %arg3, byref @add_f32 %2 -> %arg4 : !llvm.ptr, !llvm.ptr) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg5, %arg6) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    omp.taskloop.context in_reduction(@add_f32 %1 -> %arg3 : !llvm.ptr) reduction(@add_f32 %2 -> %arg4 : !llvm.ptr) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg5, %arg6) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    %3 = "test.i32"() : () -> i32
    omp.taskloop.context priority(%3 : i32) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg3, %arg4) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    %4 = "test.memref"() : () -> memref<i32>
    omp.taskloop.context allocate(%4 : memref<i32> -> %4 : memref<i32>) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg3, %arg4) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    %5 = "test.i64"() : () -> i64
    omp.taskloop.context grainsize(%5: i64) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg3, %arg4) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    omp.taskloop.context num_tasks(%5: i64) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg3, %arg4) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    omp.taskloop.context grainsize(strict, %5: i64) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg3, %arg4) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    omp.taskloop.context num_tasks(strict, %5: i64) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg3, %arg4) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    omp.taskloop.context nogroup {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg3, %arg4) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    omp.taskloop.context {
      omp.taskloop.wrapper {
        omp.simd {
          omp.loop_nest (%arg3, %arg4) : i32 = (%arg0, %arg1) to (%arg1, %arg0) step (%arg2, %arg2) {
            omp.yield
          }
        } {omp.composite}
      } {omp.composite}
      omp.terminator
    } {omp.combined}
    omp.taskloop.context {
      %c1_i32 = arith.constant 1 : i32
      %c10_i32 = arith.constant 10 : i32
      %c1_i32_0 = arith.constant 1 : i32
      omp.taskloop.wrapper {
        omp.loop_nest (%arg3) : i32 = (%c1_i32) to (%c10_i32) step (%c1_i32_0) {
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    return
  }
  func.func @omp_requires_one() attributes {omp.requires = #omp<clause_requires reverse_offload>} {
    return
  }
  func.func @omp_requires_multiple() attributes {omp.requires = #omp<clause_requires unified_address|dynamic_allocators>} {
    return
  }
  func.func @opaque_pointers_atomic_rwu(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    omp.atomic.read %arg0 = %arg1 : !llvm.ptr, !llvm.ptr, i32
    %0 = llvm.load %arg1 : !llvm.ptr -> i32
    omp.atomic.write %arg0 = %0 : !llvm.ptr, i32
    omp.atomic.update %arg1 : !llvm.ptr {
    ^bb0(%arg2: i32):
      omp.yield(%arg2 : i32)
    }
    return
  }
  omp.declare_reduction @opaque_pointers_reduction : f32 init {
  ^bb0(%arg0: f32):
    %cst = arith.constant 0.000000e+00 : f32
    omp.yield(%cst : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = arith.addf %arg0, %arg1 : f32
    omp.yield(%0 : f32)
  } atomic {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg1 : !llvm.ptr -> f32
    %1 = llvm.atomicrmw fadd %arg0, %0 monotonic : !llvm.ptr, f32
    omp.yield
  }
  omp.declare_reduction @alloc_reduction : !llvm.ptr alloc {
  ^bb0(%arg0: !llvm.ptr):
    %c1_i32 = arith.constant 1 : i32
    %0 = llvm.alloca %c1_i32 x f32 : (i32) -> !llvm.ptr
    omp.yield(%0 : !llvm.ptr)
  } init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %cst = arith.constant 1.000000e+00 : f32
    llvm.store %cst, %arg1 : f32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  } combiner {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> f32
    %1 = llvm.load %arg1 : !llvm.ptr -> f32
    %2 = arith.addf %0, %1 : f32
    llvm.store %2, %arg0 : f32, !llvm.ptr
    omp.yield(%arg0 : !llvm.ptr)
  }
  func.func @omp_targets_with_map_bounds(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = llvm.mlir.constant(4 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(1 : index) : i64
    %4 = omp.map.bounds lower_bound(%1 : i64) upper_bound(%0 : i64) stride(%2 : i64) start_idx(%3 : i64)
    %5 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.array<10 x i32>) map_clauses(tofrom) capture(ByRef) bounds(%4) -> !llvm.ptr {name = ""}
    %6 = llvm.mlir.constant(9 : index) : i64
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.mlir.constant(2 : index) : i64
    %9 = llvm.mlir.constant(2 : index) : i64
    %10 = omp.map.bounds lower_bound(%7 : i64) upper_bound(%6 : i64) stride(%8 : i64) start_idx(%9 : i64)
    %11 = omp.map.info var_ptr(%arg1 : !llvm.ptr, !llvm.array<10 x i32>) map_clauses(storage) capture(ByCopy) mapper(@my_mapper) bounds(%10) -> !llvm.ptr {name = ""}
    omp.target kernel_type(generic) map_entries(%5 -> %arg2, %11 -> %arg3 : !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    omp.target_data map_entries(%5, %11 : !llvm.ptr, !llvm.ptr) {
    }
    %12 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.array<10 x i32>) map_clauses(storage) capture(VLAType) bounds(%4) -> !llvm.ptr {name = ""}
    omp.target_enter_data map_entries(%12 : !llvm.ptr)
    %13 = omp.map.info var_ptr(%arg1 : !llvm.ptr, !llvm.array<10 x i32>) map_clauses(storage) capture(This) bounds(%10) -> !llvm.ptr {name = ""}
    omp.target_exit_data map_entries(%13 : !llvm.ptr)
    return
  }
  func.func @omp_target_update_data(%arg0: i1, %arg1: si32, %arg2: memref<?xi32>, %arg3: memref<?xi32>) {
    %0 = omp.map.info var_ptr(%arg2 : memref<?xi32>, tensor<?xi32>) map_clauses(from) capture(ByRef) -> memref<?xi32> {name = ""}
    %1 = omp.map.info var_ptr(%arg3 : memref<?xi32>, tensor<?xi32>) map_clauses(present, to) capture(ByRef) -> memref<?xi32> {name = ""}
    omp.target_update device(%arg1 : si32) if(%arg0) map_entries(%0, %1 : memref<?xi32>, memref<?xi32>) nowait
    return
  }
  func.func @omp_targets_is_allocatable(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    %1 = omp.map.info var_ptr(%arg1 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(tofrom) capture(ByRef) members(%0 : [0] : !llvm.ptr) -> !llvm.ptr {name = ""}
    omp.target kernel_type(generic) map_entries(%0 -> %arg2, %1 -> %arg3 : !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    return
  }
  func.func @omp_target_enter_update_exit_data_depend(%arg0: memref<?xi32>, %arg1: memref<?xi32>, %arg2: memref<?xi32>) {
    %0 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(to) capture(ByRef) -> memref<?xi32>
    %1 = omp.map.info var_ptr(%arg1 : memref<?xi32>, tensor<?xi32>) map_clauses(from) capture(ByRef) -> memref<?xi32>
    %2 = omp.map.info var_ptr(%arg2 : memref<?xi32>, tensor<?xi32>) map_clauses(storage) capture(ByRef) -> memref<?xi32>
    omp.task depend(taskdependout -> %arg0 : memref<?xi32>) {
      "test.foo"(%arg0) : (memref<?xi32>) -> ()
      omp.terminator
    }
    omp.target_enter_data depend(taskdependin -> %arg0 : memref<?xi32>) map_entries(%0, %2 : memref<?xi32>, memref<?xi32>) nowait
    omp.target kernel_type(generic) map_entries(%1 -> %arg3 : memref<?xi32>) {
      "test.foo"(%arg3) : (memref<?xi32>) -> ()
      omp.terminator
    }
    omp.task depend(taskdependout -> %arg0 : memref<?xi32>) {
      "test.bar"(%arg0, %arg1) : (memref<?xi32>, memref<?xi32>) -> ()
    }
    omp.target_update depend(taskdependin -> %arg0 : memref<?xi32>) map_entries(%0 : memref<?xi32>) nowait
    %3 = omp.map.info var_ptr(%arg2 : memref<?xi32>, tensor<?xi32>) map_clauses(from) capture(ByRef) -> memref<?xi32>
    omp.target kernel_type(generic) depend(taskdependout -> %arg2 : memref<?xi32>) map_entries(%0 -> %arg3, %3 -> %arg4 : memref<?xi32>, memref<?xi32>) {
      "test.foobar"() : () -> ()
      omp.terminator
    }
    omp.target_exit_data depend(taskdependin -> %arg2 : memref<?xi32>) map_entries(%2 : memref<?xi32>)
    return
  }
  func.func @omp_map_with_members(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) -> !llvm.ptr {name = ""}
    %1 = omp.map.info var_ptr(%arg1 : !llvm.ptr, f32) map_clauses(to) capture(ByRef) -> !llvm.ptr {name = ""}
    %2 = omp.map.info var_ptr(%arg2 : !llvm.ptr, !llvm.struct<(i32, f32)>) map_clauses(to) capture(ByRef) members(%0, %1 : [0], [1] : !llvm.ptr, !llvm.ptr) -> !llvm.ptr {name = "", partial_map = true}
    omp.target_enter_data map_entries(%0, %1, %2 : !llvm.ptr, !llvm.ptr, !llvm.ptr)
    %3 = omp.map.info var_ptr(%arg3 : !llvm.ptr, i32) map_clauses(from) capture(ByRef) -> !llvm.ptr {name = ""}
    %4 = omp.map.info var_ptr(%arg4 : !llvm.ptr, f32) map_clauses(from) capture(ByRef) -> !llvm.ptr {name = ""}
    %5 = omp.map.info var_ptr(%arg5 : !llvm.ptr, !llvm.struct<(i32, struct<(i32, f32)>)>) map_clauses(from) capture(ByRef) members(%3, %4 : [1, 0], [1, 1] : !llvm.ptr, !llvm.ptr) -> !llvm.ptr {name = "", partial_map = true}
    omp.target_exit_data map_entries(%3, %4, %5 : !llvm.ptr, !llvm.ptr, !llvm.ptr)
    return
  }
  func.func @parallel_op_privatizers(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    omp.parallel private(@x.privatizer %arg0 -> %arg2, @y.privatizer %arg1 -> %arg3 : !llvm.ptr, !llvm.ptr) {
      %0 = llvm.load %arg2 : !llvm.ptr -> i32
      %1 = llvm.load %arg3 : !llvm.ptr -> i32
      omp.terminator
    }
    return
  }
  func.func @parallel_op_privatizers_barrier(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    omp.parallel private(@x.privatizer %arg0 -> %arg2, @y.privatizer %arg1 -> %arg3 : !llvm.ptr, !llvm.ptr) private_barrier {
      %0 = llvm.load %arg2 : !llvm.ptr -> i32
      %1 = llvm.load %arg3 : !llvm.ptr -> i32
      omp.terminator
    }
    return
  }
  omp.private {type = private} @a.privatizer : !llvm.ptr init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    omp.yield(%arg0 : !llvm.ptr)
  }
  omp.private {type = private} @x.privatizer : !llvm.ptr init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    omp.yield(%arg0 : !llvm.ptr)
  } dealloc {
  ^bb0(%arg0: !llvm.ptr):
    omp.yield
  }
  omp.private {type = firstprivate} @y.privatizer : !llvm.ptr copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    omp.yield(%arg0 : !llvm.ptr)
  } dealloc {
  ^bb0(%arg0: !llvm.ptr):
    omp.yield
  }
  func.func @parallel_op_reduction_and_private(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr) {
    omp.parallel private(@x.privatizer %arg0 -> %arg4, @y.privatizer %arg1 -> %arg5 : !llvm.ptr, !llvm.ptr) reduction(@add_f32 %arg2 -> %arg6, @add_f32 %arg3 -> %arg7 : !llvm.ptr, !llvm.ptr) {
      %0 = llvm.load %arg4 : !llvm.ptr -> f32
      %1 = llvm.load %arg5 : !llvm.ptr -> f32
      %2 = llvm.load %arg6 : !llvm.ptr -> f32
      %3 = llvm.load %arg7 : !llvm.ptr -> f32
      omp.terminator
    }
    return
  }
  func.func @omp_target_private(%arg0: memref<?xi32>, %arg1: memref<?xi32>, %arg2: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(tofrom) capture(ByRef) -> memref<?xi32> {name = ""}
    %1 = omp.map.info var_ptr(%arg1 : memref<?xi32>, tensor<?xi32>) map_clauses(storage) capture(ByRef) -> memref<?xi32> {name = ""}
    omp.target kernel_type(generic) private(@x.privatizer %arg2 -> %arg3 : !llvm.ptr) {
      omp.terminator
    }
    omp.target kernel_type(generic) map_entries(%0 -> %arg3, %1 -> %arg4 : memref<?xi32>, memref<?xi32>) private(@x.privatizer %arg2 -> %arg5 : !llvm.ptr) {
      omp.terminator
    }
    return
  }
  func.func @omp_target_private_with_map_idx(%arg0: memref<?xi32>, %arg1: memref<?xi32>, %arg2: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(tofrom) capture(ByRef) -> memref<?xi32> {name = ""}
    %1 = omp.map.info var_ptr(%arg1 : memref<?xi32>, tensor<?xi32>) map_clauses(storage) capture(ByRef) -> memref<?xi32> {name = ""}
    omp.target kernel_type(generic) map_entries(%0 -> %arg3, %1 -> %arg4 : memref<?xi32>, memref<?xi32>) private(@x.privatizer %arg2 -> %arg5 [map_idx=1] : !llvm.ptr) {
      omp.terminator
    }
    return
  }
  func.func @omp_target_host_eval(%arg0: i32) {
    omp.target kernel_type(generic) host_eval(%arg0 -> %arg1 : i32) {
      omp.teams num_teams( to %arg1 : i32) thread_limit(%arg1 : i32) {
        omp.terminator
      }
      omp.terminator
    }
    omp.target kernel_type(spmd) host_eval(%arg0 -> %arg1 : i32) {
      omp.teams {
        omp.parallel num_threads(%arg1 : i32) {
          omp.distribute {
            omp.wsloop {
              omp.loop_nest (%arg2) : i32 = (%arg1) to (%arg1) step (%arg1) {
                omp.yield
              }
            } {omp.composite}
          } {omp.composite}
          omp.terminator
        } {omp.composite}
        omp.terminator
      } {omp.combined}
      omp.terminator
    } {omp.combined}
    omp.target kernel_type(spmd) host_eval(%arg0 -> %arg1 : i32) {
      omp.parallel num_threads(%arg1 : i32) {
        omp.wsloop {
          omp.loop_nest (%arg2) : i32 = (%arg1) to (%arg1) step (%arg1) {
            omp.yield
          }
        }
        omp.terminator
      } {omp.combined}
      omp.terminator
    } {omp.combined}
    omp.target kernel_type(generic) host_eval(%arg0 -> %arg1 : i32) {
      omp.parallel num_threads(%arg1 : i32) {
        omp.terminator
      }
      omp.terminator
    }
    omp.target kernel_type(generic) host_eval(%arg0 -> %arg1 : i32) {
      omp.teams {
        omp.distribute {
          omp.loop_nest (%arg2) : i32 = (%arg1) to (%arg1) step (%arg1) {
            omp.yield
          }
        }
        omp.terminator
      } {omp.combined}
      omp.terminator
    } {omp.combined}
    omp.target kernel_type(spmd) host_eval(%arg0 -> %arg1 : i32) {
      omp.teams {
        omp.loop {
          omp.loop_nest (%arg2) : i32 = (%arg1) to (%arg1) step (%arg1) {
            omp.yield
          }
        }
        omp.terminator
      } {omp.combined}
      omp.terminator
    } {omp.combined}
    return
  }
  func.func @omp_loop(%arg0: index, %arg1: index, %arg2: index) {
    omp.loop {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    omp.loop bind(teams) {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    omp.loop bind(parallel) {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    omp.loop bind(thread) {
      omp.loop_nest (%arg3) : index = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    }
    return
  }
  func.func @omp_workshare() {
    omp.workshare {
      "test.payload"() : () -> ()
      omp.terminator
    }
    return
  }
  func.func @omp_workshare_nowait() {
    omp.workshare nowait {
      "test.payload"() : () -> ()
      omp.terminator
    }
    return
  }
  func.func @omp_workshare_multiple_blocks() {
    omp.workshare {
      cf.br ^bb1
    ^bb1:  // pred: ^bb0
      omp.terminator
    }
    return
  }
  func.func @omp_workshare_loop_wrapper(%arg0: index) {
    omp.workshare {
      omp.workshare.loop_wrapper {
        omp.loop_nest (%arg1) : index = (%arg0) to (%arg0) step (%arg0) {
          omp.yield
        }
      }
      omp.terminator
    }
    return
  }
  func.func @omp_workshare_loop_wrapper_attrs(%arg0: index) {
    omp.workshare {
      omp.workshare.loop_wrapper {
        omp.loop_nest (%arg1) : index = (%arg0) to (%arg0) step (%arg0) {
          omp.yield
        }
      } {attr_in_dict}
      omp.terminator
    }
    return
  }
  func.func @omp_init_allocator(%arg0: i64) -> i64 {
    return %arg0 : i64
  }
  func.func @omp_allocate_dir(%arg0: memref<i32>, %arg1: memref<i32>) {
    omp.allocate_dir(%arg0 : memref<i32>)
    omp.allocate_dir(%arg0, %arg1 : memref<i32>, memref<i32>)
    omp.allocate_dir(%arg0 : memref<i32>) align(2)
    %c1_i64 = arith.constant 1 : i64
    omp.allocate_dir(%arg0 : memref<i32>) allocator(%c1_i64 : i64)
    %c7_i64 = arith.constant 7 : i64
    omp.allocate_dir(%arg0 : memref<i32>) align(4) allocator(%c7_i64 : i64)
    %c6_i64 = arith.constant 6 : i64
    omp.allocate_dir(%arg0, %arg1 : memref<i32>, memref<i32>) align(8) allocator(%c6_i64 : i64)
    %c9_i64 = arith.constant 9 : i64
    %0 = call @omp_init_allocator(%c9_i64) : (i64) -> i64
    omp.allocate_dir(%arg0 : memref<i32>) allocator(%0 : i64)
    return
  }
  func.func @omp_allocate_free(%arg0: memref<i32>, %arg1: memref<i32>) {
    omp.allocate_free(%arg0 : memref<i32>)
    %c1_i64 = arith.constant 1 : i64
    omp.allocate_free(%arg0 : memref<i32>) allocator(%c1_i64 : i64)
    %c6_i64 = arith.constant 6 : i64
    omp.allocate_free(%arg0, %arg1 : memref<i32>, memref<i32>) allocator(%c6_i64 : i64)
    return
  }
  func.func @omp_workdistribute() {
    omp.teams {
      omp.workdistribute {
        omp.terminator
      }
      omp.terminator
    }
    return
  }
  func.func @omp_target_map_clause_type_test(%arg0: memref<?xi32>) {
    %0 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(none) capture(ByRef) -> memref<?xi32> {name = ""}
    %1 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(to) capture(ByRef) -> memref<?xi32> {name = ""}
    %2 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(from) capture(ByRef) -> memref<?xi32> {name = ""}
    %3 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(tofrom) capture(ByRef) -> memref<?xi32> {name = ""}
    %4 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(storage) capture(ByRef) -> memref<?xi32> {name = ""}
    %5 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(delete) capture(ByRef) -> memref<?xi32> {name = ""}
    %6 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(return_param) capture(ByRef) -> memref<?xi32> {name = ""}
    %7 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(private) capture(ByRef) -> memref<?xi32> {name = ""}
    %8 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(literal) capture(ByRef) -> memref<?xi32> {name = ""}
    %9 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(implicit) capture(ByRef) -> memref<?xi32> {name = ""}
    %10 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(close) capture(ByRef) -> memref<?xi32> {name = ""}
    %11 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(present) capture(ByRef) -> memref<?xi32> {name = ""}
    %12 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(ompx_hold) capture(ByRef) -> memref<?xi32> {name = ""}
    %13 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(attach) capture(ByRef) -> memref<?xi32> {name = ""}
    %14 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(attach_always) capture(ByRef) -> memref<?xi32> {name = ""}
    %15 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(attach_never) capture(ByRef) -> memref<?xi32> {name = ""}
    %16 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(attach_auto) capture(ByRef) -> memref<?xi32> {name = ""}
    %17 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(ref_ptr) capture(ByRef) -> memref<?xi32> {name = ""}
    %18 = omp.map.info var_ptr(%arg0 : memref<?xi32>, tensor<?xi32>) map_clauses(ref_ptee) capture(ByRef) -> memref<?xi32> {name = ""}
    return
  }
  func.func @omp_declare_simd() {
    omp.declare_simd
    return
  }
  func.func @omp_declare_simd_simdlen() {
    omp.declare_simd simdlen(8)
    return
  }
  func.func @omp_declare_simd_aligned(%arg0: f64, %arg1: f64, %arg2: memref<i32>, %arg3: memref<i32>) {
    omp.declare_simd aligned(%arg2 : memref<i32> -> 32 : i64, %arg3 : memref<i32> -> 128 : i64)
    return
  }
  func.func @omp_declare_simd_aligned_list_generic(%arg0: f64, %arg1: f64, %arg2: memref<i32>, %arg3: memref<i32>) {
    omp.declare_simd aligned(%arg2 : memref<i32> -> 32 : i64, %arg3 : memref<i32> -> 128 : i64)
    return
  }
  func.func @omp_declare_simd_linear(%arg0: f64, %arg1: f64, %arg2: i32, %arg3: i32) {
    omp.declare_simd linear(%arg2 : i32 = %arg3 : i32)
    return
  }
  func.func @omp_declare_simd_linear_val(%arg0: i32, %arg1: i32) {
    omp.declare_simd linear(val(%arg0 : i32 = %arg1 : i32))
    return
  }
  func.func @omp_declare_simd_linear_ref(%arg0: memref<i32>, %arg1: i32) {
    omp.declare_simd linear(ref(%arg0 : memref<i32> = %arg1 : i32))
    return
  }
  func.func @omp_declare_simd_linear_uval(%arg0: memref<i32>, %arg1: i32) {
    omp.declare_simd linear(uval(%arg0 : memref<i32> = %arg1 : i32))
    return
  }
  func.func @omp_declare_simd_linear_mixed_modifiers(%arg0: i32, %arg1: memref<i32>, %arg2: memref<i32>, %arg3: i32, %arg4: i32, %arg5: i32) {
    omp.declare_simd linear(val(%arg0 : i32 = %arg3 : i32), ref(%arg1 : memref<i32> = %arg4 : i32), uval(%arg2 : memref<i32> = %arg5 : i32))
    return
  }
  func.func @omp_declare_simd_linear_mixed_with_non_modifiers(%arg0: i32, %arg1: memref<i32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32) {
    omp.declare_simd linear(val(%arg0 : i32 = %arg3 : i32), %arg1 : memref<i32> = %arg4 : i32, ref(%arg2 : i32 = %arg5 : i32))
    return
  }
  func.func @omp_declare_simd_uniform(%arg0: f64, %arg1: f64, %arg2: memref<i32>, %arg3: memref<i32>) {
    omp.declare_simd uniform(%arg2 : memref<i32>, %arg3 : memref<i32>)
    return
  }
  func.func @omp_declare_simd_inbranch() {
    omp.declare_simd inbranch
    return
  }
  func.func @omp_declare_simd_notinbranch() {
    omp.declare_simd notinbranch
    return
  }
  func.func @omp_declare_simd_multiple_clauses(%arg0: f64, %arg1: f64, %arg2: memref<i32>, %arg3: memref<i32>, %arg4: i32, %arg5: i32) {
    omp.declare_simd aligned(%arg2 : memref<i32> -> 32 : i64, %arg3 : memref<i32> -> 128 : i64) notinbranch simdlen(8) uniform(%arg2 : memref<i32>, %arg3 : memref<i32>)
    return
  }
  func.func @omp_declare_simd_all_clauses(%arg0: f64, %arg1: f64, %arg2: memref<i32>, %arg3: memref<i32>, %arg4: i32, %arg5: i32) {
    omp.declare_simd aligned(%arg2 : memref<i32> -> 32 : i64, %arg3 : memref<i32> -> 128 : i64) inbranch linear(%arg4 : i32 = %arg5 : i32) simdlen(8) uniform(%arg2 : memref<i32>, %arg3 : memref<i32>)
    return
  }
  func.func @task_affinity_single(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(400 : i64) : i64
    %1 = omp.affinity_entry %arg0, %0 : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
    omp.task affinity(%1 : !omp.affinity_entry_ty<!llvm.ptr, i64>) {
      omp.terminator
    }
    return
  }
  func.func @task_affinity_multi(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = llvm.mlir.constant(400 : i64) : i64
    %1 = omp.affinity_entry %arg0, %0 : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
    %2 = llvm.mlir.constant(800 : i64) : i64
    %3 = omp.affinity_entry %arg1, %2 : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
    omp.task affinity(%1 : !omp.affinity_entry_ty<!llvm.ptr, i64>, %3 : !omp.affinity_entry_ty<!llvm.ptr, i64>) {
      omp.terminator
    }
    return
  }
  func.func @omp_iterator(%arg0: !llvm.struct<(ptr, i64)>) {
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c1_0 = arith.constant 1 : index
    %0 = omp.iterator(%arg1: index) = (%c1 to %c4 step %c1_0) {
      omp.yield(%arg0 : !llvm.struct<(ptr, i64)>)
    } -> !omp.iterated<!llvm.struct<(ptr, i64)>>
    return
  }
  func.func @omp_iterator_explicit_yield(%arg0: index) {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    %0 = omp.iterator(%arg1: index) = (%c0 to %c4 step %c1) {
      omp.yield(%arg0 : index)
    } -> !omp.iterated<index>
    return
  }
  func.func @omp_iterator_2d(%arg0: !llvm.struct<(ptr, i64)>) {
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c1_0 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c10 = arith.constant 10 : index
    %c2_1 = arith.constant 2 : index
    %0 = omp.iterator(%arg1: index, %arg2: index) = (%c1 to %c4 step %c1_0, %c2 to %c10 step %c2_1) {
      omp.yield(%arg0 : !llvm.struct<(ptr, i64)>)
    } -> !omp.iterated<!llvm.struct<(ptr, i64)>>
    return
  }
  func.func @omp_iterator_negative_step(%arg0: !llvm.struct<(ptr, i64)>) {
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    %c-1 = arith.constant -1 : index
    %0 = omp.iterator(%arg1: index) = (%c4 to %c1 step %c-1) {
      omp.yield(%arg0 : !llvm.struct<(ptr, i64)>)
    } -> !omp.iterated<!llvm.struct<(ptr, i64)>>
    return
  }
  func.func @omp_task_affinity_iterator_1d(%arg0: index, %arg1: index, %arg2: index, %arg3: !llvm.ptr, %arg4: i64) {
    %0 = omp.iterator(%arg5: index) = (%arg0 to %arg1 step %arg2) {
      %1 = omp.affinity_entry %arg3, %arg4 : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
      omp.yield(%1 : !omp.affinity_entry_ty<!llvm.ptr, i64>)
    } -> !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>
    omp.task affinity(%0 : !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>) {
      omp.terminator
    }
    return
  }
  func.func @omp_task_affinity_iterator_2d(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: !llvm.ptr, %arg7: !llvm.ptr, %arg8: i64, %arg9: i64) {
    %0 = omp.iterator(%arg10: index, %arg11: index) = (%arg0 to %arg1 step %arg2, %arg3 to %arg4 step %arg5) {
      %1 = arith.addi %arg10, %arg0 : index
      %2 = arith.addi %arg11, %arg3 : index
      %3 = arith.cmpi ult, %1, %2 : index
      %4 = omp.affinity_entry %arg6, %arg8 : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
      %5 = omp.affinity_entry %arg7, %arg9 : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
      omp.yield(%5 : !omp.affinity_entry_ty<!llvm.ptr, i64>)
    } -> !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>
    omp.task affinity(%0 : !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>) {
      omp.terminator
    }
    return
  }
  func.func @omp_target_allocmem(%arg0: i32, %arg1: index, %arg2: index, %arg3: i32) {
    %0 = omp.target_allocmem %arg0 : i32, i64
    %1 = omp.target_allocmem %arg0 : i32, vector<16x16xf32> {bindc_name = "bindc", uniq_name = "uniq"}
    %2 = omp.target_allocmem %arg0 : i32, !llvm.ptr(%arg1, %arg2, %arg3 : index, index, i32)
    %3 = omp.target_allocmem %arg0 : i32, !llvm.ptr, %arg1, %arg2
    %4 = omp.target_allocmem %arg0 : i32, !llvm.ptr(%arg1, %arg2, %arg3 : index, index, i32), %arg1, %arg2
    return
  }
  func.func @omp_target_freemem(%arg0: i32) {
    %0 = omp.target_allocmem %arg0 : i32, i64
    omp.target_freemem %arg0, %0 : i32, i64
    return
  }
  func.func @omp_alloc_shared_mem(%arg0: i32) {
    %0 = omp.alloc_shared_mem %arg0 x i64 : (i32) -> !llvm.ptr
    %1 = omp.alloc_shared_mem %arg0 x vector<16x16xf32> : (i32) -> !llvm.ptr
    %2 = omp.alloc_shared_mem %arg0 x !llvm.ptr : (i32) align(16) -> !llvm.ptr
    return
  }
  func.func @omp_free_shared_mem(%arg0: i64) {
    %0 = omp.alloc_shared_mem %arg0 x f32 : (i64) -> !llvm.ptr
    omp.free_shared_mem [%arg0 x f32 : (i64)] %0 : !llvm.ptr
    %1 = omp.alloc_shared_mem %arg0 x f32 : (i64) align(32) -> !llvm.ptr
    omp.free_shared_mem [%arg0 x f32 : (i64) align(32)] %1 : !llvm.ptr
    return
  }
  func.func @omp_groupprivate_device_type() {
    %c2_i32 = arith.constant 2 : i32
    %0 = omp.groupprivate @gp : !llvm.ptr
    %1 = omp.groupprivate @any device_type (any) : !llvm.ptr
    llvm.store %c2_i32, %1 : i32, !llvm.ptr
    %2 = omp.groupprivate @host device_type (host) : !llvm.ptr
    llvm.store %c2_i32, %2 : i32, !llvm.ptr
    %3 = omp.groupprivate @nohost device_type (nohost) : !llvm.ptr
    llvm.store %c2_i32, %3 : i32, !llvm.ptr
    return
  }
  llvm.mlir.global internal @gp() {addr_space = 0 : i32} : i32
  llvm.mlir.global internal @any() {addr_space = 0 : i32} : i32
  llvm.mlir.global internal @host() {addr_space = 0 : i32} : i32
  llvm.mlir.global internal @nohost() {addr_space = 0 : i32} : i32
}

// -----
module {
  func.func @omp_target_update_map_iterated(%arg0: index, %arg1: index, %arg2: index, %arg3: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg3 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) -> !llvm.ptr {name = ""}
    %1 = omp.iterator(%arg4: index) = (%arg0 to %arg1 step %arg2) {
      %2 = omp.map.info var_ptr(%arg3 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) -> !llvm.ptr {name = ""}
      omp.yield(%2 : !llvm.ptr)
    } -> !omp.iterated<!llvm.ptr>
    omp.target_update map_entries(%0 : !llvm.ptr) map_iterated(%1 : !omp.iterated<!llvm.ptr>)
    return
  }
}

// -----
module {
  func.func @omp_target_enter_data_map_iterated(%arg0: index, %arg1: index, %arg2: index, %arg3: !llvm.ptr) {
    %0 = omp.iterator(%arg4: index) = (%arg0 to %arg1 step %arg2) {
      %1 = omp.map.info var_ptr(%arg3 : !llvm.ptr, i32) map_clauses(to) capture(ByRef) -> !llvm.ptr {name = ""}
      omp.yield(%1 : !llvm.ptr)
    } -> !omp.iterated<!llvm.ptr>
    omp.target_enter_data map_iterated(%0 : !omp.iterated<!llvm.ptr>)
    return
  }
}

// -----
module {
  func.func @omp_target_exit_data_map_iterated(%arg0: index, %arg1: index, %arg2: index, %arg3: !llvm.ptr) {
    %0 = omp.iterator(%arg4: index) = (%arg0 to %arg1 step %arg2) {
      %1 = omp.map.info var_ptr(%arg3 : !llvm.ptr, i32) map_clauses(from) capture(ByRef) -> !llvm.ptr {name = ""}
      omp.yield(%1 : !llvm.ptr)
    } -> !omp.iterated<!llvm.ptr>
    omp.target_exit_data map_iterated(%0 : !omp.iterated<!llvm.ptr>)
    return
  }
}

// -----
module {
  func.func @omp_target_data_map_iterated(%arg0: index, %arg1: index, %arg2: index, %arg3: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg3 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    %1 = omp.iterator(%arg4: index) = (%arg0 to %arg1 step %arg2) {
      %2 = omp.map.info var_ptr(%arg3 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
      omp.yield(%2 : !llvm.ptr)
    } -> !omp.iterated<!llvm.ptr>
    omp.target_data map_entries(%0 : !llvm.ptr) map_iterated(%1 : !omp.iterated<!llvm.ptr>) {
    }
    return
  }
}

// -----
module {
  func.func @omp_target_map_iterated(%arg0: index, %arg1: index, %arg2: index, %arg3: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg3 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    %1 = omp.iterator(%arg4: index) = (%arg0 to %arg1 step %arg2) {
      %2 = omp.map.info var_ptr(%arg3 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
      omp.yield(%2 : !llvm.ptr)
    } -> !omp.iterated<!llvm.ptr>
    omp.target kernel_type(generic) map_iterated(%1 : !omp.iterated<!llvm.ptr>) map_entries(%0 -> %arg4 : !llvm.ptr) {
      omp.terminator
    }
    return
  }
}

