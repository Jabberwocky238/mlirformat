#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr) -> tensor<128xf64, #sparse>, sym_name = "sparse_new"}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "sparse_tensor.new"(%arg0) : (!llvm.ptr) -> tensor<128xf64, #sparse>
    "func.return"(%0) : (tensor<128xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2xi32>, tensor<6x1xi32>, tensor<6xf64>) -> tensor<100xf64, #sparse>, sym_name = "sparse_pack"}> ({
  ^bb0(%arg0: tensor<2xi32>, %arg1: tensor<6x1xi32>, %arg2: tensor<6xf64>):
    %0 = "sparse_tensor.assemble"(%arg0, %arg1, %arg2) : (tensor<2xi32>, tensor<6x1xi32>, tensor<6xf64>) -> tensor<100xf64, #sparse>
    "func.return"(%0) : (tensor<100xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), crdWidth = 32 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100xf64, #sparse>, tensor<2xindex>, tensor<6x1xi32>, tensor<6xf64>) -> (tensor<2xindex>, tensor<6x1xi32>, tensor<6xf64>), sym_name = "sparse_unpack"}> ({
  ^bb0(%arg0: tensor<100xf64, #sparse>, %arg1: tensor<2xindex>, %arg2: tensor<6x1xi32>, %arg3: tensor<6xf64>):
    %0:6 = "sparse_tensor.disassemble"(%arg0, %arg1, %arg2, %arg3) : (tensor<100xf64, #sparse>, tensor<2xindex>, tensor<6x1xi32>, tensor<6xf64>) -> (tensor<2xindex>, tensor<6x1xi32>, tensor<6xf64>, index, index, index)
    "func.return"(%0#0, %0#1, %0#2) : (tensor<2xindex>, tensor<6x1xi32>, tensor<6xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128xf64, #sparse>) -> (), sym_name = "sparse_dealloc"}> ({
  ^bb0(%arg0: tensor<128xf64, #sparse>):
    "bufferization.dealloc_tensor"(%arg0) : (tensor<128xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64xf32>) -> tensor<64xf32, #sparse>, sym_name = "sparse_convert_1d_to_sparse"}> ({
  ^bb0(%arg0: tensor<64xf32>):
    %0 = "sparse_tensor.convert"(%arg0) : (tensor<64xf32>) -> tensor<64xf32, #sparse>
    "func.return"(%0) : (tensor<64xf32, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8x8xf64, #sparse>) -> tensor<8x8x8xf64>, sym_name = "sparse_convert_3d_from_sparse"}> ({
  ^bb0(%arg0: tensor<8x8x8xf64, #sparse>):
    %0 = "sparse_tensor.convert"(%arg0) : (tensor<8x8x8xf64, #sparse>) -> tensor<8x8x8xf64>
    "func.return"(%0) : (tensor<8x8x8xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128xf64, #sparse>) -> memref<?xindex>, sym_name = "sparse_positions"}> ({
  ^bb0(%arg0: tensor<128xf64, #sparse>):
    %0 = "sparse_tensor.positions"(%arg0) <{level = 0 : index}> : (tensor<128xf64, #sparse>) -> memref<?xindex>
    "func.return"(%0) : (memref<?xindex>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> memref<?xindex>, sym_name = "sparse_indices_buffer"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse>):
    %0 = "sparse_tensor.coordinates_buffer"(%arg0) : (tensor<?x?xf64, #sparse>) -> memref<?xindex>
    "func.return"(%0) : (memref<?xindex>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128xf64, #sparse>) -> memref<?xindex>, sym_name = "sparse_indices"}> ({
  ^bb0(%arg0: tensor<128xf64, #sparse>):
    %0 = "sparse_tensor.coordinates"(%arg0) <{level = 0 : index}> : (tensor<128xf64, #sparse>) -> memref<?xindex>
    "func.return"(%0) : (memref<?xindex>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128xf64, #sparse>) -> memref<?xf64>, sym_name = "sparse_values"}> ({
  ^bb0(%arg0: tensor<128xf64, #sparse>):
    %0 = "sparse_tensor.values"(%arg0) : (tensor<128xf64, #sparse>) -> memref<?xf64>
    "func.return"(%0) : (memref<?xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x8xf64, #sparse>) -> index, sym_name = "sparse_slice_offset"}> ({
  ^bb0(%arg0: tensor<2x8xf64, #sparse>):
    %0 = "sparse_tensor.slice.offset"(%arg0) <{dim = 1 : index}> : (tensor<2x8xf64, #sparse>) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x8xf64, #sparse>) -> index, sym_name = "sparse_slice_stride"}> ({
  ^bb0(%arg0: tensor<2x8xf64, #sparse>):
    %0 = "sparse_tensor.slice.stride"(%arg0) <{dim = 1 : index}> : (tensor<2x8xf64, #sparse>) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> !sparse_tensor.storage_specifier<#sparse>, sym_name = "sparse_metadata_init"}> ({
    %0 = "sparse_tensor.storage_specifier.init"() : () -> !sparse_tensor.storage_specifier<#sparse>
    "func.return"(%0) : (!sparse_tensor.storage_specifier<#sparse>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (!sparse_tensor.storage_specifier<#sparse>) -> !sparse_tensor.storage_specifier<#sparse1>, sym_name = "sparse_metadata_init"}> ({
  ^bb0(%arg0: !sparse_tensor.storage_specifier<#sparse>):
    %0 = "sparse_tensor.storage_specifier.init"(%arg0) : (!sparse_tensor.storage_specifier<#sparse>) -> !sparse_tensor.storage_specifier<#sparse1>
    "func.return"(%0) : (!sparse_tensor.storage_specifier<#sparse1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (!sparse_tensor.storage_specifier<#sparse>) -> index, sym_name = "sparse_get_md"}> ({
  ^bb0(%arg0: !sparse_tensor.storage_specifier<#sparse>):
    %0 = "sparse_tensor.storage_specifier.get"(%arg0) <{level = 0 : index, specifierKind = #sparse_tensor<kind lvl_sz>}> : (!sparse_tensor.storage_specifier<#sparse>) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (!sparse_tensor.storage_specifier<#sparse>) -> index, sym_name = "sparse_get_md"}> ({
  ^bb0(%arg0: !sparse_tensor.storage_specifier<#sparse>):
    %0 = "sparse_tensor.storage_specifier.get"(%arg0) <{level = 0 : index, specifierKind = #sparse_tensor<kind dim_offset>}> : (!sparse_tensor.storage_specifier<#sparse>) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (!sparse_tensor.storage_specifier<#sparse>) -> index, sym_name = "sparse_get_md"}> ({
  ^bb0(%arg0: !sparse_tensor.storage_specifier<#sparse>):
    %0 = "sparse_tensor.storage_specifier.get"(%arg0) <{level = 0 : index, specifierKind = #sparse_tensor<kind dim_stride>}> : (!sparse_tensor.storage_specifier<#sparse>) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (!sparse_tensor.storage_specifier<#sparse>, index) -> !sparse_tensor.storage_specifier<#sparse>, sym_name = "sparse_set_md"}> ({
  ^bb0(%arg0: !sparse_tensor.storage_specifier<#sparse>, %arg1: index):
    %0 = "sparse_tensor.storage_specifier.set"(%arg0, %arg1) <{level = 0 : index, specifierKind = #sparse_tensor<kind lvl_sz>}> : (!sparse_tensor.storage_specifier<#sparse>, index) -> !sparse_tensor.storage_specifier<#sparse>
    "func.return"(%0) : (!sparse_tensor.storage_specifier<#sparse>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128xf64, #sparse>) -> index, sym_name = "sparse_noe"}> ({
  ^bb0(%arg0: tensor<128xf64, #sparse>):
    %0 = "sparse_tensor.number_of_entries"(%arg0) : (tensor<128xf64, #sparse>) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x32xf64, #sparse>) -> tensor<16x32xf64, #sparse>, sym_name = "sparse_load"}> ({
  ^bb0(%arg0: tensor<16x32xf64, #sparse>):
    %0 = "sparse_tensor.load"(%arg0) : (tensor<16x32xf64, #sparse>) -> tensor<16x32xf64, #sparse>
    "func.return"(%0) : (tensor<16x32xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x32xf64, #sparse>) -> tensor<16x32xf64, #sparse>, sym_name = "sparse_load_ins"}> ({
  ^bb0(%arg0: tensor<16x32xf64, #sparse>):
    %0 = "sparse_tensor.load"(%arg0) <{hasInserts}> : (tensor<16x32xf64, #sparse>) -> tensor<16x32xf64, #sparse>
    "func.return"(%0) : (tensor<16x32xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128xf64, #sparse>, index, f64) -> tensor<128xf64, #sparse>, sym_name = "sparse_insert"}> ({
  ^bb0(%arg0: tensor<128xf64, #sparse>, %arg1: index, %arg2: f64):
    %0 = "tensor.insert"(%arg2, %arg0, %arg1) : (f64, tensor<128xf64, #sparse>, index) -> tensor<128xf64, #sparse>
    "func.return"(%0) : (tensor<128xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xf64>, f64) -> (memref<?xf64>, index), sym_name = "sparse_push_back"}> ({
  ^bb0(%arg0: index, %arg1: memref<?xf64>, %arg2: f64):
    %0:2 = "sparse_tensor.push_back"(%arg0, %arg1, %arg2) : (index, memref<?xf64>, f64) -> (memref<?xf64>, index)
    "func.return"(%0#0, %0#1) : (memref<?xf64>, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xf64>, f64) -> (memref<?xf64>, index), sym_name = "sparse_push_back_inbound"}> ({
  ^bb0(%arg0: index, %arg1: memref<?xf64>, %arg2: f64):
    %0:2 = "sparse_tensor.push_back"(%arg0, %arg1, %arg2) <{inbounds}> : (index, memref<?xf64>, f64) -> (memref<?xf64>, index)
    "func.return"(%0#0, %0#1) : (memref<?xf64>, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xf64>, f64, index) -> (memref<?xf64>, index), sym_name = "sparse_push_back_n"}> ({
  ^bb0(%arg0: index, %arg1: memref<?xf64>, %arg2: f64, %arg3: index):
    %0:2 = "sparse_tensor.push_back"(%arg0, %arg1, %arg2, %arg3) : (index, memref<?xf64>, f64, index) -> (memref<?xf64>, index)
    "func.return"(%0#0, %0#1) : (memref<?xf64>, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse>) -> index, sym_name = "sparse_expansion"}> ({
  ^bb0(%arg0: tensor<8x8xf64, #sparse>):
    %0:4 = "sparse_tensor.expand"(%arg0) : (tensor<8x8xf64, #sparse>) -> (memref<?xf64>, memref<?xi1>, memref<?xindex>, index)
    "func.return"(%0#3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf64>, memref<?xi1>, memref<?xindex>, index, tensor<8x8xf64, #sparse>, index) -> tensor<8x8xf64, #sparse>, sym_name = "sparse_compression"}> ({
  ^bb0(%arg0: memref<?xf64>, %arg1: memref<?xi1>, %arg2: memref<?xindex>, %arg3: index, %arg4: tensor<8x8xf64, #sparse>, %arg5: index):
    %0 = "sparse_tensor.compress"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) : (memref<?xf64>, memref<?xi1>, memref<?xindex>, index, tensor<8x8xf64, #sparse>, index) -> tensor<8x8xf64, #sparse>
    "func.return"(%0) : (tensor<8x8xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>, !llvm.ptr) -> (), sym_name = "sparse_out"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse>, %arg1: !llvm.ptr):
    "sparse_tensor.out"(%arg0, %arg1) : (tensor<?x?xf64, #sparse>, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64, i64) -> f64, sym_name = "sparse_binary"}> ({
  ^bb0(%arg0: f64, %arg1: i64):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "sparse_tensor.binary"(%arg0, %arg1) <{left_identity}> ({
    ^bb0(%arg3: f64, %arg4: i64):
      "sparse_tensor.yield"(%arg3) : (f64) -> ()
    }, {
    }, {
    ^bb0(%arg2: i64):
      "sparse_tensor.yield"(%0) : (f64) -> ()
    }) : (f64, i64) -> f64
    "func.return"(%1) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64) -> f64, sym_name = "sparse_unary"}> ({
  ^bb0(%arg0: f64):
    %0 = "sparse_tensor.unary"(%arg0) ({
    ^bb0(%arg1: f64):
      "sparse_tensor.yield"(%arg1) : (f64) -> ()
    }, {
      %1 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64
      "sparse_tensor.yield"(%1) : (f64) -> ()
    }) : (f64) -> f64
    "func.return"(%0) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64) -> i64, sym_name = "sparse_unary"}> ({
  ^bb0(%arg0: f64):
    %0 = "sparse_tensor.unary"(%arg0) ({
    ^bb0(%arg1: f64):
      %1 = "arith.fptosi"(%arg1) : (f64) -> i64
      "sparse_tensor.yield"(%1) : (i64) -> ()
    }, {
    }) : (f64) -> i64
    "func.return"(%0) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64, f64) -> f64, sym_name = "sparse_reduce_2d_to_1d"}> ({
  ^bb0(%arg0: f64, %arg1: f64):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "sparse_tensor.reduce"(%arg0, %arg1, %0) ({
    ^bb0(%arg2: f64, %arg3: f64):
      "sparse_tensor.yield"(%arg2) : (f64) -> ()
    }) : (f64, f64, f64) -> f64
    "func.return"(%1) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64) -> f64, sym_name = "sparse_select"}> ({
  ^bb0(%arg0: f64):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %1 = "sparse_tensor.select"(%arg0) ({
    ^bb0(%arg1: f64):
      %2 = "arith.cmpf"(%arg1, %0) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f64, f64) -> i1
      "sparse_tensor.yield"(%2) : (i1) -> ()
    }) : (f64) -> f64
    "func.return"(%1) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse>, tensor<4x4xf64, #sparse>) -> tensor<9x4xf64, #sparse>, sym_name = "concat_sparse_sparse"}> ({
  ^bb0(%arg0: tensor<2x4xf64, #sparse>, %arg1: tensor<3x4xf64, #sparse>, %arg2: tensor<4x4xf64, #sparse>):
    %0 = "sparse_tensor.concatenate"(%arg0, %arg1, %arg2) <{dimension = 0 : index}> : (tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse>, tensor<4x4xf64, #sparse>) -> tensor<9x4xf64, #sparse>
    "func.return"(%0) : (tensor<9x4xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse>) -> (), sym_name = "sparse_tensor_foreach"}> ({
  ^bb0(%arg0: tensor<2x4xf64, #sparse>):
    "sparse_tensor.foreach"(%arg0) ({
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<2x4xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse>, f32) -> (), sym_name = "sparse_tensor_foreach"}> ({
  ^bb0(%arg0: tensor<2x4xf64, #sparse>, %arg1: f32):
    %0 = "sparse_tensor.foreach"(%arg0, %arg1) ({
    ^bb0(%arg2: index, %arg3: index, %arg4: f64, %arg5: f32):
      "sparse_tensor.yield"(%arg5) : (f32) -> ()
    }) : (tensor<2x4xf64, #sparse>, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xindex>) -> memref<?xindex>, sym_name = "sparse_sort_coo"}> ({
  ^bb0(%arg0: index, %arg1: memref<?xindex>):
    "sparse_tensor.sort"(%arg0, %arg1) <{algorithm = #sparse_tensor<SparseTensorSortAlgorithm hybrid_quick_sort>, ny = 1 : index, perm_map = #map}> : (index, memref<?xindex>) -> ()
    "func.return"(%arg1) : (memref<?xindex>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xi64>, memref<?xf32>) -> (memref<?xi64>, memref<?xf32>), sym_name = "sparse_sort_coo_stable"}> ({
  ^bb0(%arg0: index, %arg1: memref<?xi64>, %arg2: memref<?xf32>):
    "sparse_tensor.sort"(%arg0, %arg1, %arg2) <{algorithm = #sparse_tensor<SparseTensorSortAlgorithm insertion_sort_stable>, ny = 1 : index, perm_map = #map}> : (index, memref<?xi64>, memref<?xf32>) -> ()
    "func.return"(%arg1, %arg2) : (memref<?xi64>, memref<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique, nonordered), d1 : singleton(nonordered)) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse>) -> tensor<?x?xf32, #sparse1>, sym_name = "sparse_reorder_coo"}> ({
  ^bb0(%arg0: tensor<?x?xf32, #sparse>):
    %0 = "sparse_tensor.reorder_coo"(%arg0) <{algorithm = #sparse_tensor<SparseTensorSortAlgorithm quick_sort>}> : (tensor<?x?xf32, #sparse>) -> tensor<?x?xf32, #sparse1>
    "func.return"(%0) : (tensor<?x?xf32, #sparse1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (index, index, index, index), sym_name = "sparse_crd_translate"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0:4 = "sparse_tensor.crd_translate"(%arg0, %arg1) <{direction = #sparse_tensor<CrdTransDirection dim_to_lvl>, encoder = #sparse}> : (index, index) -> (index, index, index, index)
    "func.return"(%0#0, %0#1, %0#2, %0#3) : (index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (index, tensor<?x?xi32, #sparse>) -> index, sym_name = "sparse_lvl"}> ({
  ^bb0(%arg0: index, %arg1: tensor<?x?xi32, #sparse>):
    %0 = "sparse_tensor.lvl"(%arg1, %arg0) : (tensor<?x?xi32, #sparse>, index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : dense, d1 : compressed, d2 : dense, d3 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<6x12xi32, #sparse>) -> tensor<3x4x2x3xi32, #sparse1>, sym_name = "sparse_reinterpret_map"}> ({
  ^bb0(%arg0: tensor<6x12xi32, #sparse>):
    %0 = "sparse_tensor.reinterpret_map"(%arg0) : (tensor<6x12xi32, #sparse>) -> tensor<3x4x2x3xi32, #sparse1>
    "func.return"(%0) : (tensor<3x4x2x3xi32, #sparse1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x10xf64, #sparse>) -> (), sym_name = "sparse_print"}> ({
  ^bb0(%arg0: tensor<10x10xf64, #sparse>):
    "sparse_tensor.print"(%arg0) : (tensor<10x10xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i1, sym_name = "sparse_has_runtime"}> ({
    %0 = "sparse_tensor.has_runtime_library"() : () -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8xf32, #sparse>, !sparse_tensor.iterator<#sparse, lvls = 1>) -> f32, sym_name = "sparse_extract_value"}> ({
  ^bb0(%arg0: tensor<4x8xf32, #sparse>, %arg1: !sparse_tensor.iterator<#sparse, lvls = 1>):
    %0 = "sparse_tensor.extract_value"(%arg0, %arg1) : (tensor<4x8xf32, #sparse>, !sparse_tensor.iterator<#sparse, lvls = 1>) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8xf32, #sparse>, !sparse_tensor.iterator<#sparse, lvls = 0>) -> (!sparse_tensor.iter_space<#sparse, lvls = 0>, !sparse_tensor.iter_space<#sparse, lvls = 1>), sym_name = "sparse_extract_iter_space"}> ({
  ^bb0(%arg0: tensor<4x8xf32, #sparse>, %arg1: !sparse_tensor.iterator<#sparse, lvls = 0>):
    %0 = "sparse_tensor.extract_iteration_space"(%arg0) <{hiLvl = 1 : index, loLvl = 0 : index}> : (tensor<4x8xf32, #sparse>) -> !sparse_tensor.iter_space<#sparse, lvls = 0>
    %1 = "sparse_tensor.extract_iteration_space"(%arg0, %arg1) <{hiLvl = 2 : index, loLvl = 1 : index}> : (tensor<4x8xf32, #sparse>, !sparse_tensor.iterator<#sparse, lvls = 0>) -> !sparse_tensor.iter_space<#sparse, lvls = 1>
    "func.return"(%0, %1) : (!sparse_tensor.iter_space<#sparse, lvls = 0>, !sparse_tensor.iter_space<#sparse, lvls = 1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8xf32, #sparse>, index, index) -> index, sym_name = "sparse_iterate"}> ({
  ^bb0(%arg0: tensor<4x8xf32, #sparse>, %arg1: index, %arg2: index):
    %0 = "sparse_tensor.extract_iteration_space"(%arg0) <{hiLvl = 1 : index, loLvl = 0 : index}> : (tensor<4x8xf32, #sparse>) -> !sparse_tensor.iter_space<#sparse, lvls = 0>
    %1 = "sparse_tensor.iterate"(%0, %arg1) <{crdUsedLvls = 1 : i64}> ({
    ^bb0(%arg3: index, %arg4: index, %arg5: !sparse_tensor.iterator<#sparse, lvls = 0>):
      "sparse_tensor.yield"(%arg3) : (index) -> ()
    }) : (!sparse_tensor.iter_space<#sparse, lvls = 0>, index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
"builtin.module"() ({
  "func.func"() <{function_type = (!sparse_tensor.iter_space<#sparse, lvls = 0>, !sparse_tensor.iter_space<#sparse, lvls = 1>) -> index, sym_name = "sparse_coiteration"}> ({
  ^bb0(%arg0: !sparse_tensor.iter_space<#sparse, lvls = 0>, %arg1: !sparse_tensor.iter_space<#sparse, lvls = 1>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "sparse_tensor.coiterate"(%arg0, %arg1, %0) <{cases = [1], crdUsedLvls = 1 : i64, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: !sparse_tensor.iterator<#sparse, lvls = 0>):
      "sparse_tensor.yield"(%arg2) : (index) -> ()
    }) : (!sparse_tensor.iter_space<#sparse, lvls = 0>, !sparse_tensor.iter_space<#sparse, lvls = 1>, index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

