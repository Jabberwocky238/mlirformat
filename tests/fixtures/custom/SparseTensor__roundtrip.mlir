#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_new(%arg0: !llvm.ptr) -> tensor<128xf64, #sparse> {
    %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<128xf64, #sparse>
    return %0 : tensor<128xf64, #sparse>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>
module {
  func.func @sparse_pack(%arg0: tensor<2xi32>, %arg1: tensor<6x1xi32>, %arg2: tensor<6xf64>) -> tensor<100xf64, #sparse> {
    %0 = sparse_tensor.assemble (%arg0, %arg1), %arg2 : (tensor<2xi32>, tensor<6x1xi32>), tensor<6xf64> to tensor<100xf64, #sparse>
    return %0 : tensor<100xf64, #sparse>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), crdWidth = 32 }>
module {
  func.func @sparse_unpack(%arg0: tensor<100xf64, #sparse>, %arg1: tensor<2xindex>, %arg2: tensor<6x1xi32>, %arg3: tensor<6xf64>) -> (tensor<2xindex>, tensor<6x1xi32>, tensor<6xf64>) {
    %ret_levels:2, %ret_values, %lvl_lens:2, %val_len = sparse_tensor.disassemble %arg0 : tensor<100xf64, #sparse> out_lvls(%arg1, %arg2 : tensor<2xindex>, tensor<6x1xi32>) out_vals(%arg3 : tensor<6xf64>) -> (tensor<2xindex>, tensor<6x1xi32>), tensor<6xf64>, (index, index), index
    return %ret_levels#0, %ret_levels#1, %ret_values : tensor<2xindex>, tensor<6x1xi32>, tensor<6xf64>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_dealloc(%arg0: tensor<128xf64, #sparse>) {
    bufferization.dealloc_tensor %arg0 : tensor<128xf64, #sparse>
    return
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_convert_1d_to_sparse(%arg0: tensor<64xf32>) -> tensor<64xf32, #sparse> {
    %0 = sparse_tensor.convert %arg0 : tensor<64xf32> to tensor<64xf32, #sparse>
    return %0 : tensor<64xf32, #sparse>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed) }>
module {
  func.func @sparse_convert_3d_from_sparse(%arg0: tensor<8x8x8xf64, #sparse>) -> tensor<8x8x8xf64> {
    %0 = sparse_tensor.convert %arg0 : tensor<8x8x8xf64, #sparse> to tensor<8x8x8xf64>
    return %0 : tensor<8x8x8xf64>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_positions(%arg0: tensor<128xf64, #sparse>) -> memref<?xindex> {
    %0 = sparse_tensor.positions %arg0 {level = 0 : index} : tensor<128xf64, #sparse> to memref<?xindex>
    return %0 : memref<?xindex>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
module {
  func.func @sparse_indices_buffer(%arg0: tensor<?x?xf64, #sparse>) -> memref<?xindex> {
    %0 = sparse_tensor.coordinates_buffer %arg0 : tensor<?x?xf64, #sparse> to memref<?xindex>
    return %0 : memref<?xindex>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_indices(%arg0: tensor<128xf64, #sparse>) -> memref<?xindex> {
    %0 = sparse_tensor.coordinates %arg0 {level = 0 : index} : tensor<128xf64, #sparse> to memref<?xindex>
    return %0 : memref<?xindex>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_values(%arg0: tensor<128xf64, #sparse>) -> memref<?xf64> {
    %0 = sparse_tensor.values %arg0 : tensor<128xf64, #sparse> to memref<?xf64>
    return %0 : memref<?xf64>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @sparse_slice_offset(%arg0: tensor<2x8xf64, #sparse>) -> index {
    %0 = sparse_tensor.slice.offset %arg0 at 1 : tensor<2x8xf64, #sparse>
    return %0 : index
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @sparse_slice_stride(%arg0: tensor<2x8xf64, #sparse>) -> index {
    %0 = sparse_tensor.slice.stride %arg0 at 1 : tensor<2x8xf64, #sparse>
    return %0 : index
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_metadata_init() -> !sparse_tensor.storage_specifier<#sparse> {
    %0 = sparse_tensor.storage_specifier.init : !sparse_tensor.storage_specifier<#sparse>
    return %0 : !sparse_tensor.storage_specifier<#sparse>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : compressed) }>
module {
  func.func @sparse_metadata_init(%arg0: !sparse_tensor.storage_specifier<#sparse>) -> !sparse_tensor.storage_specifier<#sparse1> {
    %0 = sparse_tensor.storage_specifier.init with %arg0 : from !sparse_tensor.storage_specifier<#sparse> to !sparse_tensor.storage_specifier<#sparse1>
    return %0 : !sparse_tensor.storage_specifier<#sparse1>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_get_md(%arg0: !sparse_tensor.storage_specifier<#sparse>) -> index {
    %0 = sparse_tensor.storage_specifier.get %arg0 lvl_sz at 0 : !sparse_tensor.storage_specifier<#sparse>
    return %0 : index
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : compressed) }>
module {
  func.func @sparse_get_md(%arg0: !sparse_tensor.storage_specifier<#sparse>) -> index {
    %0 = sparse_tensor.storage_specifier.get %arg0 dim_offset at 0 : !sparse_tensor.storage_specifier<#sparse>
    return %0 : index
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : compressed) }>
module {
  func.func @sparse_get_md(%arg0: !sparse_tensor.storage_specifier<#sparse>) -> index {
    %0 = sparse_tensor.storage_specifier.get %arg0 dim_stride at 0 : !sparse_tensor.storage_specifier<#sparse>
    return %0 : index
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_set_md(%arg0: !sparse_tensor.storage_specifier<#sparse>, %arg1: index) -> !sparse_tensor.storage_specifier<#sparse> {
    %0 = sparse_tensor.storage_specifier.set %arg0 lvl_sz at 0 with %arg1 : !sparse_tensor.storage_specifier<#sparse>
    return %0 : !sparse_tensor.storage_specifier<#sparse>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_noe(%arg0: tensor<128xf64, #sparse>) -> index {
    %0 = sparse_tensor.number_of_entries %arg0 : tensor<128xf64, #sparse>
    return %0 : index
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
module {
  func.func @sparse_load(%arg0: tensor<16x32xf64, #sparse>) -> tensor<16x32xf64, #sparse> {
    %0 = sparse_tensor.load %arg0 : tensor<16x32xf64, #sparse>
    return %0 : tensor<16x32xf64, #sparse>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
module {
  func.func @sparse_load_ins(%arg0: tensor<16x32xf64, #sparse>) -> tensor<16x32xf64, #sparse> {
    %0 = sparse_tensor.load %arg0 hasInserts : tensor<16x32xf64, #sparse>
    return %0 : tensor<16x32xf64, #sparse>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_insert(%arg0: tensor<128xf64, #sparse>, %arg1: index, %arg2: f64) -> tensor<128xf64, #sparse> {
    %inserted = tensor.insert %arg2 into %arg0[%arg1] : tensor<128xf64, #sparse>
    return %inserted : tensor<128xf64, #sparse>
  }
}

// -----
module {
  func.func @sparse_push_back(%arg0: index, %arg1: memref<?xf64>, %arg2: f64) -> (memref<?xf64>, index) {
    %outBuffer, %newSize = sparse_tensor.push_back %arg0, %arg1, %arg2 : index, memref<?xf64>, f64
    return %outBuffer, %newSize : memref<?xf64>, index
  }
}

// -----
module {
  func.func @sparse_push_back_inbound(%arg0: index, %arg1: memref<?xf64>, %arg2: f64) -> (memref<?xf64>, index) {
    %outBuffer, %newSize = sparse_tensor.push_back inbounds %arg0, %arg1, %arg2 : index, memref<?xf64>, f64
    return %outBuffer, %newSize : memref<?xf64>, index
  }
}

// -----
module {
  func.func @sparse_push_back_n(%arg0: index, %arg1: memref<?xf64>, %arg2: f64, %arg3: index) -> (memref<?xf64>, index) {
    %outBuffer, %newSize = sparse_tensor.push_back %arg0, %arg1, %arg2, %arg3 : index, memref<?xf64>, f64, index
    return %outBuffer, %newSize : memref<?xf64>, index
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_expansion(%arg0: tensor<8x8xf64, #sparse>) -> index {
    %values, %filled, %added, %count = sparse_tensor.expand %arg0 : tensor<8x8xf64, #sparse> to memref<?xf64>, memref<?xi1>, memref<?xindex>
    return %count : index
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_compression(%arg0: memref<?xf64>, %arg1: memref<?xi1>, %arg2: memref<?xindex>, %arg3: index, %arg4: tensor<8x8xf64, #sparse>, %arg5: index) -> tensor<8x8xf64, #sparse> {
    %0 = sparse_tensor.compress %arg0, %arg1, %arg2, %arg3 into %arg4[%arg5] : memref<?xf64>, memref<?xi1>, memref<?xindex>, tensor<8x8xf64, #sparse>
    return %0 : tensor<8x8xf64, #sparse>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_out(%arg0: tensor<?x?xf64, #sparse>, %arg1: !llvm.ptr) {
    sparse_tensor.out %arg0, %arg1 : tensor<?x?xf64, #sparse>, !llvm.ptr
    return
  }
}

// -----
module {
  func.func @sparse_binary(%arg0: f64, %arg1: i64) -> f64 {
    %cst = arith.constant 0.000000e+00 : f64
    %0 = sparse_tensor.binary %arg0, %arg1 : f64, i64 to f64
     overlap = {
    ^bb0(%arg2: f64, %arg3: i64):
      sparse_tensor.yield %arg2 : f64
    }
     left = identity
     right = {
    ^bb0(%arg2: i64):
      sparse_tensor.yield %cst : f64
    }
    return %0 : f64
  }
}

// -----
module {
  func.func @sparse_unary(%arg0: f64) -> f64 {
    %0 = sparse_tensor.unary %arg0 : f64 to f64
     present = {
    ^bb0(%arg1: f64):
      sparse_tensor.yield %arg1 : f64
    }
     absent = {
      %cst = arith.constant -1.000000e+00 : f64
      sparse_tensor.yield %cst : f64
    }
    return %0 : f64
  }
}

// -----
module {
  func.func @sparse_unary(%arg0: f64) -> i64 {
    %0 = sparse_tensor.unary %arg0 : f64 to i64
     present = {
    ^bb0(%arg1: f64):
      %1 = arith.fptosi %arg1 : f64 to i64
      sparse_tensor.yield %1 : i64
    }
     absent = {
    }
    return %0 : i64
  }
}

// -----
module {
  func.func @sparse_reduce_2d_to_1d(%arg0: f64, %arg1: f64) -> f64 {
    %cst = arith.constant 0.000000e+00 : f64
    %0 = sparse_tensor.reduce %arg0, %arg1, %cst : f64 {
    ^bb0(%arg2: f64, %arg3: f64):
      sparse_tensor.yield %arg2 : f64
    }
    return %0 : f64
  }
}

// -----
module {
  func.func @sparse_select(%arg0: f64) -> f64 {
    %cst = arith.constant 0.000000e+00 : f64
    %0 = sparse_tensor.select %arg0 : f64 {
    ^bb0(%arg1: f64):
      %1 = arith.cmpf ogt, %arg1, %cst : f64
      sparse_tensor.yield %1 : i1
    }
    return %0 : f64
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @concat_sparse_sparse(%arg0: tensor<2x4xf64, #sparse>, %arg1: tensor<3x4xf64, #sparse>, %arg2: tensor<4x4xf64, #sparse>) -> tensor<9x4xf64, #sparse> {
    %0 = sparse_tensor.concatenate %arg0, %arg1, %arg2 {dimension = 0 : index} : tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse>, tensor<4x4xf64, #sparse> to tensor<9x4xf64, #sparse>
    return %0 : tensor<9x4xf64, #sparse>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_tensor_foreach(%arg0: tensor<2x4xf64, #sparse>) {
    sparse_tensor.foreach in %arg0 : tensor<2x4xf64, #sparse> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
    }
    return
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_tensor_foreach(%arg0: tensor<2x4xf64, #sparse>, %arg1: f32) {
    %0 = sparse_tensor.foreach in %arg0 init(%arg1) : tensor<2x4xf64, #sparse>, f32 -> f32 do {
    ^bb0(%arg2: index, %arg3: index, %arg4: f64, %arg5: f32):
      sparse_tensor.yield %arg5 : f32
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @sparse_sort_coo(%arg0: index, %arg1: memref<?xindex>) -> memref<?xindex> {
    sparse_tensor.sort hybrid_quick_sort %arg0, %arg1 {ny = 1 : index, perm_map = #map} : memref<?xindex>
    return %arg1 : memref<?xindex>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @sparse_sort_coo_stable(%arg0: index, %arg1: memref<?xi64>, %arg2: memref<?xf32>) -> (memref<?xi64>, memref<?xf32>) {
    sparse_tensor.sort insertion_sort_stable %arg0, %arg1 jointly %arg2 {ny = 1 : index, perm_map = #map} : memref<?xi64> jointly memref<?xf32>
    return %arg1, %arg2 : memref<?xi64>, memref<?xf32>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique, nonordered), d1 : singleton(nonordered)) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
module {
  func.func @sparse_reorder_coo(%arg0: tensor<?x?xf32, #sparse>) -> tensor<?x?xf32, #sparse1> {
    %0 = sparse_tensor.reorder_coo quick_sort %arg0 : tensor<?x?xf32, #sparse> to tensor<?x?xf32, #sparse1>
    return %0 : tensor<?x?xf32, #sparse1>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>
module {
  func.func @sparse_crd_translate(%arg0: index, %arg1: index) -> (index, index, index, index) {
    %0:4 = sparse_tensor.crd_translate dim_to_lvl[%arg0, %arg1] as #sparse : index, index, index, index
    return %0#0, %0#1, %0#2, %0#3 : index, index, index, index
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>
module {
  func.func @sparse_lvl(%arg0: index, %arg1: tensor<?x?xi32, #sparse>) -> index {
    %0 = sparse_tensor.lvl %arg1, %arg0 : tensor<?x?xi32, #sparse>
    return %0 : index
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : dense, d1 : compressed, d2 : dense, d3 : dense) }>
module {
  func.func @sparse_reinterpret_map(%arg0: tensor<6x12xi32, #sparse>) -> tensor<3x4x2x3xi32, #sparse1> {
    %0 = sparse_tensor.reinterpret_map %arg0 : tensor<6x12xi32, #sparse> to tensor<3x4x2x3xi32, #sparse1>
    return %0 : tensor<3x4x2x3xi32, #sparse1>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_print(%arg0: tensor<10x10xf64, #sparse>) {
    sparse_tensor.print %arg0 : tensor<10x10xf64, #sparse>
    return
  }
}

// -----
module {
  func.func @sparse_has_runtime() -> i1 {
    %0 = sparse_tensor.has_runtime_library
    return %0 : i1
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
module {
  func.func @sparse_extract_value(%arg0: tensor<4x8xf32, #sparse>, %arg1: !sparse_tensor.iterator<#sparse, lvls = 1>) -> f32 {
    %0 = sparse_tensor.extract_value %arg0 at %arg1 : tensor<4x8xf32, #sparse>, !sparse_tensor.iterator<#sparse, lvls = 1>
    return %0 : f32
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
module {
  func.func @sparse_extract_iter_space(%arg0: tensor<4x8xf32, #sparse>, %arg1: !sparse_tensor.iterator<#sparse, lvls = 0>) -> (!sparse_tensor.iter_space<#sparse, lvls = 0>, !sparse_tensor.iter_space<#sparse, lvls = 1>) {
    %0 = sparse_tensor.extract_iteration_space %arg0 lvls = 0 : tensor<4x8xf32, #sparse> -> !sparse_tensor.iter_space<#sparse, lvls = 0>
    %1 = sparse_tensor.extract_iteration_space %arg0 at %arg1 lvls = 1 : tensor<4x8xf32, #sparse>, !sparse_tensor.iterator<#sparse, lvls = 0> -> !sparse_tensor.iter_space<#sparse, lvls = 1>
    return %0, %1 : !sparse_tensor.iter_space<#sparse, lvls = 0>, !sparse_tensor.iter_space<#sparse, lvls = 1>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
module {
  func.func @sparse_iterate(%arg0: tensor<4x8xf32, #sparse>, %arg1: index, %arg2: index) -> index {
    %0 = sparse_tensor.extract_iteration_space %arg0 lvls = 0 : tensor<4x8xf32, #sparse> -> !sparse_tensor.iter_space<#sparse, lvls = 0>
    %1 = sparse_tensor.iterate %arg5 in %0 at(%arg4) iter_args(%arg3 = %arg1) : !sparse_tensor.iter_space<#sparse, lvls = 0>  -> index {
      sparse_tensor.yield %arg3 : index
    }
    return %1 : index
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
module {
  func.func @sparse_coiteration(%arg0: !sparse_tensor.iter_space<#sparse, lvls = 0>, %arg1: !sparse_tensor.iter_space<#sparse, lvls = 1>) -> index {
    %c0 = arith.constant 0 : index
    %0 = sparse_tensor.coiterate (%arg0, %arg1) at(%arg3) iter_args(%arg2 = %c0) : (!sparse_tensor.iter_space<#sparse, lvls = 0>, !sparse_tensor.iter_space<#sparse, lvls = 1>) -> index
    case %arg4, _ {
      sparse_tensor.yield %arg2 : index
    }
    return %0 : index
  }
}

