#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 64 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : dense, d1 : dense) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense), posWidth = 32, crdWidth = 64 }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense), posWidth = 32, crdWidth = 64 }>
#sparse6 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 64 }>
#sparse7 = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : batch, d1 : batch, d2 : dense, d3 : compressed) }>
#sparse8 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed), posWidth = 32, crdWidth = 64 }>
#sparse9 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed(nonunique), d2 : singleton) }>
#sparse10 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
#sparse11 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse12 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed(nonordered)) }>
#sparse13 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed(nonunique), d0 : singleton(nonordered)) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>, sym_name = "sparse_nop"}> ({
  ^bb0(%arg58: tensor<?xf64, #sparse>):
    "func.return"(%arg58) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse1>, sym_name = "sparse_nop_aos_coo"}> ({
  ^bb0(%arg57: tensor<?x?xf64, #sparse1>):
    "func.return"(%arg57) : (tensor<?x?xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse2>) -> tensor<?x?xf64, #sparse2>, sym_name = "sparse_nop_soa_coo"}> ({
  ^bb0(%arg56: tensor<?x?xf64, #sparse2>):
    "func.return"(%arg56) : (tensor<?x?xf64, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>), sym_name = "sparse_nop_multi_ret"}> ({
  ^bb0(%arg54: tensor<?xf64, #sparse>, %arg55: tensor<?xf64, #sparse>):
    "func.return"(%arg54, %arg55) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>), sym_name = "sparse_nop_call"}> ({
  ^bb0(%arg52: tensor<?xf64, #sparse>, %arg53: tensor<?xf64, #sparse>):
    %39:2 = "func.call"(%arg52, %arg53) <{callee = @sparse_nop_multi_ret}> : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>)
    "func.return"(%39#0, %39#1) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<64xf32, #sparse>) -> tensor<?xf32, #sparse>, sym_name = "sparse_nop_cast"}> ({
  ^bb0(%arg51: tensor<64xf32, #sparse>):
    %38 = "tensor.cast"(%arg51) : (tensor<64xf32, #sparse>) -> tensor<?xf32, #sparse>
    "func.return"(%38) : (tensor<?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x20x30xf32, #sparse3>) -> tensor<?x?x?xf32, #sparse3>, sym_name = "sparse_nop_cast_3d"}> ({
  ^bb0(%arg50: tensor<10x20x30xf32, #sparse3>):
    %37 = "tensor.cast"(%arg50) : (tensor<10x20x30xf32, #sparse3>) -> tensor<?x?x?xf32, #sparse3>
    "func.return"(%37) : (tensor<?x?x?xf32, #sparse3>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse4>) -> (), sym_name = "sparse_dense_2d"}> ({
  ^bb0(%arg49: tensor<?x?xf64, #sparse4>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse5>) -> (), sym_name = "sparse_row"}> ({
  ^bb0(%arg48: tensor<?x?xf64, #sparse5>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse6>) -> (), sym_name = "sparse_csr"}> ({
  ^bb0(%arg47: tensor<?x?xf64, #sparse6>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x2x?x?xf64, #sparse7>) -> (), sym_name = "sparse_bcsr_0"}> ({
  ^bb0(%arg46: tensor<?x2x?x?xf64, #sparse7>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf64, #sparse7>) -> (), sym_name = "sparse_bcsr_1"}> ({
  ^bb0(%arg45: tensor<?x?x?x?xf64, #sparse7>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<18x6x4x2xf64, #sparse7>) -> (), sym_name = "sparse_bcsr_2"}> ({
  ^bb0(%arg44: tensor<18x6x4x2xf64, #sparse7>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse8>) -> (), sym_name = "sparse_dcsr"}> ({
  ^bb0(%arg43: tensor<?x?xf64, #sparse8>):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x20x30xf64, #sparse3>) -> index, sym_name = "sparse_dense_3d"}> ({
  ^bb0(%arg42: tensor<10x20x30xf64, #sparse3>):
    %35 = "arith.constant"() <{value = 1 : index}> : () -> index
    %36 = "tensor.dim"(%arg42, %35) : (tensor<10x20x30xf64, #sparse3>, index) -> index
    "func.return"(%36) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf64, #sparse3>) -> index, sym_name = "sparse_dense_3d_dyn"}> ({
  ^bb0(%arg41: tensor<?x?x?xf64, #sparse3>):
    %33 = "arith.constant"() <{value = 1 : index}> : () -> index
    %34 = "tensor.dim"(%arg41, %33) : (tensor<?x?x?xf64, #sparse3>, index) -> index
    "func.return"(%34) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse8>) -> memref<?xi32>, sym_name = "sparse_positions_dcsr"}> ({
  ^bb0(%arg40: tensor<?x?xf64, #sparse8>):
    %32 = "sparse_tensor.positions"(%arg40) <{level = 1 : index}> : (tensor<?x?xf64, #sparse8>) -> memref<?xi32>
    "func.return"(%32) : (memref<?xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse8>) -> memref<?xi64>, sym_name = "sparse_indices_dcsr"}> ({
  ^bb0(%arg39: tensor<?x?xf64, #sparse8>):
    %31 = "sparse_tensor.coordinates"(%arg39) <{level = 1 : index}> : (tensor<?x?xf64, #sparse8>) -> memref<?xi64>
    "func.return"(%31) : (memref<?xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse8>) -> memref<?xf64>, sym_name = "sparse_values_dcsr"}> ({
  ^bb0(%arg38: tensor<?x?xf64, #sparse8>):
    %30 = "sparse_tensor.values"(%arg38) : (tensor<?x?xf64, #sparse8>) -> memref<?xf64>
    "func.return"(%30) : (memref<?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf64, #sparse9>) -> memref<?xf64>, sym_name = "sparse_values_coo"}> ({
  ^bb0(%arg37: tensor<?x?x?xf64, #sparse9>):
    %29 = "sparse_tensor.values"(%arg37) : (tensor<?x?x?xf64, #sparse9>) -> memref<?xf64>
    "func.return"(%29) : (memref<?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf64, #sparse9>) -> memref<?xindex, strided<[?], offset: ?>>, sym_name = "sparse_indices_coo"}> ({
  ^bb0(%arg36: tensor<?x?x?xf64, #sparse9>):
    %28 = "sparse_tensor.coordinates"(%arg36) <{level = 1 : index}> : (tensor<?x?x?xf64, #sparse9>) -> memref<?xindex, strided<[?], offset: ?>>
    "func.return"(%28) : (memref<?xindex, strided<[?], offset: ?>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf64, #sparse9>) -> memref<?xindex>, sym_name = "sparse_indices_buffer_coo"}> ({
  ^bb0(%arg35: tensor<?x?x?xf64, #sparse9>):
    %27 = "sparse_tensor.coordinates_buffer"(%arg35) : (tensor<?x?x?xf64, #sparse9>) -> memref<?xindex>
    "func.return"(%27) : (memref<?xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xf64, #sparse>) -> index, sym_name = "sparse_noe"}> ({
  ^bb0(%arg34: tensor<128xf64, #sparse>):
    %26 = "sparse_tensor.number_of_entries"(%arg34) : (tensor<128xf64, #sparse>) -> index
    "func.return"(%26) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse6>) -> (), sym_name = "sparse_dealloc_csr"}> ({
  ^bb0(%arg33: tensor<?x?xf64, #sparse6>):
    "bufferization.dealloc_tensor"(%arg33) : (tensor<?x?xf64, #sparse6>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> tensor<10x?xf64, #sparse10>, sym_name = "sparse_alloc_csc"}> ({
  ^bb0(%arg32: index):
    %24 = "tensor.empty"(%arg32) : (index) -> tensor<10x?xf64, #sparse10>
    %25 = "sparse_tensor.load"(%24) : (tensor<10x?xf64, #sparse10>) -> tensor<10x?xf64, #sparse10>
    "func.return"(%25) : (tensor<10x?xf64, #sparse10>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<10x20x30xf64, #sparse3>, sym_name = "sparse_alloc_3d"}> ({
    %22 = "tensor.empty"() : () -> tensor<10x20x30xf64, #sparse3>
    %23 = "sparse_tensor.load"(%22) : (tensor<10x20x30xf64, #sparse3>) -> tensor<10x20x30xf64, #sparse3>
    "func.return"(%23) : (tensor<10x20x30xf64, #sparse3>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<?xindex>, sym_name = "sparse_expansion1"}> ({
    %20 = "tensor.empty"() : () -> tensor<4x8xf64, #sparse6>
    %21:4 = "sparse_tensor.expand"(%20) : (tensor<4x8xf64, #sparse6>) -> (memref<?xf64>, memref<?xi1>, memref<?xindex>, index)
    "func.return"(%21#2) : (memref<?xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<?xindex>, sym_name = "sparse_expansion2"}> ({
    %18 = "tensor.empty"() : () -> tensor<4x8xf64, #sparse10>
    %19:4 = "sparse_tensor.expand"(%18) : (tensor<4x8xf64, #sparse10>) -> (memref<?xf64>, memref<?xi1>, memref<?xindex>, index)
    "func.return"(%19#2) : (memref<?xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> memref<?xindex>, sym_name = "sparse_expansion3"}> ({
  ^bb0(%arg30: index, %arg31: index):
    %16 = "tensor.empty"(%arg30, %arg31) : (index, index) -> tensor<?x?xf64, #sparse10>
    %17:4 = "sparse_tensor.expand"(%16) : (tensor<?x?xf64, #sparse10>) -> (memref<?xf64>, memref<?xi1>, memref<?xindex>, index)
    "func.return"(%17#2) : (memref<?xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<100xf64, #sparse11>, memref<?xf64>, memref<?xi1>, memref<?xindex>, index) -> tensor<100xf64, #sparse11>, sym_name = "sparse_compression_1d"}> ({
  ^bb0(%arg25: tensor<100xf64, #sparse11>, %arg26: memref<?xf64>, %arg27: memref<?xi1>, %arg28: memref<?xindex>, %arg29: index):
    %14 = "sparse_tensor.compress"(%arg26, %arg27, %arg28, %arg29, %arg25) : (memref<?xf64>, memref<?xi1>, memref<?xindex>, index, tensor<100xf64, #sparse11>) -> tensor<100xf64, #sparse11>
    %15 = "sparse_tensor.load"(%14) <{hasInserts}> : (tensor<100xf64, #sparse11>) -> tensor<100xf64, #sparse11>
    "func.return"(%15) : (tensor<100xf64, #sparse11>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse6>, memref<?xf64>, memref<?xi1>, memref<?xindex>, index, index) -> tensor<8x8xf64, #sparse6>, sym_name = "sparse_compression"}> ({
  ^bb0(%arg19: tensor<8x8xf64, #sparse6>, %arg20: memref<?xf64>, %arg21: memref<?xi1>, %arg22: memref<?xindex>, %arg23: index, %arg24: index):
    %12 = "sparse_tensor.compress"(%arg20, %arg21, %arg22, %arg23, %arg19, %arg24) : (memref<?xf64>, memref<?xi1>, memref<?xindex>, index, tensor<8x8xf64, #sparse6>, index) -> tensor<8x8xf64, #sparse6>
    %13 = "sparse_tensor.load"(%12) <{hasInserts}> : (tensor<8x8xf64, #sparse6>) -> tensor<8x8xf64, #sparse6>
    "func.return"(%13) : (tensor<8x8xf64, #sparse6>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse12>, memref<?xf64>, memref<?xi1>, memref<?xindex>, index, index) -> tensor<8x8xf64, #sparse12>, sym_name = "sparse_compression_unordered"}> ({
  ^bb0(%arg13: tensor<8x8xf64, #sparse12>, %arg14: memref<?xf64>, %arg15: memref<?xi1>, %arg16: memref<?xindex>, %arg17: index, %arg18: index):
    %10 = "sparse_tensor.compress"(%arg14, %arg15, %arg16, %arg17, %arg13, %arg18) : (memref<?xf64>, memref<?xi1>, memref<?xindex>, index, tensor<8x8xf64, #sparse12>, index) -> tensor<8x8xf64, #sparse12>
    %11 = "sparse_tensor.load"(%10) <{hasInserts}> : (tensor<8x8xf64, #sparse12>) -> tensor<8x8xf64, #sparse12>
    "func.return"(%11) : (tensor<8x8xf64, #sparse12>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xf64, #sparse11>, index, f64) -> tensor<128xf64, #sparse11>, sym_name = "sparse_insert"}> ({
  ^bb0(%arg10: tensor<128xf64, #sparse11>, %arg11: index, %arg12: f64):
    %8 = "tensor.insert"(%arg12, %arg10, %arg11) : (f64, tensor<128xf64, #sparse11>, index) -> tensor<128xf64, #sparse11>
    %9 = "sparse_tensor.load"(%8) <{hasInserts}> : (tensor<128xf64, #sparse11>) -> tensor<128xf64, #sparse11>
    "func.return"(%9) : (tensor<128xf64, #sparse11>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xf64, #sparse>, index, f64) -> tensor<128xf64, #sparse>, sym_name = "sparse_insert_typed"}> ({
  ^bb0(%arg7: tensor<128xf64, #sparse>, %arg8: index, %arg9: f64):
    %6 = "tensor.insert"(%arg9, %arg7, %arg8) : (f64, tensor<128xf64, #sparse>, index) -> tensor<128xf64, #sparse>
    %7 = "sparse_tensor.load"(%6) <{hasInserts}> : (tensor<128xf64, #sparse>) -> tensor<128xf64, #sparse>
    "func.return"(%7) : (tensor<128xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x6xf64, #sparse1>, index, f64) -> tensor<5x6xf64, #sparse1>, sym_name = "sparse_insert_coo"}> ({
  ^bb0(%arg4: tensor<5x6xf64, #sparse1>, %arg5: index, %arg6: f64):
    %4 = "tensor.insert"(%arg6, %arg4, %arg5, %arg5) : (f64, tensor<5x6xf64, #sparse1>, index, index) -> tensor<5x6xf64, #sparse1>
    %5 = "sparse_tensor.load"(%4) <{hasInserts}> : (tensor<5x6xf64, #sparse1>) -> tensor<5x6xf64, #sparse1>
    "func.return"(%5) : (tensor<5x6xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse>) -> tensor<?xf32, #sparse>, sym_name = "sparse_nop_convert"}> ({
  ^bb0(%arg3: tensor<32xf32, #sparse>):
    %3 = "sparse_tensor.convert"(%arg3) : (tensor<32xf32, #sparse>) -> tensor<?xf32, #sparse>
    "func.return"(%3) : (tensor<?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xf32, #sparse>) -> tensor<?xi32, #sparse>, sym_name = "sparse_convert_element_type"}> ({
  ^bb0(%arg2: tensor<32xf32, #sparse>):
    %2 = "sparse_tensor.convert"(%arg2) : (tensor<32xf32, #sparse>) -> tensor<?xi32, #sparse>
    "func.return"(%2) : (tensor<?xi32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> tensor<?x?xf32, #sparse1>, sym_name = "sparse_new_coo"}> ({
  ^bb0(%arg1: !llvm.ptr):
    %1 = "sparse_tensor.new"(%arg1) : (!llvm.ptr) -> tensor<?x?xf32, #sparse1>
    "func.return"(%1) : (tensor<?x?xf32, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> tensor<?x?xf32, #sparse13>, sym_name = "sparse_new_coo_permute_no"}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "sparse_tensor.new"(%arg0) : (!llvm.ptr) -> tensor<?x?xf32, #sparse13>
    "func.return"(%0) : (tensor<?x?xf32, #sparse13>) -> ()
  }) : () -> ()
}) : () -> ()

