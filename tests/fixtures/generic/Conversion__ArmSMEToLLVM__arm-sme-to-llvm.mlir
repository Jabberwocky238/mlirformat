"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi8>, vector<[16]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_hor_i8"}> ({
  ^bb0(%arg0: memref<?x?xi8>, %arg1: vector<[16]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[16]x[16]xi8>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<horizontal>}> : (memref<?x?xi8>, vector<[16]xi1>, vector<[16]x[16]xi8>, index, index) -> vector<[16]x[16]xi8>
    "test.some_use"(%2) : (vector<[16]x[16]xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi16>, vector<[8]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_hor_i16"}> ({
  ^bb0(%arg0: memref<?x?xi16>, %arg1: vector<[8]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xi16>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<horizontal>}> : (memref<?x?xi16>, vector<[8]xi1>, vector<[8]x[8]xi16>, index, index) -> vector<[8]x[8]xi16>
    "test.some_use"(%2) : (vector<[8]x[8]xi16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32>, vector<[4]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_hor_i32"}> ({
  ^bb0(%arg0: memref<?x?xi32>, %arg1: vector<[4]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xi32>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<horizontal>}> : (memref<?x?xi32>, vector<[4]xi1>, vector<[4]x[4]xi32>, index, index) -> vector<[4]x[4]xi32>
    "test.some_use"(%2) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi64>, vector<[2]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_hor_i64"}> ({
  ^bb0(%arg0: memref<?x?xi64>, %arg1: vector<[2]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xi64>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<horizontal>}> : (memref<?x?xi64>, vector<[2]xi1>, vector<[2]x[2]xi64>, index, index) -> vector<[2]x[2]xi64>
    "test.some_use"(%2) : (vector<[2]x[2]xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi128>, vector<[1]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_hor_i128"}> ({
  ^bb0(%arg0: memref<?x?xi128>, %arg1: vector<[1]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[1]x[1]xi128>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<horizontal>}> : (memref<?x?xi128>, vector<[1]xi1>, vector<[1]x[1]xi128>, index, index) -> vector<[1]x[1]xi128>
    "test.some_use"(%2) : (vector<[1]x[1]xi128>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf16>, vector<[8]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_hor_f16"}> ({
  ^bb0(%arg0: memref<?x?xf16>, %arg1: vector<[8]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xf16>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<horizontal>}> : (memref<?x?xf16>, vector<[8]xi1>, vector<[8]x[8]xf16>, index, index) -> vector<[8]x[8]xf16>
    "test.some_use"(%2) : (vector<[8]x[8]xf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xbf16>, vector<[8]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_hor_bf16"}> ({
  ^bb0(%arg0: memref<?x?xbf16>, %arg1: vector<[8]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xbf16>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<horizontal>}> : (memref<?x?xbf16>, vector<[8]xi1>, vector<[8]x[8]xbf16>, index, index) -> vector<[8]x[8]xbf16>
    "test.some_use"(%2) : (vector<[8]x[8]xbf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, vector<[4]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_hor_f32"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: vector<[4]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<horizontal>}> : (memref<?x?xf32>, vector<[4]xi1>, vector<[4]x[4]xf32>, index, index) -> vector<[4]x[4]xf32>
    "test.some_use"(%2) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf64>, vector<[2]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_hor_f64"}> ({
  ^bb0(%arg0: memref<?x?xf64>, %arg1: vector<[2]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xf64>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<horizontal>}> : (memref<?x?xf64>, vector<[2]xi1>, vector<[2]x[2]xf64>, index, index) -> vector<[2]x[2]xf64>
    "test.some_use"(%2) : (vector<[2]x[2]xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi8>, vector<[16]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_ver_i8"}> ({
  ^bb0(%arg0: memref<?x?xi8>, %arg1: vector<[16]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[16]x[16]xi8>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<vertical>}> : (memref<?x?xi8>, vector<[16]xi1>, vector<[16]x[16]xi8>, index, index) -> vector<[16]x[16]xi8>
    "test.some_use"(%2) : (vector<[16]x[16]xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi16>, vector<[8]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_ver_i16"}> ({
  ^bb0(%arg0: memref<?x?xi16>, %arg1: vector<[8]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xi16>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<vertical>}> : (memref<?x?xi16>, vector<[8]xi1>, vector<[8]x[8]xi16>, index, index) -> vector<[8]x[8]xi16>
    "test.some_use"(%2) : (vector<[8]x[8]xi16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32>, vector<[4]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_ver_i32"}> ({
  ^bb0(%arg0: memref<?x?xi32>, %arg1: vector<[4]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xi32>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<vertical>}> : (memref<?x?xi32>, vector<[4]xi1>, vector<[4]x[4]xi32>, index, index) -> vector<[4]x[4]xi32>
    "test.some_use"(%2) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi64>, vector<[2]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_ver_i64"}> ({
  ^bb0(%arg0: memref<?x?xi64>, %arg1: vector<[2]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xi64>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<vertical>}> : (memref<?x?xi64>, vector<[2]xi1>, vector<[2]x[2]xi64>, index, index) -> vector<[2]x[2]xi64>
    "test.some_use"(%2) : (vector<[2]x[2]xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi128>, vector<[1]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_ver_i128"}> ({
  ^bb0(%arg0: memref<?x?xi128>, %arg1: vector<[1]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[1]x[1]xi128>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<vertical>}> : (memref<?x?xi128>, vector<[1]xi1>, vector<[1]x[1]xi128>, index, index) -> vector<[1]x[1]xi128>
    "test.some_use"(%2) : (vector<[1]x[1]xi128>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf16>, vector<[8]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_ver_f16"}> ({
  ^bb0(%arg0: memref<?x?xf16>, %arg1: vector<[8]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xf16>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<vertical>}> : (memref<?x?xf16>, vector<[8]xi1>, vector<[8]x[8]xf16>, index, index) -> vector<[8]x[8]xf16>
    "test.some_use"(%2) : (vector<[8]x[8]xf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xbf16>, vector<[8]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_ver_bf16"}> ({
  ^bb0(%arg0: memref<?x?xbf16>, %arg1: vector<[8]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xbf16>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<vertical>}> : (memref<?x?xbf16>, vector<[8]xi1>, vector<[8]x[8]xbf16>, index, index) -> vector<[8]x[8]xbf16>
    "test.some_use"(%2) : (vector<[8]x[8]xbf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, vector<[4]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_ver_f32"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: vector<[4]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<vertical>}> : (memref<?x?xf32>, vector<[4]xi1>, vector<[4]x[4]xf32>, index, index) -> vector<[4]x[4]xf32>
    "test.some_use"(%2) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf64>, vector<[2]xi1>, index) -> (), sym_name = "arm_sme_load_tile_slice_ver_f64"}> ({
  ^bb0(%arg0: memref<?x?xf64>, %arg1: vector<[2]xi1>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xf64>
    %2 = "arm_sme.load_tile_slice"(%arg0, %arg1, %1, %0, %arg2) <{layout = #arm_sme.layout<vertical>}> : (memref<?x?xf64>, vector<[2]xi1>, vector<[2]x[2]xf64>, index, index) -> vector<[2]x[2]xf64>
    "test.some_use"(%2) : (vector<[2]x[2]xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[16]xi1>, memref<?x?xi8>) -> (), sym_name = "arm_sme_store_tile_slice_hor_i8"}> ({
  ^bb0(%arg0: index, %arg1: vector<[16]xi1>, %arg2: memref<?x?xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[16]x[16]xi8>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[16]x[16]xi8>, index, vector<[16]xi1>, memref<?x?xi8>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[8]xi1>, memref<?x?xi16>) -> (), sym_name = "arm_sme_store_tile_slice_hor_i16"}> ({
  ^bb0(%arg0: index, %arg1: vector<[8]xi1>, %arg2: memref<?x?xi16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xi16>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[8]x[8]xi16>, index, vector<[8]xi1>, memref<?x?xi16>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[4]xi1>, memref<?x?xi32>) -> (), sym_name = "arm_sme_store_tile_slice_hor_i32"}> ({
  ^bb0(%arg0: index, %arg1: vector<[4]xi1>, %arg2: memref<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xi32>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]x[4]xi32>, index, vector<[4]xi1>, memref<?x?xi32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[2]xi1>, memref<?x?xi64>) -> (), sym_name = "arm_sme_store_tile_slice_hor_i64"}> ({
  ^bb0(%arg0: index, %arg1: vector<[2]xi1>, %arg2: memref<?x?xi64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xi64>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[2]x[2]xi64>, index, vector<[2]xi1>, memref<?x?xi64>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[1]xi1>, memref<?x?xi128>) -> (), sym_name = "arm_sme_store_tile_slice_hor_i128"}> ({
  ^bb0(%arg0: index, %arg1: vector<[1]xi1>, %arg2: memref<?x?xi128>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[1]x[1]xi128>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[1]x[1]xi128>, index, vector<[1]xi1>, memref<?x?xi128>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[8]xi1>, memref<?x?xf16>) -> (), sym_name = "arm_sme_store_tile_slice_hor_f16"}> ({
  ^bb0(%arg0: index, %arg1: vector<[8]xi1>, %arg2: memref<?x?xf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xf16>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[8]x[8]xf16>, index, vector<[8]xi1>, memref<?x?xf16>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[8]xi1>, memref<?x?xbf16>) -> (), sym_name = "arm_sme_store_tile_slice_hor_bf16"}> ({
  ^bb0(%arg0: index, %arg1: vector<[8]xi1>, %arg2: memref<?x?xbf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xbf16>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[8]x[8]xbf16>, index, vector<[8]xi1>, memref<?x?xbf16>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[4]xi1>, memref<?x?xf32>) -> (), sym_name = "arm_sme_store_tile_slice_hor_f32"}> ({
  ^bb0(%arg0: index, %arg1: vector<[4]xi1>, %arg2: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]x[4]xf32>, index, vector<[4]xi1>, memref<?x?xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[2]xi1>, memref<?x?xf64>) -> (), sym_name = "arm_sme_store_tile_slice_hor_f64"}> ({
  ^bb0(%arg0: index, %arg1: vector<[2]xi1>, %arg2: memref<?x?xf64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xf64>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[2]x[2]xf64>, index, vector<[2]xi1>, memref<?x?xf64>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[16]xi1>, memref<?x?xi8>) -> (), sym_name = "arm_sme_store_tile_slice_ver_i8"}> ({
  ^bb0(%arg0: index, %arg1: vector<[16]xi1>, %arg2: memref<?x?xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[16]x[16]xi8>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<vertical>}> : (vector<[16]x[16]xi8>, index, vector<[16]xi1>, memref<?x?xi8>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[8]xi1>, memref<?x?xi16>) -> (), sym_name = "arm_sme_store_tile_slice_ver_i16"}> ({
  ^bb0(%arg0: index, %arg1: vector<[8]xi1>, %arg2: memref<?x?xi16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xi16>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<vertical>}> : (vector<[8]x[8]xi16>, index, vector<[8]xi1>, memref<?x?xi16>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[4]xi1>, memref<?x?xi32>) -> (), sym_name = "arm_sme_store_tile_slice_ver_i32"}> ({
  ^bb0(%arg0: index, %arg1: vector<[4]xi1>, %arg2: memref<?x?xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xi32>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<vertical>}> : (vector<[4]x[4]xi32>, index, vector<[4]xi1>, memref<?x?xi32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[2]xi1>, memref<?x?xi64>) -> (), sym_name = "arm_sme_store_tile_slice_ver_i64"}> ({
  ^bb0(%arg0: index, %arg1: vector<[2]xi1>, %arg2: memref<?x?xi64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xi64>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<vertical>}> : (vector<[2]x[2]xi64>, index, vector<[2]xi1>, memref<?x?xi64>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[1]xi1>, memref<?x?xi128>) -> (), sym_name = "arm_sme_store_tile_slice_ver_i128"}> ({
  ^bb0(%arg0: index, %arg1: vector<[1]xi1>, %arg2: memref<?x?xi128>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[1]x[1]xi128>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<vertical>}> : (vector<[1]x[1]xi128>, index, vector<[1]xi1>, memref<?x?xi128>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[8]xi1>, memref<?x?xf16>) -> (), sym_name = "arm_sme_store_tile_slice_ver_f16"}> ({
  ^bb0(%arg0: index, %arg1: vector<[8]xi1>, %arg2: memref<?x?xf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xf16>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<vertical>}> : (vector<[8]x[8]xf16>, index, vector<[8]xi1>, memref<?x?xf16>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[8]xi1>, memref<?x?xbf16>) -> (), sym_name = "arm_sme_store_tile_slice_ver_bf16"}> ({
  ^bb0(%arg0: index, %arg1: vector<[8]xi1>, %arg2: memref<?x?xbf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xbf16>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<vertical>}> : (vector<[8]x[8]xbf16>, index, vector<[8]xi1>, memref<?x?xbf16>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[4]xi1>, memref<?x?xf32>) -> (), sym_name = "arm_sme_store_tile_slice_ver_f32"}> ({
  ^bb0(%arg0: index, %arg1: vector<[4]xi1>, %arg2: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<vertical>}> : (vector<[4]x[4]xf32>, index, vector<[4]xi1>, memref<?x?xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<[2]xi1>, memref<?x?xf64>) -> (), sym_name = "arm_sme_store_tile_slice_ver_f64"}> ({
  ^bb0(%arg0: index, %arg1: vector<[2]xi1>, %arg2: memref<?x?xf64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xf64>
    "arm_sme.store_tile_slice"(%1, %arg0, %arg1, %arg2, %0) <{layout = #arm_sme.layout<vertical>}> : (vector<[2]x[2]xf64>, index, vector<[2]xi1>, memref<?x?xf64>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xi32>, index) -> (), sym_name = "arm_sme_insert_tile_slice_hor_i32"}> ({
  ^bb0(%arg0: vector<[4]xi32>, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xi32>
    %2 = "arm_sme.insert_tile_slice"(%arg0, %1, %arg1) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]xi32>, vector<[4]x[4]xi32>, index) -> vector<[4]x[4]xi32>
    "test.some_use"(%2) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xbf16>, index) -> (), sym_name = "arm_sme_insert_tile_slice_ver_bf16"}> ({
  ^bb0(%arg0: vector<[8]xbf16>, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xbf16>
    %2 = "arm_sme.insert_tile_slice"(%arg0, %1, %arg1) <{layout = #arm_sme.layout<vertical>}> : (vector<[8]xbf16>, vector<[8]x[8]xbf16>, index) -> vector<[8]x[8]xbf16>
    "test.some_use"(%2) : (vector<[8]x[8]xbf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[16]xi8>, sym_name = "arm_sme_extract_tile_slice_i8"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[16]x[16]xi8>
    %1 = "arm_sme.extract_tile_slice"(%0, %arg0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[16]x[16]xi8>, index) -> vector<[16]xi8>
    "func.return"(%1) : (vector<[16]xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[8]xi16>, sym_name = "arm_sme_extract_tile_slice_i16"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xi16>
    %1 = "arm_sme.extract_tile_slice"(%0, %arg0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[8]x[8]xi16>, index) -> vector<[8]xi16>
    "func.return"(%1) : (vector<[8]xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[4]xi32>, sym_name = "arm_sme_extract_tile_slice_i32"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xi32>
    %1 = "arm_sme.extract_tile_slice"(%0, %arg0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]x[4]xi32>, index) -> vector<[4]xi32>
    "func.return"(%1) : (vector<[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[2]xi64>, sym_name = "arm_sme_extract_tile_slice_i64"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xi64>
    %1 = "arm_sme.extract_tile_slice"(%0, %arg0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[2]x[2]xi64>, index) -> vector<[2]xi64>
    "func.return"(%1) : (vector<[2]xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[1]xi128>, sym_name = "arm_sme_extract_tile_slice_i128"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[1]x[1]xi128>
    %1 = "arm_sme.extract_tile_slice"(%0, %arg0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[1]x[1]xi128>, index) -> vector<[1]xi128>
    "func.return"(%1) : (vector<[1]xi128>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[8]xf16>, sym_name = "arm_sme_extract_tile_slice_f16"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xf16>
    %1 = "arm_sme.extract_tile_slice"(%0, %arg0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[8]x[8]xf16>, index) -> vector<[8]xf16>
    "func.return"(%1) : (vector<[8]xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[8]xbf16>, sym_name = "arm_sme_extract_tile_slice_bf16"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[8]x[8]xbf16>
    %1 = "arm_sme.extract_tile_slice"(%0, %arg0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[8]x[8]xbf16>, index) -> vector<[8]xbf16>
    "func.return"(%1) : (vector<[8]xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[4]xf32>, sym_name = "arm_sme_extract_tile_slice_f32"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %1 = "arm_sme.extract_tile_slice"(%0, %arg0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]x[4]xf32>, index) -> vector<[4]xf32>
    "func.return"(%1) : (vector<[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[2]xf64>, sym_name = "arm_sme_extract_tile_slice_f64"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[2]x[2]xf64>
    %1 = "arm_sme.extract_tile_slice"(%0, %arg0) <{layout = #arm_sme.layout<horizontal>}> : (vector<[2]x[2]xf64>, index) -> vector<[2]xf64>
    "func.return"(%1) : (vector<[2]xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<[1]xi128>, sym_name = "arm_sme_extract_tile_slice_ver_i128"}> ({
  ^bb0(%arg0: index):
    %0 = "arm_sme.get_tile"() : () -> vector<[1]x[1]xi128>
    %1 = "arm_sme.extract_tile_slice"(%0, %arg0) <{layout = #arm_sme.layout<vertical>}> : (vector<[1]x[1]xi128>, index) -> vector<[1]xi128>
    "func.return"(%1) : (vector<[1]xi128>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "arm_sme_streaming_vl_bytes"}> ({
    %0 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<byte>}> : () -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "arm_sme_streaming_vl_half_words"}> ({
    %0 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<half>}> : () -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "arm_sme_streaming_vl_words"}> ({
    %0 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<word>}> : () -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "arm_sme_streaming_vl_double_words"}> ({
    %0 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<double>}> : () -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xf16>, vector<[8]xf16>) -> (), sym_name = "arm_sme_fmopa_2way_f16f16_to_f32"}> ({
  ^bb0(%arg0: vector<[8]xf16>, %arg1: vector<[8]xf16>):
    %0 = "arm_sme.fmopa_2way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[8]xf16>, vector<[8]xf16>) -> vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xbf16>, vector<[8]xbf16>) -> (), sym_name = "arm_sme_fmopa_2way_bf16bf16_to_f32"}> ({
  ^bb0(%arg0: vector<[8]xbf16>, %arg1: vector<[8]xbf16>):
    %0 = "arm_sme.fmopa_2way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[8]xbf16>, vector<[8]xbf16>) -> vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xf16>, vector<[8]xf16>) -> (), sym_name = "arm_sme_fmops_2way_f16f16_to_f32"}> ({
  ^bb0(%arg0: vector<[8]xf16>, %arg1: vector<[8]xf16>):
    %0 = "arm_sme.fmops_2way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[8]xf16>, vector<[8]xf16>) -> vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xbf16>, vector<[8]xbf16>) -> (), sym_name = "arm_sme_fmops_2way_bf16bf16_to_f32"}> ({
  ^bb0(%arg0: vector<[8]xbf16>, %arg1: vector<[8]xbf16>):
    %0 = "arm_sme.fmops_2way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[8]xbf16>, vector<[8]xbf16>) -> vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi16>, vector<[8]xi16>) -> (), sym_name = "arm_sme_smopa_2way_i16i16_to_i32"}> ({
  ^bb0(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>):
    %0 = "arm_sme.smopa_2way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[8]xi16>, vector<[8]xi16>) -> vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi16>, vector<[8]xi16>) -> (), sym_name = "arm_sme_smops_2way_i16i16_to_i32"}> ({
  ^bb0(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>):
    %0 = "arm_sme.smops_2way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[8]xi16>, vector<[8]xi16>) -> vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi16>, vector<[8]xi16>) -> (), sym_name = "arm_sme_umopa_2way_i16i16_to_i32"}> ({
  ^bb0(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>):
    %0 = "arm_sme.umopa_2way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[8]xi16>, vector<[8]xi16>) -> vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi16>, vector<[8]xi16>) -> (), sym_name = "arm_sme_umops_2way_i16i16_to_i32"}> ({
  ^bb0(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>):
    %0 = "arm_sme.umops_2way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[8]xi16>, vector<[8]xi16>) -> vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, vector<[16]xi8>) -> (), sym_name = "arm_sme_smopa_4way_i8i8_to_i32"}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>):
    %0 = "arm_sme.smopa_4way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi16>, vector<[8]xi16>) -> (), sym_name = "arm_sme_smopa_4way_i16i16_to_i64"}> ({
  ^bb0(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>):
    %0 = "arm_sme.smopa_4way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[8]xi16>, vector<[8]xi16>) -> vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, vector<[16]xi8>) -> (), sym_name = "arm_sme_smops_4way_i8i8_to_i32"}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>):
    %0 = "arm_sme.smops_4way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi16>, vector<[8]xi16>) -> (), sym_name = "arm_sme_smops_4way_i16i16_to_i64"}> ({
  ^bb0(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>):
    %0 = "arm_sme.smops_4way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[8]xi16>, vector<[8]xi16>) -> vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, vector<[16]xi8>) -> (), sym_name = "arm_sme_umopa_4way_i8i8_to_i32"}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>):
    %0 = "arm_sme.umopa_4way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi16>, vector<[8]xi16>) -> (), sym_name = "arm_sme_umopa_4way_i16i16_to_i64"}> ({
  ^bb0(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>):
    %0 = "arm_sme.umopa_4way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[8]xi16>, vector<[8]xi16>) -> vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, vector<[16]xi8>) -> (), sym_name = "arm_sme_umops_4way_i8i8_to_i32"}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>):
    %0 = "arm_sme.umops_4way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi16>, vector<[8]xi16>) -> (), sym_name = "arm_sme_umops_4way_i16i16_to_i64"}> ({
  ^bb0(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>):
    %0 = "arm_sme.umops_4way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[8]xi16>, vector<[8]xi16>) -> vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, vector<[16]xi8>) -> (), sym_name = "arm_sme_sumopa_4way_i8i8_to_i32"}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>):
    %0 = "arm_sme.sumopa_4way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi16>, vector<[8]xi16>) -> (), sym_name = "arm_sme_sumopa_4way_i16i16_to_i64"}> ({
  ^bb0(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>):
    %0 = "arm_sme.sumopa_4way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[8]xi16>, vector<[8]xi16>) -> vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, vector<[16]xi8>) -> (), sym_name = "arm_sme_sumops_4way_i8i8_to_i32"}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>):
    %0 = "arm_sme.sumops_4way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi16>, vector<[8]xi16>) -> (), sym_name = "arm_sme_sumops_4way_i16i16_to_i64"}> ({
  ^bb0(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>):
    %0 = "arm_sme.sumops_4way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[8]xi16>, vector<[8]xi16>) -> vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, vector<[16]xi8>) -> (), sym_name = "arm_sme_usmopa_4way_i8i8_to_i32"}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>):
    %0 = "arm_sme.usmopa_4way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi16>, vector<[8]xi16>) -> (), sym_name = "arm_sme_usmopa_4way_i16i16_to_i64"}> ({
  ^bb0(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>):
    %0 = "arm_sme.usmopa_4way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[8]xi16>, vector<[8]xi16>) -> vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[16]xi8>, vector<[16]xi8>) -> (), sym_name = "arm_sme_usmops_4way_i8i8_to_i32"}> ({
  ^bb0(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>):
    %0 = "arm_sme.usmops_4way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[16]xi8>, vector<[16]xi8>) -> vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xi16>, vector<[8]xi16>) -> (), sym_name = "arm_sme_usmops_4way_i16i16_to_i64"}> ({
  ^bb0(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>):
    %0 = "arm_sme.usmops_4way"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>}> : (vector<[8]xi16>, vector<[8]xi16>) -> vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "ops_on_tiles_legal_post_conversion"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %3 = "arm_sme.copy_tile"(%2) : (vector<[4]x[4]xf32>) -> vector<[4]x[4]xf32>
    "cf.br"(%3)[^bb1] : (vector<[4]x[4]xf32>) -> ()
  ^bb1(%4: vector<[4]x[4]xf32>):  // pred: ^bb0
    "test.some_use"(%4) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

