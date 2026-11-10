module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr = dense<64> : vector<4xi64>, !llvm.ptr<1> = dense<64> : vector<4xi64>, !llvm.ptr<2> = dense<32> : vector<4xi64>, !llvm.ptr<3> = dense<32> : vector<4xi64>, !llvm.ptr<4> = dense<64> : vector<4xi64>, !llvm.ptr<5> = dense<32> : vector<4xi64>, !llvm.ptr<6> = dense<32> : vector<4xi64>, !llvm.ptr<7> = dense<[160, 256, 256, 32]> : vector<4xi64>, !llvm.ptr<8> = dense<[128, 128, 128, 48]> : vector<4xi64>, !llvm.ptr<9> = dense<[192, 256, 256, 32]> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.legal_int_widths" = array<i32: 32, 64>, "dlti.stack_alignment" = 32 : i64, "dlti.alloca_memory_space" = 5 : ui64, "dlti.global_memory_space" = 1 : ui64>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} {
  omp.private {type = private} @simple_var.privatizer : i32
  omp.declare_reduction @simple_var.reducer : i32 init {
  ^bb0(%arg0: i32):
    %0 = llvm.mlir.constant(0 : i32) : i32
    omp.yield(%0 : i32)
  } combiner {
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = llvm.add %arg0, %arg1 : i32
    omp.yield(%0 : i32)
  }
  llvm.func @device_func(!llvm.ptr) attributes {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (to)>}
  llvm.func @target_map_single_shared_mem_private() attributes {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    omp.target kernel_type(generic) private(@simple_var.privatizer %2 -> %arg0 : !llvm.ptr) {
      llvm.call @device_func(%arg0) : (!llvm.ptr) -> ()
      omp.terminator
    }
    omp.target kernel_type(generic) private(@simple_var.privatizer %2 -> %arg0 : !llvm.ptr) {
      omp.parallel reduction(@simple_var.reducer %arg0 -> %arg1 : !llvm.ptr) {
        %3 = llvm.load %arg1 : !llvm.ptr -> i32
        omp.terminator
      }
      omp.terminator
    }
    omp.target kernel_type(generic) private(@simple_var.privatizer %2 -> %arg0 : !llvm.ptr) {
      omp.parallel {
        %3 = llvm.load %arg0 : !llvm.ptr -> i32
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

