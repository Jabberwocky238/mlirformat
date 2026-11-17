"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "simple_var.privatizer", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "omp.declare_reduction"() <{sym_name = "simple_var.reducer", type = i32}> ({
  }, {
  ^bb0(%arg6: i32 loc("<stdin>":8:8)):
    %6 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":9:10)
    "omp.yield"(%6) : (i32) -> () loc("<stdin>":10:5)
  }, {
  ^bb0(%arg4: i32 loc("<stdin>":12:8), %arg5: i32 loc("<stdin>":12:20)):
    %5 = "llvm.add"(%arg4, %arg5) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":13:10)
    "omp.yield"(%5) : (i32) -> () loc("<stdin>":14:5)
  }, {
  }, {
  }, {
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "device_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (to)>} : () -> () loc("<stdin>":19:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "target_map_single_shared_mem_private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":22:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr<5> loc("<stdin>":23:10)
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr loc("<stdin>":24:10)
    "omp.target"(%2) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_maps = array<i64: -1>, private_syms = [@simple_var.privatizer]}> ({
    ^bb0(%arg3: !llvm.ptr loc("<stdin>":26:10)):
      "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @device_func, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":27:7)
      "omp.terminator"() : () -> () loc("<stdin>":28:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":25:5)
    "omp.target"(%2) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_maps = array<i64: -1>, private_syms = [@simple_var.privatizer]}> ({
    ^bb0(%arg1: !llvm.ptr loc("<stdin>":31:10)):
      "omp.parallel"(%arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_syms = [@simple_var.reducer]}> ({
      ^bb0(%arg2: !llvm.ptr loc("<stdin>":33:12)):
        %4 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":34:14)
        "omp.terminator"() : () -> () loc("<stdin>":35:9)
      }) : (!llvm.ptr) -> () loc("<stdin>":32:7)
      "omp.terminator"() : () -> () loc("<stdin>":37:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":30:5)
    "omp.target"(%2) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_maps = array<i64: -1>, private_syms = [@simple_var.privatizer]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":40:10)):
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        %3 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":42:14)
        "omp.terminator"() : () -> () loc("<stdin>":43:9)
      }) : () -> () loc("<stdin>":41:7)
      "omp.terminator"() : () -> () loc("<stdin>":45:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":39:5)
    "llvm.return"() : () -> () loc("<stdin>":47:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> () loc("<stdin>":21:3)
}) {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr = dense<64> : vector<4xi64>, !llvm.ptr<1> = dense<64> : vector<4xi64>, !llvm.ptr<2> = dense<32> : vector<4xi64>, !llvm.ptr<3> = dense<32> : vector<4xi64>, !llvm.ptr<4> = dense<64> : vector<4xi64>, !llvm.ptr<5> = dense<32> : vector<4xi64>, !llvm.ptr<6> = dense<32> : vector<4xi64>, !llvm.ptr<7> = dense<[160, 256, 256, 32]> : vector<4xi64>, !llvm.ptr<8> = dense<[128, 128, 128, 48]> : vector<4xi64>, !llvm.ptr<9> = dense<[192, 256, 256, 32]> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.legal_int_widths" = array<i32: 32, 64>, "dlti.stack_alignment" = 32 : i64, "dlti.alloca_memory_space" = 5 : ui64, "dlti.global_memory_space" = 1 : ui64>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> () loc("<stdin>":1:1)
