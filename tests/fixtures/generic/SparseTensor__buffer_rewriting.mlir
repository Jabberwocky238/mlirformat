"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xf64>, f64) -> (memref<?xf64>, index), sym_name = "sparse_push_back"}> ({
  ^bb0(%arg0: index, %arg1: memref<?xf64>, %arg2: f64):
    %0:2 = "sparse_tensor.push_back"(%arg0, %arg1, %arg2) : (index, memref<?xf64>, f64) -> (memref<?xf64>, index)
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
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xf64>, f64) -> (memref<?xf64>, index), sym_name = "sparse_push_back_inbound"}> ({
  ^bb0(%arg0: index, %arg1: memref<?xf64>, %arg2: f64):
    %0:2 = "sparse_tensor.push_back"(%arg0, %arg1, %arg2) <{inbounds}> : (index, memref<?xf64>, f64) -> (memref<?xf64>, index)
    "func.return"(%0#0, %0#1) : (memref<?xf64>, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<100xindex>, memref<?xf32>, memref<10xi32>) -> (memref<100xindex>, memref<?xf32>, memref<10xi32>), sym_name = "sparse_sort_coo_quick"}> ({
  ^bb0(%arg0: index, %arg1: memref<100xindex>, %arg2: memref<?xf32>, %arg3: memref<10xi32>):
    "sparse_tensor.sort"(%arg0, %arg1, %arg2, %arg3) <{algorithm = #sparse_tensor<SparseTensorSortAlgorithm quick_sort>, ny = 1 : index, perm_map = #map}> : (index, memref<100xindex>, memref<?xf32>, memref<10xi32>) -> ()
    "func.return"(%arg1, %arg2, %arg3) : (memref<100xindex>, memref<?xf32>, memref<10xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<100xindex>, memref<?xf32>, memref<10xi32>) -> (memref<100xindex>, memref<?xf32>, memref<10xi32>), sym_name = "sparse_sort_coo_hybrid"}> ({
  ^bb0(%arg0: index, %arg1: memref<100xindex>, %arg2: memref<?xf32>, %arg3: memref<10xi32>):
    "sparse_tensor.sort"(%arg0, %arg1, %arg2, %arg3) <{algorithm = #sparse_tensor<SparseTensorSortAlgorithm hybrid_quick_sort>, ny = 1 : index, perm_map = #map}> : (index, memref<100xindex>, memref<?xf32>, memref<10xi32>) -> ()
    "func.return"(%arg1, %arg2, %arg3) : (memref<100xindex>, memref<?xf32>, memref<10xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<100xindex>, memref<?xf32>, memref<10xi32>) -> (memref<100xindex>, memref<?xf32>, memref<10xi32>), sym_name = "sparse_sort_coo_stable"}> ({
  ^bb0(%arg0: index, %arg1: memref<100xindex>, %arg2: memref<?xf32>, %arg3: memref<10xi32>):
    "sparse_tensor.sort"(%arg0, %arg1, %arg2, %arg3) <{algorithm = #sparse_tensor<SparseTensorSortAlgorithm insertion_sort_stable>, ny = 1 : index, perm_map = #map}> : (index, memref<100xindex>, memref<?xf32>, memref<10xi32>) -> ()
    "func.return"(%arg1, %arg2, %arg3) : (memref<100xindex>, memref<?xf32>, memref<10xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<100xindex>, memref<?xf32>, memref<10xi32>) -> (memref<100xindex>, memref<?xf32>, memref<10xi32>), sym_name = "sparse_sort_coo_heap"}> ({
  ^bb0(%arg0: index, %arg1: memref<100xindex>, %arg2: memref<?xf32>, %arg3: memref<10xi32>):
    "sparse_tensor.sort"(%arg0, %arg1, %arg2, %arg3) <{algorithm = #sparse_tensor<SparseTensorSortAlgorithm heap_sort>, ny = 1 : index, perm_map = #map}> : (index, memref<100xindex>, memref<?xf32>, memref<10xi32>) -> ()
    "func.return"(%arg1, %arg2, %arg3) : (memref<100xindex>, memref<?xf32>, memref<10xi32>) -> ()
  }) : () -> ()
}) : () -> ()

