module {
  llvm.func @test_stand_alone_directives() {
    omp.barrier
    omp.taskwait
    omp.taskyield
    llvm.return
  }
  llvm.func @test_flush_construct(%arg0: !llvm.ptr) {
    omp.flush
    omp.flush(%arg0 : !llvm.ptr)
    omp.flush(%arg0, %arg0 : !llvm.ptr, !llvm.ptr)
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {in_type = i32, name = "a"} : (i64) -> !llvm.ptr
    omp.flush
    %2 = llvm.load %1 : !llvm.ptr -> i32
    llvm.return
  }
  llvm.func @test_omp_parallel_1() {
    omp.parallel {
      omp.barrier
      omp.terminator
    }
    llvm.return
  }
  llvm.func @body(i64)
  llvm.func @test_omp_parallel_2() {
    omp.parallel {
      %0 = llvm.mlir.constant(1 : index) : i64
      %1 = llvm.mlir.constant(42 : index) : i64
      llvm.call @body(%0) : (i64) -> ()
      llvm.call @body(%1) : (i64) -> ()
      llvm.br ^bb1
    ^bb1:  // pred: ^bb0
      %2 = llvm.add %0, %1 : i64
      llvm.call @body(%2) : (i64) -> ()
      omp.terminator
    }
    llvm.return
  }
  llvm.func @test_omp_parallel_num_threads_1(%arg0: i32) {
    omp.parallel num_threads(%arg0 : i32) {
      omp.barrier
      omp.terminator
    }
    llvm.return
  }
  llvm.func @test_omp_parallel_num_threads_2() {
    %0 = llvm.mlir.constant(4 : index) : i32
    omp.parallel num_threads(%0 : i32) {
      omp.barrier
      omp.terminator
    }
    llvm.return
  }
  llvm.func @test_omp_parallel_num_threads_3() {
    %0 = llvm.mlir.constant(4 : index) : i32
    omp.parallel num_threads(%0 : i32) {
      omp.barrier
      omp.terminator
    }
    %1 = llvm.mlir.constant(8 : index) : i32
    omp.parallel num_threads(%1 : i32) {
      omp.barrier
      omp.terminator
    }
    llvm.return
  }
  llvm.func @test_omp_parallel_if_1(%arg0: i32) {
    %0 = llvm.mlir.constant(0 : index) : i32
    %1 = llvm.icmp "slt" %arg0, %0 : i32
    omp.parallel if(%1) {
      omp.barrier
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @test_omp_parallel_attrs() attributes {target_cpu = "x86-64", target_features = #llvm.target_features<["+mmx", "+sse"]>} {
    omp.parallel {
      omp.barrier
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @test_omp_parallel_3() {
    omp.parallel proc_bind(master) {
      omp.barrier
      omp.terminator
    }
    omp.parallel proc_bind(close) {
      omp.barrier
      omp.terminator
    }
    omp.parallel proc_bind(spread) {
      omp.barrier
      omp.terminator
    }
    llvm.return
  }
  llvm.func @test_omp_parallel_4() {
    omp.parallel {
      omp.barrier
      omp.parallel {
        omp.barrier
        omp.terminator
      }
      omp.barrier
      omp.terminator
    }
    llvm.return
  }
  llvm.func @test_omp_parallel_5() {
    omp.parallel {
      omp.barrier
      omp.parallel {
        omp.parallel {
          omp.barrier
          omp.terminator
        }
        omp.terminator
      }
      omp.barrier
      omp.terminator
    }
    llvm.return
  }
  llvm.func @test_omp_master() {
    omp.parallel {
      omp.master {
        omp.terminator
      }
      omp.terminator
    }
    omp.parallel {
      omp.parallel {
        omp.master {
          omp.terminator
        }
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @test_omp_masked(%arg0: i32) {
    omp.parallel {
      omp.masked filter(%arg0 : i32) {
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @wsloop_linear(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: !llvm.ptr) {
    omp.wsloop linear(%arg3 = %arg2 : !llvm.ptr) {
      omp.loop_nest (%arg4) : i32 = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    } {linear_var_types = [i32]}
    llvm.return
  }
}

// -----
module {
  llvm.func @wsloop_simple(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(42 : index) : i64
    %1 = llvm.mlir.constant(10 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    omp.parallel {
      omp.wsloop {
        omp.loop_nest (%arg1) : i64 = (%1) to (%0) step (%2) {
          %3 = llvm.mlir.constant(2.000000e+00 : f32) : f32
          %4 = llvm.getelementptr %arg0[%arg1] : (!llvm.ptr, i64) -> !llvm.ptr, f32
          llvm.store %3, %4 : f32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @wsloop_inclusive_1(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(42 : index) : i64
    %1 = llvm.mlir.constant(10 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    omp.wsloop {
      omp.loop_nest (%arg1) : i64 = (%1) to (%0) step (%2) {
        %3 = llvm.mlir.constant(2.000000e+00 : f32) : f32
        %4 = llvm.getelementptr %arg0[%arg1] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %3, %4 : f32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @wsloop_inclusive_2(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(42 : index) : i64
    %1 = llvm.mlir.constant(10 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    omp.wsloop {
      omp.loop_nest (%arg1) : i64 = (%1) to (%0) inclusive step (%2) {
        %3 = llvm.mlir.constant(2.000000e+00 : f32) : f32
        %4 = llvm.getelementptr %arg0[%arg1] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %3, %4 : f32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i32)
  llvm.func @test_omp_wsloop_static_defchunk(%arg0: i32, %arg1: i32, %arg2: i32) {
    omp.wsloop schedule(static) {
      omp.loop_nest (%arg3) : i32 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i32) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i32)
  llvm.func @test_omp_wsloop_static_1(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    omp.wsloop schedule(static = %0 : i32) {
      omp.loop_nest (%arg3) : i32 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i32) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i32)
  llvm.func @test_omp_wsloop_static_2(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = llvm.mlir.constant(2 : i32) : i32
    omp.wsloop schedule(static = %0 : i32) {
      omp.loop_nest (%arg3) : i32 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i32) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_dynamic(%arg0: i64, %arg1: i64, %arg2: i64) {
    omp.wsloop schedule(dynamic) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_dynamic_chunk_const(%arg0: i64, %arg1: i64, %arg2: i64) {
    %0 = llvm.mlir.constant(2 : i16) : i16
    omp.wsloop schedule(dynamic = %0 : i16) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i32)
  llvm.func @test_omp_wsloop_dynamic_chunk_var(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i16 {bindc_name = "chunk_size", in_type = i16, uniq_name = "_QFsub1Echunk_size"} : (i64) -> !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> i16
    omp.wsloop schedule(dynamic = %2 : i16) {
      omp.loop_nest (%arg3) : i32 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i32) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i32)
  llvm.func @test_omp_wsloop_dynamic_chunk_var2(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i64 {bindc_name = "chunk_size", in_type = i64, uniq_name = "_QFsub1Echunk_size"} : (i64) -> !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> i64
    omp.wsloop schedule(dynamic = %2 : i64) {
      omp.loop_nest (%arg3) : i32 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i32) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i32)
  llvm.func @test_omp_wsloop_dynamic_chunk_var3(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32) {
    omp.wsloop schedule(dynamic = %arg3 : i32) {
      omp.loop_nest (%arg4) : i32 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg4) : (i32) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_auto(%arg0: i64, %arg1: i64, %arg2: i64) {
    omp.wsloop schedule(auto) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_runtime(%arg0: i64, %arg1: i64, %arg2: i64) {
    omp.wsloop schedule(runtime) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_guided(%arg0: i64, %arg1: i64, %arg2: i64) {
    omp.wsloop schedule(guided) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_dynamic_nonmonotonic(%arg0: i64, %arg1: i64, %arg2: i64) {
    omp.wsloop schedule(dynamic, nonmonotonic) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_dynamic_monotonic(%arg0: i64, %arg1: i64, %arg2: i64) {
    omp.wsloop schedule(dynamic, monotonic) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_runtime_simd(%arg0: i64, %arg1: i64, %arg2: i64) {
    omp.wsloop schedule(runtime, none, simd) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_guided_simd(%arg0: i64, %arg1: i64, %arg2: i64) {
    omp.wsloop schedule(guided, none, simd) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @simd_simple(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: !llvm.ptr) {
    omp.simd {
      omp.loop_nest (%arg4) : i64 = (%arg0) to (%arg1) step (%arg2) {
        %0 = llvm.mlir.constant(2.000000e+00 : f32) : f32
        %1 = llvm.getelementptr %arg3[%arg4] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %0, %1 : f32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @simd_linear(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: !llvm.ptr) {
    omp.simd linear(%arg3 = %arg2 : !llvm.ptr) {
      omp.loop_nest (%arg4) : i32 = (%arg0) to (%arg1) step (%arg2) {
        omp.yield
      }
    } {linear_var_types = [i32]}
    llvm.return
  }
}

// -----
module {
  llvm.func @simd_linear_i64_var_i32_step(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    omp.simd linear(%arg2 = %0 : !llvm.ptr) {
      omp.loop_nest (%arg3) : i32 = (%arg0) to (%arg1) step (%0) {
        omp.yield
      }
    } {linear_var_types = [i64]}
    llvm.return
  }
}

// -----
module {
  llvm.func @simd_linear_f64_var_i32_step(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    omp.simd linear(%arg2 = %0 : !llvm.ptr) {
      omp.loop_nest (%arg3) : i32 = (%arg0) to (%arg1) step (%0) {
        omp.yield
      }
    } {linear_var_types = [f64]}
    llvm.return
  }
}

// -----
module {
  llvm.func @simd_simple_multiple(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: !llvm.ptr, %arg7: !llvm.ptr) {
    omp.simd {
      omp.loop_nest (%arg8, %arg9) : i64 = (%arg0, %arg3) to (%arg1, %arg4) inclusive step (%arg2, %arg5) collapse(2) {
        %0 = llvm.mlir.constant(2.000000e+00 : f32) : f32
        %1 = llvm.getelementptr %arg6[%arg8] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %2 = llvm.getelementptr %arg7[%arg9] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %0, %1 : f32, !llvm.ptr
        llvm.store %0, %2 : f32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @simd_simple_multiple_simdlen(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: !llvm.ptr, %arg7: !llvm.ptr) {
    omp.simd simdlen(2) {
      omp.loop_nest (%arg8, %arg9) : i64 = (%arg0, %arg3) to (%arg1, %arg4) step (%arg2, %arg5) collapse(2) {
        %0 = llvm.mlir.constant(2.000000e+00 : f32) : f32
        %1 = llvm.getelementptr %arg6[%arg8] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %2 = llvm.getelementptr %arg7[%arg9] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %0, %1 : f32, !llvm.ptr
        llvm.store %0, %2 : f32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @simd_simple_multiple_safelen(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: !llvm.ptr, %arg7: !llvm.ptr) {
    omp.simd safelen(2) {
      omp.loop_nest (%arg8, %arg9) : i64 = (%arg0, %arg3) to (%arg1, %arg4) step (%arg2, %arg5) collapse(2) {
        %0 = llvm.mlir.constant(2.000000e+00 : f32) : f32
        %1 = llvm.getelementptr %arg6[%arg8] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %2 = llvm.getelementptr %arg7[%arg9] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %0, %1 : f32, !llvm.ptr
        llvm.store %0, %2 : f32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @simd_simple_multiple_simdlen_safelen(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: !llvm.ptr, %arg7: !llvm.ptr) {
    omp.simd safelen(2) simdlen(1) {
      omp.loop_nest (%arg8, %arg9) : i64 = (%arg0, %arg3) to (%arg1, %arg4) step (%arg2, %arg5) collapse(2) {
        %0 = llvm.mlir.constant(2.000000e+00 : f32) : f32
        %1 = llvm.getelementptr %arg6[%arg8] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %2 = llvm.getelementptr %arg7[%arg9] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %0, %1 : f32, !llvm.ptr
        llvm.store %0, %2 : f32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @simd_if(%arg0: !llvm.ptr {fir.bindc_name = "n"}, %arg1: !llvm.ptr {fir.bindc_name = "threshold"}) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {adapt.valuebyref, in_type = i32, operandSegmentSizes = array<i32: 0, 0>} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "i", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFtest_simdEi"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(0 : i32) : i32
    %5 = llvm.load %arg0 : !llvm.ptr -> i32
    %6 = llvm.mlir.constant(1 : i32) : i32
    %7 = llvm.load %arg0 : !llvm.ptr -> i32
    %8 = llvm.load %arg1 : !llvm.ptr -> i32
    %9 = llvm.icmp "sge" %7, %8 : i32
    omp.simd if(%9) {
      omp.loop_nest (%arg2) : i32 = (%4) to (%5) inclusive step (%6) {
        llvm.store %arg2, %1 : i32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @simd_order() {
    %0 = llvm.mlir.constant(10 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.alloca %1 x i64 : (i64) -> !llvm.ptr
    omp.simd order(concurrent) safelen(2) {
      omp.loop_nest (%arg0) : i64 = (%1) to (%0) inclusive step (%1) {
        llvm.store %arg0, %2 : i64, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_ordered(%arg0: i64, %arg1: i64, %arg2: i64) {
    omp.wsloop ordered(0) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_static_ordered(%arg0: i64, %arg1: i64, %arg2: i64) {
    omp.wsloop ordered(0) schedule(static) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i32)
  llvm.func @test_omp_wsloop_static_chunk_ordered(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    omp.wsloop ordered(0) schedule(static = %0 : i32) {
      omp.loop_nest (%arg3) : i32 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i32) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_dynamic_ordered(%arg0: i64, %arg1: i64, %arg2: i64) {
    omp.wsloop ordered(0) schedule(dynamic) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_auto_ordered(%arg0: i64, %arg1: i64, %arg2: i64) {
    omp.wsloop ordered(0) schedule(auto) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_runtime_ordered(%arg0: i64, %arg1: i64, %arg2: i64) {
    omp.wsloop ordered(0) schedule(runtime) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_guided_ordered(%arg0: i64, %arg1: i64, %arg2: i64) {
    omp.wsloop ordered(0) schedule(guided) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_dynamic_nonmonotonic_ordered(%arg0: i64, %arg1: i64, %arg2: i64) {
    omp.wsloop ordered(0) schedule(dynamic, nonmonotonic) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @body(i64)
  llvm.func @test_omp_wsloop_dynamic_monotonic_ordered(%arg0: i64, %arg1: i64, %arg2: i64) {
    omp.wsloop ordered(0) schedule(dynamic, monotonic) {
      omp.loop_nest (%arg3) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.call @body(%arg3) : (i64) -> ()
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  omp.critical.declare @mutex_none
  omp.critical.declare @mutex_uncontended hint(uncontended)
  omp.critical.declare @mutex_contended hint(contended)
  omp.critical.declare @mutex_nonspeculative hint(nonspeculative)
  omp.critical.declare @mutex_nonspeculative_uncontended hint(uncontended, nonspeculative)
  omp.critical.declare @mutex_nonspeculative_contended hint(contended, nonspeculative)
  omp.critical.declare @mutex_speculative hint(speculative)
  omp.critical.declare @mutex_speculative_uncontended hint(uncontended, speculative)
  omp.critical.declare @mutex_speculative_contended hint(contended, speculative)
  llvm.func @omp_critical(%arg0: !llvm.ptr, %arg1: i32) {
    omp.critical {
      llvm.store %arg1, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    omp.critical(@mutex_none) {
      llvm.store %arg1, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    omp.critical(@mutex_uncontended) {
      llvm.store %arg1, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    omp.critical(@mutex_contended) {
      llvm.store %arg1, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    omp.critical(@mutex_nonspeculative) {
      llvm.store %arg1, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    omp.critical(@mutex_nonspeculative_uncontended) {
      llvm.store %arg1, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    omp.critical(@mutex_nonspeculative_contended) {
      llvm.store %arg1, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    omp.critical(@mutex_speculative) {
      llvm.store %arg1, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    omp.critical(@mutex_speculative_uncontended) {
      llvm.store %arg1, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    omp.critical(@mutex_speculative_contended) {
      llvm.store %arg1, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @collapse_wsloop(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: !llvm.ptr) {
    omp.parallel {
      omp.wsloop {
        omp.loop_nest (%arg10, %arg11, %arg12) : i32 = (%arg0, %arg1, %arg2) to (%arg3, %arg4, %arg5) step (%arg6, %arg7, %arg8) collapse(3) {
          %0 = llvm.load %arg9 : !llvm.ptr -> i32
          %1 = llvm.add %0, %arg10 : i32
          %2 = llvm.add %1, %arg11 : i32
          %3 = llvm.add %2, %arg12 : i32
          llvm.store %3, %arg9 : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @collapse_wsloop_dynamic(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: !llvm.ptr) {
    omp.parallel {
      omp.wsloop schedule(dynamic) {
        omp.loop_nest (%arg10, %arg11, %arg12) : i32 = (%arg0, %arg1, %arg2) to (%arg3, %arg4, %arg5) step (%arg6, %arg7, %arg8) collapse(3) {
          %0 = llvm.load %arg9 : !llvm.ptr -> i32
          %1 = llvm.add %0, %arg10 : i32
          %2 = llvm.add %1, %arg11 : i32
          %3 = llvm.add %2, %arg12 : i32
          llvm.store %3, %arg9 : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_ordered(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64) {
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
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_atomic_read(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    omp.atomic.read %arg1 = %arg0 memory_order(seq_cst) : !llvm.ptr, !llvm.ptr, i32
    omp.atomic.read %arg1 = %arg0 memory_order(acquire) : !llvm.ptr, !llvm.ptr, i32
    omp.atomic.read %arg1 = %arg0 memory_order(relaxed) : !llvm.ptr, !llvm.ptr, i32
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_atomic_read_implicit_cast() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x f32 {bindc_name = "z"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x f64 {bindc_name = "y"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.alloca %4 x !llvm.array<2 x struct<(f32, f32)>> {bindc_name = "x"} : (i64) -> !llvm.ptr
    %6 = llvm.mlir.constant(1 : i64) : i64
    %7 = llvm.alloca %6 x i32 {bindc_name = "w"} : (i64) -> !llvm.ptr
    %8 = llvm.mlir.constant(1 : index) : i64
    %9 = llvm.mlir.constant(2 : index) : i64
    %10 = llvm.mlir.constant(1 : i64) : i64
    %11 = llvm.mlir.constant(0 : i64) : i64
    %12 = llvm.sub %8, %10 overflow<nsw> : i64
    %13 = llvm.mul %12, %10 overflow<nsw> : i64
    %14 = llvm.mul %13, %10 overflow<nsw> : i64
    %15 = llvm.add %14, %11 overflow<nsw> : i64
    %16 = llvm.mul %10, %9 overflow<nsw> : i64
    %17 = llvm.getelementptr %5[%15] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(f32, f32)>
    omp.atomic.read %3 = %17 : !llvm.ptr, !llvm.ptr, !llvm.struct<(f32, f32)>
    omp.atomic.read %3 = %1 : !llvm.ptr, !llvm.ptr, f32
    omp.atomic.read %3 = %7 : !llvm.ptr, !llvm.ptr, i32
    omp.atomic.read %1 = %3 : !llvm.ptr, !llvm.ptr, f64
    omp.atomic.read %1 = %7 : !llvm.ptr, !llvm.ptr, i32
    omp.atomic.read %7 = %3 : !llvm.ptr, !llvm.ptr, f64
    omp.atomic.read %7 = %1 : !llvm.ptr, !llvm.ptr, f32
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_atomic_write(%arg0: !llvm.ptr, %arg1: i32) {
    omp.atomic.write %arg0 = %arg1 : !llvm.ptr, i32
    omp.atomic.write %arg0 = %arg1 memory_order(seq_cst) : !llvm.ptr, i32
    omp.atomic.write %arg0 = %arg1 memory_order(release) : !llvm.ptr, i32
    omp.atomic.write %arg0 = %arg1 memory_order(relaxed) : !llvm.ptr, i32
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_atomic_update(%arg0: !llvm.ptr, %arg1: i32, %arg2: !llvm.ptr, %arg3: i1) {
    omp.atomic.update %arg0 : !llvm.ptr {
    ^bb0(%arg4: i32):
      %0 = llvm.mul %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update %arg0 : !llvm.ptr {
    ^bb0(%arg4: i32):
      %0 = llvm.add %arg4, %arg1 : i32
      omp.yield(%0 : i32)
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_atomic_write() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x f32 {bindc_name = "x"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x f32 {bindc_name = "r1"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.alloca %4 x !llvm.struct<(f32, f32)> {bindc_name = "c1"} : (i64) -> !llvm.ptr
    %6 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    %7 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %8 = llvm.mlir.constant(1 : i64) : i64
    %9 = llvm.mlir.constant(1 : i64) : i64
    %10 = llvm.mlir.constant(1 : i64) : i64
    %11 = llvm.load %3 : !llvm.ptr -> f32
    %12 = llvm.mlir.undef : !llvm.struct<(f32, f32)>
    %13 = llvm.insertvalue %11, %12[0] : !llvm.struct<(f32, f32)> 
    %14 = llvm.insertvalue %7, %13[1] : !llvm.struct<(f32, f32)> 
    omp.atomic.write %5 = %14 : !llvm.ptr, !llvm.struct<(f32, f32)>
    %15 = llvm.mlir.undef : !llvm.struct<(f32, f32)>
    %16 = llvm.insertvalue %6, %15[0] : !llvm.struct<(f32, f32)> 
    %17 = llvm.insertvalue %6, %16[1] : !llvm.struct<(f32, f32)> 
    omp.atomic.write %5 = %17 : !llvm.ptr, !llvm.struct<(f32, f32)>
    llvm.return
  }
}

// -----
module {
  llvm.func @_QPomp_atomic_update_complex() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(f32, f32)> {bindc_name = "ib"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x !llvm.struct<(f32, f32)> {bindc_name = "ia"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    %5 = llvm.mlir.undef : !llvm.struct<(f32, f32)>
    %6 = llvm.insertvalue %4, %5[0] : !llvm.struct<(f32, f32)> 
    %7 = llvm.insertvalue %4, %6[1] : !llvm.struct<(f32, f32)> 
    omp.atomic.update %3 : !llvm.ptr {
    ^bb0(%arg0: !llvm.struct<(f32, f32)>):
      %8 = llvm.extractvalue %arg0[0] : !llvm.struct<(f32, f32)> 
      %9 = llvm.extractvalue %arg0[1] : !llvm.struct<(f32, f32)> 
      %10 = llvm.extractvalue %7[0] : !llvm.struct<(f32, f32)> 
      %11 = llvm.extractvalue %7[1] : !llvm.struct<(f32, f32)> 
      %12 = llvm.fadd %8, %10 {fastmathFlags = #llvm.fastmath<contract>} : f32
      %13 = llvm.fadd %9, %11 {fastmathFlags = #llvm.fastmath<contract>} : f32
      %14 = llvm.mlir.undef : !llvm.struct<(f32, f32)>
      %15 = llvm.insertvalue %12, %14[0] : !llvm.struct<(f32, f32)> 
      %16 = llvm.insertvalue %13, %15[1] : !llvm.struct<(f32, f32)> 
      omp.yield(%16 : !llvm.struct<(f32, f32)>)
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @_QPomp_atomic_capture_complex() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(f32, f32)> {bindc_name = "ib"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x !llvm.struct<(f32, f32)> {bindc_name = "ia"} : (i64) -> !llvm.ptr
    %4 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    %5 = llvm.mlir.constant(2.000000e+00 : f32) : f32
    %6 = llvm.mlir.undef : !llvm.struct<(f32, f32)>
    %7 = llvm.insertvalue %5, %6[0] : !llvm.struct<(f32, f32)> 
    %8 = llvm.insertvalue %5, %7[1] : !llvm.struct<(f32, f32)> 
    llvm.store %8, %3 : !llvm.struct<(f32, f32)>, !llvm.ptr
    %9 = llvm.mlir.undef : !llvm.struct<(f32, f32)>
    %10 = llvm.insertvalue %4, %9[0] : !llvm.struct<(f32, f32)> 
    %11 = llvm.insertvalue %4, %10[1] : !llvm.struct<(f32, f32)> 
    omp.atomic.capture {
      omp.atomic.update %3 : !llvm.ptr {
      ^bb0(%arg0: !llvm.struct<(f32, f32)>):
        %12 = llvm.extractvalue %arg0[0] : !llvm.struct<(f32, f32)> 
        %13 = llvm.extractvalue %arg0[1] : !llvm.struct<(f32, f32)> 
        %14 = llvm.extractvalue %11[0] : !llvm.struct<(f32, f32)> 
        %15 = llvm.extractvalue %11[1] : !llvm.struct<(f32, f32)> 
        %16 = llvm.fadd %12, %14 {fastmathFlags = #llvm.fastmath<contract>} : f32
        %17 = llvm.fadd %13, %15 {fastmathFlags = #llvm.fastmath<contract>} : f32
        %18 = llvm.mlir.undef : !llvm.struct<(f32, f32)>
        %19 = llvm.insertvalue %16, %18[0] : !llvm.struct<(f32, f32)> 
        %20 = llvm.insertvalue %17, %19[1] : !llvm.struct<(f32, f32)> 
        omp.yield(%20 : !llvm.struct<(f32, f32)>)
      }
      omp.atomic.read %1 = %3 : !llvm.ptr, !llvm.ptr, !llvm.struct<(f32, f32)>
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_atomic_read_complex() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(f32, f32)> {bindc_name = "ib"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x !llvm.struct<(f32, f32)> {bindc_name = "ia"} : (i64) -> !llvm.ptr
    omp.atomic.read %1 = %3 : !llvm.ptr, !llvm.ptr, !llvm.struct<(f32, f32)>
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_atomic_update_ordering(%arg0: !llvm.ptr, %arg1: i32) {
    omp.atomic.update %arg0 : !llvm.ptr {
    ^bb0(%arg2: i32):
      %0 = llvm.shl %arg1, %arg2 : i32
      omp.yield(%0 : i32)
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_atomic_update_ordering(%arg0: !llvm.ptr, %arg1: i32) {
    omp.atomic.update %arg0 : !llvm.ptr {
    ^bb0(%arg2: i32):
      %0 = llvm.shl %arg2, %arg1 : i32
      omp.yield(%0 : i32)
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_atomic_update_intrinsic(%arg0: !llvm.ptr, %arg1: i32) {
    omp.atomic.update %arg0 : !llvm.ptr {
    ^bb0(%arg2: i32):
      %0 = llvm.intr.smax(%arg2, %arg1) : (i32, i32) -> i32
      omp.yield(%0 : i32)
    }
    omp.atomic.update %arg0 : !llvm.ptr {
    ^bb0(%arg2: i32):
      %0 = llvm.intr.umax(%arg2, %arg1) : (i32, i32) -> i32
      omp.yield(%0 : i32)
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @atomic_update_cmpxchg(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = llvm.load %arg1 : !llvm.ptr -> f32
    omp.atomic.update %arg0 : !llvm.ptr {
    ^bb0(%arg2: i32):
      %1 = llvm.sitofp %arg2 : i32 to f32
      %2 = llvm.fadd %1, %0 : f32
      %3 = llvm.fptosi %2 : f32 to i32
      omp.yield(%3 : i32)
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_atomic_capture_prefix_update(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i32, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: f32) {
    omp.atomic.capture {
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.add %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    }
    omp.atomic.capture {
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.sub %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    }
    omp.atomic.capture {
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.and %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    }
    omp.atomic.capture {
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.or %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    }
    omp.atomic.capture {
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.xor %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    }
    omp.atomic.capture {
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.mul %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    }
    omp.atomic.capture {
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.sdiv %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    }
    omp.atomic.capture {
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.udiv %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    }
    omp.atomic.capture {
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.shl %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    }
    omp.atomic.capture {
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.lshr %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    }
    omp.atomic.capture {
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.ashr %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    }
    omp.atomic.capture {
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.intr.smax(%arg6, %arg2) : (i32, i32) -> i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    }
    omp.atomic.capture {
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.intr.smin(%arg6, %arg2) : (i32, i32) -> i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    }
    omp.atomic.capture {
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.intr.umax(%arg6, %arg2) : (i32, i32) -> i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    }
    omp.atomic.capture {
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.intr.umin(%arg6, %arg2) : (i32, i32) -> i32
        omp.yield(%0 : i32)
      }
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    }
    omp.atomic.capture {
      omp.atomic.update %arg3 : !llvm.ptr {
      ^bb0(%arg6: f32):
        %0 = llvm.fadd %arg6, %arg5 : f32
        omp.yield(%0 : f32)
      }
      omp.atomic.read %arg4 = %arg3 : !llvm.ptr, !llvm.ptr, f32
    }
    omp.atomic.capture {
      omp.atomic.update %arg3 : !llvm.ptr {
      ^bb0(%arg6: f32):
        %0 = llvm.fsub %arg6, %arg5 : f32
        omp.yield(%0 : f32)
      }
      omp.atomic.read %arg4 = %arg3 : !llvm.ptr, !llvm.ptr, f32
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_atomic_capture_postfix_update(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i32, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: f32) {
    omp.atomic.capture {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.add %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.sub %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.and %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.or %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.xor %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.mul %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.sdiv %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.udiv %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.shl %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.lshr %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.ashr %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.intr.smax(%arg6, %arg2) : (i32, i32) -> i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.intr.smin(%arg6, %arg2) : (i32, i32) -> i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.intr.umax(%arg6, %arg2) : (i32, i32) -> i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.intr.umin(%arg6, %arg2) : (i32, i32) -> i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg4 = %arg3 : !llvm.ptr, !llvm.ptr, f32
      omp.atomic.update %arg3 : !llvm.ptr {
      ^bb0(%arg6: f32):
        %0 = llvm.fadd %arg6, %arg5 : f32
        omp.yield(%0 : f32)
      }
    }
    omp.atomic.capture {
      omp.atomic.read %arg4 = %arg3 : !llvm.ptr, !llvm.ptr, f32
      omp.atomic.update %arg3 : !llvm.ptr {
      ^bb0(%arg6: f32):
        %0 = llvm.fsub %arg6, %arg5 : f32
        omp.yield(%0 : f32)
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_atomic_capture_misc(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i32, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: f32) {
    omp.atomic.capture {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.write %arg0 = %arg2 : !llvm.ptr, i32
    }
    omp.atomic.capture {
      omp.atomic.read %arg4 = %arg3 : !llvm.ptr, !llvm.ptr, f32
      omp.atomic.write %arg3 = %arg5 : !llvm.ptr, f32
    }
    omp.atomic.capture memory_order(seq_cst) {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.add %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture memory_order(acquire) {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.add %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture memory_order(release) {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.add %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture memory_order(relaxed) {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.add %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    omp.atomic.capture memory_order(acq_rel) {
      omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg0 : !llvm.ptr {
      ^bb0(%arg6: i32):
        %0 = llvm.add %arg6, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_sections_empty() {
    omp.sections {
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_sections_trivial() {
    omp.sections {
      omp.section {
        omp.terminator
      }
      omp.section {
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @foo()
  llvm.func @bar(i32)
  llvm.func @omp_sections(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr) {
    omp.sections {
      omp.section {
        llvm.call @foo() : () -> ()
        omp.terminator
      }
      omp.section {
        llvm.call @bar(%arg0) : (i32) -> ()
        omp.terminator
      }
      omp.section {
        %0 = llvm.add %arg0, %arg1 : i32
        llvm.store %0, %arg2 : i32, !llvm.ptr
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @foo()
  llvm.func @omp_sections_with_clauses() {
    omp.sections nowait {
      omp.section {
        llvm.call @foo() : () -> ()
        omp.terminator
      }
      omp.section {
        llvm.call @foo() : () -> ()
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @repeated_successor(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i1) {
    omp.wsloop {
      omp.loop_nest (%arg4) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.cond_br %arg3, ^bb1(%arg0 : i64), ^bb1(%arg1 : i64)
      ^bb1(%0: i64):  // 2 preds: ^bb0, ^bb0
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @single(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr) {
    %0 = llvm.sub %arg0, %arg1 : i32
    llvm.store %0, %arg2 : i32, !llvm.ptr
    omp.single {
      %2 = llvm.add %arg0, %arg1 : i32
      llvm.store %2, %arg2 : i32, !llvm.ptr
      omp.terminator
    }
    %1 = llvm.mul %arg0, %arg1 : i32
    llvm.store %1, %arg2 : i32, !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @single_nowait(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr) {
    %0 = llvm.sub %arg0, %arg1 : i32
    llvm.store %0, %arg2 : i32, !llvm.ptr
    omp.single nowait {
      %2 = llvm.add %arg0, %arg1 : i32
      llvm.store %2, %arg2 : i32, !llvm.ptr
      omp.terminator
    }
    %1 = llvm.mul %arg0, %arg1 : i32
    llvm.store %1, %arg2 : i32, !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @copy_i32(!llvm.ptr, !llvm.ptr)
  llvm.func @copy_f32(!llvm.ptr, !llvm.ptr)
  llvm.func @single_copyprivate(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    omp.single copyprivate(%arg0 -> @copy_i32 : !llvm.ptr, %arg1 -> @copy_f32 : !llvm.ptr) {
      %0 = llvm.load %arg0 : !llvm.ptr -> i32
      %1 = llvm.add %0, %0 : i32
      llvm.store %1, %arg0 : i32, !llvm.ptr
      %2 = llvm.load %arg1 : !llvm.ptr -> f32
      %3 = llvm.fadd %2, %2 : f32
      llvm.store %3, %arg1 : f32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_threadprivate() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(2 : i32) : i32
    %2 = llvm.mlir.constant(3 : i32) : i32
    %3 = llvm.mlir.addressof @_QFsubEx : !llvm.ptr
    %4 = omp.threadprivate %3 : !llvm.ptr -> !llvm.ptr
    llvm.store %0, %4 : i32, !llvm.ptr
    omp.parallel {
      %5 = omp.threadprivate %3 : !llvm.ptr -> !llvm.ptr
      llvm.store %1, %5 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.store %2, %4 : i32, !llvm.ptr
    llvm.return
  }
  llvm.mlir.global internal @_QFsubEx() {addr_space = 0 : i32} : i32
}

// -----
module {
  llvm.func @omp_task_detach(%arg0: !llvm.ptr) {
    omp.task detach(%arg0 : !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_task(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr) {
    omp.task {
      %0 = llvm.mlir.constant(1 : i64) : i64
      %1 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr
      %2 = llvm.load %1 : !llvm.ptr -> i32
      %3 = llvm.add %2, %2 : i32
      llvm.store %3, %1 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_task_attrs() attributes {target_cpu = "x86-64", target_features = #llvm.target_features<["+mmx", "+sse"]>} {
    omp.task {
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
}

// -----
module {
}

// -----
module {
}

// -----
module {
}

// -----
module {
  llvm.func @omp_task_with_deps(%arg0: !llvm.ptr) {
    omp.task depend(taskdependin -> %arg0 : !llvm.ptr) {
      %0 = llvm.mlir.constant(1 : i64) : i64
      %1 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr
      %2 = llvm.load %1 : !llvm.ptr -> i32
      %3 = llvm.add %2, %2 : i32
      llvm.store %3, %1 : i32, !llvm.ptr
      omp.terminator
    }
    omp.task depend(taskdependout -> %arg0 : !llvm.ptr) {
      omp.terminator
    }
    omp.task depend(taskdependinout -> %arg0 : !llvm.ptr) {
      omp.terminator
    }
    omp.task depend(taskdependmutexinoutset -> %arg0 : !llvm.ptr) {
      omp.terminator
    }
    omp.task depend(taskdependinoutset -> %arg0 : !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

// -----
module attributes {llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  llvm.func @omp_task(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr) {
    %0 = llvm.sub %arg0, %arg1 : i32
    llvm.store %0, %arg2 : i32, !llvm.ptr
    omp.task {
      %2 = llvm.add %arg0, %arg1 : i32
      llvm.store %2, %arg2 : i32, !llvm.ptr
      omp.terminator
    }
    %1 = llvm.mul %arg0, %arg1 : i32
    llvm.store %1, %arg2 : i32, !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @par_task_(%arg0: !llvm.ptr {fir.bindc_name = "a"}) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    omp.task {
      omp.parallel {
        llvm.store %0, %arg0 : i32, !llvm.ptr
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @foo(!llvm.ptr)
  llvm.func @destroy(!llvm.ptr)
  omp.private {type = firstprivate} @privatizer : i32 copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> i32
    llvm.store %0, %arg1 : i32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  } dealloc {
  ^bb0(%arg0: !llvm.ptr):
    llvm.call @destroy(%arg0) : (!llvm.ptr) -> ()
    omp.yield
  }
  llvm.func @task(%arg0: !llvm.ptr) {
    omp.task private(@privatizer %arg0 -> %arg1 : !llvm.ptr) {
      llvm.call @foo(%arg1) : (!llvm.ptr) -> ()
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @foo()
  llvm.func @omp_taskgroup(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr) {
    omp.taskgroup {
      llvm.call @foo() : () -> ()
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @foo()
  llvm.func @bar(i32, i32, !llvm.ptr)
  llvm.func @omp_taskgroup_task(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr) {
    omp.taskgroup {
      %0 = llvm.mlir.constant(1 : i64) : i32
      %1 = llvm.alloca %0 x i8 : (i32) -> !llvm.ptr
      omp.task {
        llvm.call @foo() : () -> ()
        omp.terminator
      }
      omp.task {
        llvm.call @bar(%arg0, %arg1, %arg2) : (i32, i32, !llvm.ptr) -> ()
        omp.terminator
      }
      llvm.br ^bb1
    ^bb1:  // pred: ^bb0
      llvm.call @foo() : () -> ()
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @test_01() attributes {sym_visibility = "private"}
  llvm.func @test_02() attributes {sym_visibility = "private"}
  llvm.func @_QPomp_task_priority() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "x"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(4 : i32) : i32
    %3 = llvm.mlir.constant(true) : i1
    %4 = llvm.load %1 : !llvm.ptr -> i32
    omp.task priority(%4 : i32) {
      llvm.call @test_01() : () -> ()
      omp.terminator
    }
    omp.task final(%3) priority(%2 : i32) {
      llvm.call @test_02() : () -> ()
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_opaque_pointers(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i32) {
    omp.atomic.read %arg1 = %arg0 : !llvm.ptr, !llvm.ptr, i32
    omp.atomic.capture memory_order(acq_rel) {
      omp.atomic.read %arg0 = %arg1 : !llvm.ptr, !llvm.ptr, i32
      omp.atomic.update %arg1 : !llvm.ptr {
      ^bb0(%arg3: i32):
        %0 = llvm.add %arg3, %arg2 : i32
        omp.yield(%0 : i32)
      }
    }
    llvm.return
  }
}

// -----
module attributes {omp.flags = #omp.flags<debug_kind = 1, assume_teams_oversubscription = true, assume_threads_oversubscription = true, assume_no_thread_state = true, assume_no_nested_parallelism = true>} {
}

// -----
module attributes {omp.flags = #omp.flags<>} {
}

// -----
module attributes {omp.flags = #omp.flags<openmp_device_version = 51>} {
}

// -----
module attributes {omp.flags = #omp.flags<>, omp.version = #omp.version<version = 50>} {
}

// -----
module attributes {omp.version = #omp.version<version = 51>} {
}

// -----
module attributes {omp.flags = #omp.flags<>} {
}

// -----
module attributes {omp.flags = #omp.flags<assume_teams_oversubscription = true, assume_no_thread_state = true>} {
}

// -----
module attributes {omp.flags = #omp.flags<assume_teams_oversubscription = true, assume_no_thread_state = true, no_gpu_lib = true>} {
}

// -----
module attributes {omp.is_target_device = false} {
  llvm.func @filter_nohost() attributes {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (to)>} {
    llvm.return
  }
  llvm.func @filter_host() attributes {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} {
    llvm.return
  }
}

// -----
module attributes {omp.is_target_device = false} {
  llvm.func @filter_nohost() attributes {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (enter)>} {
    llvm.return
  }
  llvm.func @filter_host() attributes {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (enter)>} {
    llvm.return
  }
}

// -----
module attributes {omp.is_target_device = true} {
  llvm.func @filter_nohost() attributes {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (to)>} {
    llvm.return
  }
  llvm.func @filter_host() attributes {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} {
    llvm.return
  }
}

// -----
module attributes {omp.is_target_device = true} {
  llvm.func @filter_nohost() attributes {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (enter)>} {
    llvm.return
  }
  llvm.func @filter_host() attributes {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (enter)>} {
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_task_untied() {
    omp.task untied {
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @omp_task_mergeable() {
    omp.task mergeable {
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @foo_before()
  llvm.func @foo()
  llvm.func @foo_after()
  llvm.func @omp_task_final(%arg0: i1) {
    llvm.call @foo_before() : () -> ()
    omp.task final(%arg0) {
      llvm.call @foo() : () -> ()
      omp.terminator
    }
    llvm.call @foo_after() : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @foo_before()
  llvm.func @foo()
  llvm.func @foo_after()
  llvm.func @omp_task_if(%arg0: i1) {
    llvm.call @foo_before() : () -> ()
    omp.task if(%arg0) {
      llvm.call @foo() : () -> ()
      omp.terminator
    }
    llvm.call @foo_after() : () -> ()
    llvm.return
  }
}

// -----
module attributes {omp.requires = #omp<clause_requires reverse_offload|unified_shared_memory>} {
}

// -----
module {
  llvm.func @distribute() {
    %0 = llvm.mlir.constant(42 : index) : i64
    %1 = llvm.mlir.constant(10 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    omp.distribute {
      omp.loop_nest (%arg0) : i64 = (%1) to (%0) step (%2) {
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @distribute_wsloop(%arg0: i32, %arg1: i32, %arg2: i32) {
    omp.parallel {
      omp.distribute {
        omp.wsloop {
          omp.loop_nest (%arg3) : i32 = (%arg0) to (%arg1) step (%arg2) {
            omp.yield
          }
        } {omp.composite}
      } {omp.composite}
      omp.terminator
    } {omp.composite}
    llvm.return
  }
}

// -----
module {
  omp.private {type = private} @_QFEx_private_i32 : i32
  llvm.func @nested_task_with_deps() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "x"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    omp.parallel private(@_QFEx_private_i32 %1 -> %arg0 : !llvm.ptr) {
      omp.task depend(taskdependout -> %arg0 : !llvm.ptr) {
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

