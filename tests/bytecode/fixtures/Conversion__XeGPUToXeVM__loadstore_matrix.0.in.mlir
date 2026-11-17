"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel", targets = [#xevm.target<chip = "pvc">]}> ({
    "gpu.func"() <{function_type = (memref<4096xi8, 3>) -> f32}> ({
    ^bb0(%arg9: memref<4096xi8, 3> loc("<stdin>":4:10)):
      %35 = "xegpu.create_mem_desc"(%arg9) : (memref<4096xi8, 3>) -> !xegpu.mem_desc<32x32xf32> loc("<stdin>":5:13)
      %36 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":6:13)
      %37 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:13)
      %38 = "xegpu.load_matrix"(%35, %37, %36) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.mem_desc<32x32xf32>, index, index) -> f32 loc("<stdin>":8:13)
      "xegpu.store_matrix"(%38, %35, %37, %36) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (f32, !xegpu.mem_desc<32x32xf32>, index, index) -> () loc("<stdin>":9:7)
      "gpu.return"(%38) : (f32) -> () loc("<stdin>":10:7)
    }) {sym_name = "load_store_matrix_plain"} : () -> () loc("<stdin>":3:5)
    "gpu.func"() <{function_type = (memref<1024xi8, 3>) -> f32}> ({
    ^bb0(%arg8: memref<1024xi8, 3> loc("<stdin>":13:10)):
      %29 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":14:13)
      %30 = "memref.view"(%arg8, %29) : (memref<1024xi8, 3>, index) -> memref<64x32xf32, 3> loc("<stdin>":15:13)
      %31 = "memref.subview"(%30) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 32, 0>, static_sizes = array<i64: 32, 32>, static_strides = array<i64: 1, 1>}> : (memref<64x32xf32, 3>) -> memref<32x32xf32, strided<[32, 1], offset: 1024>, 3> loc("<stdin>":16:13)
      %32 = "xegpu.create_mem_desc"(%31) : (memref<32x32xf32, strided<[32, 1], offset: 1024>, 3>) -> !xegpu.mem_desc<32x32xf32> loc("<stdin>":17:13)
      %33 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":18:13)
      %34 = "xegpu.load_matrix"(%32, %29, %33) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.mem_desc<32x32xf32>, index, index) -> f32 loc("<stdin>":19:13)
      "xegpu.store_matrix"(%34, %32, %29, %33) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (f32, !xegpu.mem_desc<32x32xf32>, index, index) -> () loc("<stdin>":20:7)
      "gpu.return"(%34) : (f32) -> () loc("<stdin>":21:7)
    }) {sym_name = "load_store_matrix_plain_2d_input"} : () -> () loc("<stdin>":12:5)
    "gpu.func"() <{function_type = (memref<4096xi8, 3>) -> f16}> ({
    ^bb0(%arg7: memref<4096xi8, 3> loc("<stdin>":24:10)):
      %25 = "xegpu.create_mem_desc"(%arg7) : (memref<4096xi8, 3>) -> !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16], stride = [1, 32]>> loc("<stdin>":25:13)
      %26 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":26:13)
      %27 = "arith.constant"() <{value = 13 : index}> : () -> index loc("<stdin>":27:13)
      %28 = "xegpu.load_matrix"(%25, %27, %26) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16], stride = [1, 32]>>, index, index) -> f16 loc("<stdin>":28:13)
      "xegpu.store_matrix"(%28, %25, %27, %26) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (f16, !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16], stride = [1, 32]>>, index, index) -> () loc("<stdin>":29:7)
      "gpu.return"(%28) : (f16) -> () loc("<stdin>":30:7)
    }) {sym_name = "load_store_matrix_blocked_strided"} : () -> () loc("<stdin>":23:5)
    "gpu.func"() <{function_type = (memref<4096xi8, 3>) -> f16}> ({
    ^bb0(%arg6: memref<4096xi8, 3> loc("<stdin>":33:10)):
      %21 = "xegpu.create_mem_desc"(%arg6) : (memref<4096xi8, 3>) -> !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>> loc("<stdin>":34:13)
      %22 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":35:13)
      %23 = "arith.constant"() <{value = 19 : index}> : () -> index loc("<stdin>":36:13)
      %24 = "xegpu.load_matrix"(%21, %23, %22) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>>, index, index) -> f16 loc("<stdin>":37:13)
      "xegpu.store_matrix"(%24, %21, %23, %22) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (f16, !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>>, index, index) -> () loc("<stdin>":38:7)
      "gpu.return"(%24) : (f16) -> () loc("<stdin>":39:7)
    }) {sym_name = "load_store_matrix_blocked_nostride"} : () -> () loc("<stdin>":32:5)
    "gpu.func"() <{function_type = (memref<4096xi8, 3>) -> vector<8xf16>}> ({
    ^bb0(%arg5: memref<4096xi8, 3> loc("<stdin>":42:10)):
      %17 = "xegpu.create_mem_desc"(%arg5) : (memref<4096xi8, 3>) -> !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16], stride = [1, 32]>> loc("<stdin>":43:13)
      %18 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":44:13)
      %19 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":45:13)
      %20 = "xegpu.load_matrix"(%17, %19, %18) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16], stride = [1, 32]>>, index, index) -> vector<8xf16> loc("<stdin>":46:13)
      "xegpu.store_matrix"(%20, %17, %19, %18) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<8xf16>, !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16], stride = [1, 32]>>, index, index) -> () loc("<stdin>":47:7)
      "gpu.return"(%20) : (vector<8xf16>) -> () loc("<stdin>":48:7)
    }) {sym_name = "load_store_matrix_blocked_strided_return_vector"} : () -> () loc("<stdin>":41:5)
    "gpu.func"() <{function_type = (memref<4096xi8, 3>) -> vector<8xf16>}> ({
    ^bb0(%arg4: memref<4096xi8, 3> loc("<stdin>":51:10)):
      %13 = "xegpu.create_mem_desc"(%arg4) : (memref<4096xi8, 3>) -> !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>> loc("<stdin>":52:13)
      %14 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":53:13)
      %15 = "arith.constant"() <{value = 48 : index}> : () -> index loc("<stdin>":54:13)
      %16 = "xegpu.load_matrix"(%13, %14, %15) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, subgroup_block_io}> : (!xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>>, index, index) -> vector<8xf16> loc("<stdin>":55:13)
      "xegpu.store_matrix"(%16, %13, %14, %15) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, subgroup_block_io}> : (vector<8xf16>, !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>>, index, index) -> () loc("<stdin>":56:7)
      "gpu.return"(%16) : (vector<8xf16>) -> () loc("<stdin>":57:7)
    }) {sym_name = "load_store_matrix_blocked_subgroupblockio"} : () -> () loc("<stdin>":50:5)
    "gpu.func"() <{function_type = (!xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>>) -> ()}> ({
    ^bb0(%arg3: !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>> loc("<stdin>":60:10)):
      %11 = "xegpu.load_matrix"(%arg3) <{const_offsets = array<i64: 16, 0>}> : (!xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>>) -> vector<1x16xf16> loc("<stdin>":61:13)
      %12 = "arith.addf"(%11, %11) <{fastmath = #arith.fastmath<none>}> : (vector<1x16xf16>, vector<1x16xf16>) -> vector<1x16xf16> loc("<stdin>":62:13)
      "xegpu.store_matrix"(%12, %arg3) <{const_offsets = array<i64: 16, 0>}> : (vector<1x16xf16>, !xegpu.mem_desc<32x64xf16, #xegpu.mem_layout<block = [16, 16]>>) -> () loc("<stdin>":63:7)
      "gpu.return"() : () -> () loc("<stdin>":64:7)
    }) {sym_name = "matrix_vector_materialization"} : () -> () loc("<stdin>":59:5)
    "gpu.func"() <{function_type = (memref<256x16xbf16, 3>) -> vector<1x16xbf16>}> ({
    ^bb0(%arg2: memref<256x16xbf16, 3> loc("<stdin>":67:10)):
      %7 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":68:12)
      %8 = "memref.subview"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 64, 0>, static_sizes = array<i64: 1, 16>, static_strides = array<i64: 1, 1>}> : (memref<256x16xbf16, 3>) -> memref<1x16xbf16, strided<[16, 1], offset: 1024>, 3> loc("<stdin>":69:12)
      %9 = "xegpu.create_mem_desc"(%8) : (memref<1x16xbf16, strided<[16, 1], offset: 1024>, 3>) -> !xegpu.mem_desc<1x16xbf16> loc("<stdin>":70:12)
      %10 = "xegpu.load_matrix"(%9, %7, %7) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.mem_desc<1x16xbf16>, index, index) -> vector<1x16xbf16> loc("<stdin>":71:13)
      "gpu.return"(%10) : (vector<1x16xbf16>) -> () loc("<stdin>":72:7)
    }) {sym_name = "create_memdesc_from_subview"} : () -> () loc("<stdin>":66:5)
    "gpu.func"() <{function_type = (memref<1024xi8, 3>) -> vector<1x1xf8E8M0FNU>}> ({
    ^bb0(%arg1: memref<1024xi8, 3> loc("<stdin>":75:10)):
      %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":76:12)
      %4 = "xegpu.create_mem_desc"(%arg1) : (memref<1024xi8, 3>) -> !xegpu.mem_desc<32x32xf8E8M0FNU> loc("<stdin>":77:12)
      %5 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":78:12)
      %6 = "xegpu.load_matrix"(%4, %3, %5) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.mem_desc<32x32xf8E8M0FNU>, index, index) -> vector<1x1xf8E8M0FNU> loc("<stdin>":79:12)
      "gpu.return"(%6) : (vector<1x1xf8E8M0FNU>) -> () loc("<stdin>":80:7)
    }) {sym_name = "load_matrix_f8e8m0_scalar"} : () -> () loc("<stdin>":74:5)
    "gpu.func"() <{function_type = (memref<1024xi8, 3>) -> vector<8xf8E8M0FNU>}> ({
    ^bb0(%arg0: memref<1024xi8, 3> loc("<stdin>":83:10)):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":84:12)
      %1 = "xegpu.create_mem_desc"(%arg0) : (memref<1024xi8, 3>) -> !xegpu.mem_desc<32x32xf8E8M0FNU> loc("<stdin>":85:12)
      %2 = "xegpu.load_matrix"(%1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.mem_desc<32x32xf8E8M0FNU>, index, index) -> vector<8xf8E8M0FNU> loc("<stdin>":86:12)
      "gpu.return"(%2) : (vector<8xf8E8M0FNU>) -> () loc("<stdin>":87:7)
    }) {sym_name = "load_matrix_f8e8m0_vector"} : () -> () loc("<stdin>":82:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
