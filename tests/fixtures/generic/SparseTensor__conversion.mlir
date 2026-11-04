#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : compressed, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>, sym_name = "sparse_nop"}> ({
  ^bb0(%arg37: tensor<?xf64, #sparse>):
    "func.return"(%arg37) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64, #sparse>) -> index, sym_name = "sparse_dim1d"}> ({
  ^bb0(%arg36: tensor<?xf64, #sparse>):
    %35 = "arith.constant"() <{value = 0 : index}> : () -> index
    %36 = "tensor.dim"(%arg36, %35) : (tensor<?xf64, #sparse>, index) -> index
    "func.return"(%36) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf64, #sparse1>) -> index, sym_name = "sparse_dim3d"}> ({
  ^bb0(%arg35: tensor<?x?x?xf64, #sparse1>):
    %33 = "arith.constant"() <{value = 1 : index}> : () -> index
    %34 = "tensor.dim"(%arg35, %33) : (tensor<?x?x?xf64, #sparse1>, index) -> index
    "func.return"(%34) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x20x30xf64, #sparse1>) -> index, sym_name = "sparse_dim3d_const"}> ({
  ^bb0(%arg34: tensor<10x20x30xf64, #sparse1>):
    %31 = "arith.constant"() <{value = 1 : index}> : () -> index
    %32 = "tensor.dim"(%arg34, %31) : (tensor<10x20x30xf64, #sparse1>, index) -> index
    "func.return"(%32) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> tensor<128xf64, #sparse>, sym_name = "sparse_new1d"}> ({
  ^bb0(%arg33: !llvm.ptr):
    %30 = "sparse_tensor.new"(%arg33) : (!llvm.ptr) -> tensor<128xf64, #sparse>
    "func.return"(%30) : (tensor<128xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> tensor<?x?xf32, #sparse2>, sym_name = "sparse_new2d"}> ({
  ^bb0(%arg32: !llvm.ptr):
    %29 = "sparse_tensor.new"(%arg32) : (!llvm.ptr) -> tensor<?x?xf32, #sparse2>
    "func.return"(%29) : (tensor<?x?xf32, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> tensor<?x?x?xf32, #sparse1>, sym_name = "sparse_new3d"}> ({
  ^bb0(%arg31: !llvm.ptr):
    %28 = "sparse_tensor.new"(%arg31) : (!llvm.ptr) -> tensor<?x?x?xf32, #sparse1>
    "func.return"(%28) : (tensor<?x?x?xf32, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> tensor<?x?xf64, #sparse2>, sym_name = "sparse_init"}> ({
  ^bb0(%arg29: index, %arg30: index):
    %26 = "tensor.empty"(%arg29, %arg30) : (index, index) -> tensor<?x?xf64, #sparse2>
    %27 = "sparse_tensor.load"(%26) : (tensor<?x?xf64, #sparse2>) -> tensor<?x?xf64, #sparse2>
    "func.return"(%27) : (tensor<?x?xf64, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xf64, #sparse>) -> (), sym_name = "sparse_release"}> ({
  ^bb0(%arg28: tensor<128xf64, #sparse>):
    "bufferization.dealloc_tensor"(%arg28) : (tensor<128xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<64xf32, #sparse>) -> tensor<?xf32, #sparse>, sym_name = "sparse_nop_cast"}> ({
  ^bb0(%arg27: tensor<64xf32, #sparse>):
    %25 = "tensor.cast"(%arg27) : (tensor<64xf32, #sparse>) -> tensor<?xf32, #sparse>
    "func.return"(%25) : (tensor<?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xf64, #sparse>) -> memref<?xindex>, sym_name = "sparse_positions"}> ({
  ^bb0(%arg26: tensor<128xf64, #sparse>):
    %24 = "sparse_tensor.positions"(%arg26) <{level = 0 : index}> : (tensor<128xf64, #sparse>) -> memref<?xindex>
    "func.return"(%24) : (memref<?xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xf64, #sparse3>) -> memref<?xi64>, sym_name = "sparse_positions64"}> ({
  ^bb0(%arg25: tensor<128xf64, #sparse3>):
    %23 = "sparse_tensor.positions"(%arg25) <{level = 0 : index}> : (tensor<128xf64, #sparse3>) -> memref<?xi64>
    "func.return"(%23) : (memref<?xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xf64, #sparse4>) -> memref<?xi32>, sym_name = "sparse_positions32"}> ({
  ^bb0(%arg24: tensor<128xf64, #sparse4>):
    %22 = "sparse_tensor.positions"(%arg24) <{level = 0 : index}> : (tensor<128xf64, #sparse4>) -> memref<?xi32>
    "func.return"(%22) : (memref<?xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xf64, #sparse>) -> memref<?xindex>, sym_name = "sparse_indices"}> ({
  ^bb0(%arg23: tensor<128xf64, #sparse>):
    %21 = "sparse_tensor.coordinates"(%arg23) <{level = 0 : index}> : (tensor<128xf64, #sparse>) -> memref<?xindex>
    "func.return"(%21) : (memref<?xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xf64, #sparse3>) -> memref<?xi64>, sym_name = "sparse_indices64"}> ({
  ^bb0(%arg22: tensor<128xf64, #sparse3>):
    %20 = "sparse_tensor.coordinates"(%arg22) <{level = 0 : index}> : (tensor<128xf64, #sparse3>) -> memref<?xi64>
    "func.return"(%20) : (memref<?xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xf64, #sparse4>) -> memref<?xi32>, sym_name = "sparse_indices32"}> ({
  ^bb0(%arg21: tensor<128xf64, #sparse4>):
    %19 = "sparse_tensor.coordinates"(%arg21) <{level = 0 : index}> : (tensor<128xf64, #sparse4>) -> memref<?xi32>
    "func.return"(%19) : (memref<?xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xf64, #sparse>) -> memref<?xf64>, sym_name = "sparse_valuesf64"}> ({
  ^bb0(%arg20: tensor<128xf64, #sparse>):
    %18 = "sparse_tensor.values"(%arg20) : (tensor<128xf64, #sparse>) -> memref<?xf64>
    "func.return"(%18) : (memref<?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xf32, #sparse>) -> memref<?xf32>, sym_name = "sparse_valuesf32"}> ({
  ^bb0(%arg19: tensor<128xf32, #sparse>):
    %17 = "sparse_tensor.values"(%arg19) : (tensor<128xf32, #sparse>) -> memref<?xf32>
    "func.return"(%17) : (memref<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xi32, #sparse>) -> memref<?xi32>, sym_name = "sparse_valuesi32"}> ({
  ^bb0(%arg18: tensor<128xi32, #sparse>):
    %16 = "sparse_tensor.values"(%arg18) : (tensor<128xi32, #sparse>) -> memref<?xi32>
    "func.return"(%16) : (memref<?xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xi16, #sparse>) -> memref<?xi16>, sym_name = "sparse_valuesi16"}> ({
  ^bb0(%arg17: tensor<128xi16, #sparse>):
    %15 = "sparse_tensor.values"(%arg17) : (tensor<128xi16, #sparse>) -> memref<?xi16>
    "func.return"(%15) : (memref<?xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xi8, #sparse>) -> memref<?xi8>, sym_name = "sparse_valuesi8"}> ({
  ^bb0(%arg16: tensor<128xi8, #sparse>):
    %14 = "sparse_tensor.values"(%arg16) : (tensor<128xi8, #sparse>) -> memref<?xi8>
    "func.return"(%14) : (memref<?xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xf64, #sparse>) -> index, sym_name = "sparse_noe"}> ({
  ^bb0(%arg15: tensor<128xf64, #sparse>):
    %13 = "sparse_tensor.number_of_entries"(%arg15) : (tensor<128xf64, #sparse>) -> index
    "func.return"(%13) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xf32, #sparse>) -> tensor<128xf32, #sparse>, sym_name = "sparse_reconstruct"}> ({
  ^bb0(%arg14: tensor<128xf32, #sparse>):
    %12 = "sparse_tensor.load"(%arg14) : (tensor<128xf32, #sparse>) -> tensor<128xf32, #sparse>
    "func.return"(%12) : (tensor<128xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xf32, #sparse>) -> tensor<128xf32, #sparse>, sym_name = "sparse_reconstruct_ins"}> ({
  ^bb0(%arg13: tensor<128xf32, #sparse>):
    %11 = "sparse_tensor.load"(%arg13) <{hasInserts}> : (tensor<128xf32, #sparse>) -> tensor<128xf32, #sparse>
    "func.return"(%11) : (tensor<128xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128xf32, #sparse>, index, f32) -> tensor<128xf32, #sparse>, sym_name = "sparse_insert"}> ({
  ^bb0(%arg10: tensor<128xf32, #sparse>, %arg11: index, %arg12: f32):
    %10 = "tensor.insert"(%arg12, %arg10, %arg11) : (f32, tensor<128xf32, #sparse>, index) -> tensor<128xf32, #sparse>
    "func.return"(%10) : (tensor<128xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<?xindex>, sym_name = "sparse_expansion1"}> ({
    %8 = "tensor.empty"() : () -> tensor<4x8xf64, #sparse2>
    %9:4 = "sparse_tensor.expand"(%8) : (tensor<4x8xf64, #sparse2>) -> (memref<?xf64>, memref<?xi1>, memref<?xindex>, index)
    "func.return"(%9#2) : (memref<?xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<?xindex>, sym_name = "sparse_expansion2"}> ({
    %6 = "tensor.empty"() : () -> tensor<4x8xf64, #sparse5>
    %7:4 = "sparse_tensor.expand"(%6) : (tensor<4x8xf64, #sparse5>) -> (memref<?xf64>, memref<?xi1>, memref<?xindex>, index)
    "func.return"(%7#2) : (memref<?xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> memref<?xindex>, sym_name = "sparse_expansion3"}> ({
  ^bb0(%arg8: index, %arg9: index):
    %4 = "tensor.empty"(%arg8, %arg9) : (index, index) -> tensor<?x?xf64, #sparse5>
    %5:4 = "sparse_tensor.expand"(%4) : (tensor<?x?xf64, #sparse5>) -> (memref<?xf64>, memref<?xi1>, memref<?xindex>, index)
    "func.return"(%5#2) : (memref<?xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse2>, memref<?xf64>, memref<?xi1>, memref<?xindex>, index, index) -> tensor<8x8xf64, #sparse2>, sym_name = "sparse_compression"}> ({
  ^bb0(%arg2: tensor<8x8xf64, #sparse2>, %arg3: memref<?xf64>, %arg4: memref<?xi1>, %arg5: memref<?xindex>, %arg6: index, %arg7: index):
    %3 = "sparse_tensor.compress"(%arg3, %arg4, %arg5, %arg6, %arg2, %arg7) : (memref<?xf64>, memref<?xi1>, memref<?xindex>, index, tensor<8x8xf64, #sparse2>, index) -> tensor<8x8xf64, #sparse2>
    "func.return"(%3) : (tensor<8x8xf64, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (tensor<?x?xf64, #sparse2>, tensor<?x?xf64>), sym_name = "sparse_and_dense_init"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "tensor.empty"(%arg0, %arg1) : (index, index) -> tensor<?x?xf64, #sparse2>
    %1 = "sparse_tensor.load"(%0) : (tensor<?x?xf64, #sparse2>) -> tensor<?x?xf64, #sparse2>
    %2 = "tensor.empty"(%arg0, %arg1) : (index, index) -> tensor<?x?xf64>
    "func.return"(%1, %2) : (tensor<?x?xf64, #sparse2>, tensor<?x?xf64>) -> ()
  }) : () -> ()
}) : () -> ()

