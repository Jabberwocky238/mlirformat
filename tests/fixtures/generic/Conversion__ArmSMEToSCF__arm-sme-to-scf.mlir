"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32>) -> (), sym_name = "arm_sme_tile_load_hor"}> ({
  ^bb0(%arg0: memref<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.tile_load"(%arg0, %0, %0) <{layout = #arm_sme.layout<horizontal>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<?x?xi32>, index, index) -> vector<[4]x[4]xi32>
    "test.some_use"(%1) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32>) -> (), sym_name = "arm_sme_tile_load_ver"}> ({
  ^bb0(%arg0: memref<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.tile_load"(%arg0, %0, %0) <{layout = #arm_sme.layout<vertical>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<?x?xi32>, index, index) -> vector<[4]x[4]xi32>
    "test.some_use"(%1) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32>) -> (), sym_name = "arm_sme_tile_load_hor_with_mask_and_pad_zero"}> ({
  ^bb0(%arg0: memref<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %4 = "vector.create_mask"(%2, %1) : (index, index) -> vector<[4]x[4]xi1>
    %5 = "arm_sme.tile_load"(%arg0, %0, %0, %3, %4) <{layout = #arm_sme.layout<horizontal>, operandSegmentSizes = array<i32: 1, 2, 1, 1>}> : (memref<?x?xi32>, index, index, i32, vector<[4]x[4]xi1>) -> vector<[4]x[4]xi32>
    "test.some_use"(%5) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32>, i32) -> (), sym_name = "arm_sme_tile_load_hor_with_mask_and_nonzero_pad"}> ({
  ^bb0(%arg0: memref<?x?xi32>, %arg1: i32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    %3 = "vector.create_mask"(%2, %1) : (index, index) -> vector<[4]x[4]xi1>
    %4 = "arm_sme.tile_load"(%arg0, %0, %0, %arg1, %3) <{layout = #arm_sme.layout<horizontal>, operandSegmentSizes = array<i32: 1, 2, 1, 1>}> : (memref<?x?xi32>, index, index, i32, vector<[4]x[4]xi1>) -> vector<[4]x[4]xi32>
    "test.some_use"(%4) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xi32>, memref<?x?xi32>) -> (), sym_name = "arm_sme_tile_store_hor"}> ({
  ^bb0(%arg0: vector<[4]x[4]xi32>, %arg1: memref<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "arm_sme.tile_store"(%arg0, %arg1, %0, %0) <{layout = #arm_sme.layout<horizontal>, operandSegmentSizes = array<i32: 1, 1, 2, 0>}> : (vector<[4]x[4]xi32>, memref<?x?xi32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xi32>, memref<?x?xi32>) -> (), sym_name = "arm_sme_tile_store_ver"}> ({
  ^bb0(%arg0: vector<[4]x[4]xi32>, %arg1: memref<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "arm_sme.tile_store"(%arg0, %arg1, %0, %0) <{layout = #arm_sme.layout<vertical>, operandSegmentSizes = array<i32: 1, 1, 2, 0>}> : (vector<[4]x[4]xi32>, memref<?x?xi32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xi32>, memref<?x?xi32>) -> (), sym_name = "arm_sme_tile_store_hor_with_mask"}> ({
  ^bb0(%arg0: vector<[4]x[4]xi32>, %arg1: memref<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    %3 = "vector.create_mask"(%2, %1) : (index, index) -> vector<[4]x[4]xi1>
    "arm_sme.tile_store"(%arg0, %arg1, %0, %0, %3) <{layout = #arm_sme.layout<horizontal>, operandSegmentSizes = array<i32: 1, 1, 2, 1>}> : (vector<[4]x[4]xi32>, memref<?x?xi32>, index, index, vector<[4]x[4]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

