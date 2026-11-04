"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, index, vector<4xi1>, vector<4xf32>) -> vector<4xf32>, sym_name = "transfer_to_maskedload_fatrawbuffer"}> ({
  ^bb0(%arg0: memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: vector<4xi1>, %arg3: vector<4xf32>):
    %0 = "vector.maskedload"(%arg0, %arg1, %arg1, %arg2, %arg3) : (memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, index, index, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x8xf16, #amdgpu.address_space<fat_raw_buffer>>, index, index, vector<4xi1>, vector<4xf16>) -> vector<4xf16>, sym_name = "transfer_to_maskedload_fatrawbuffer_f16"}> ({
  ^bb0(%arg0: memref<8x8xf16, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: index, %arg3: vector<4xi1>, %arg4: vector<4xf16>):
    %0 = "vector.maskedload"(%arg0, %arg1, %arg2, %arg3, %arg4) : (memref<8x8xf16, #amdgpu.address_space<fat_raw_buffer>>, index, index, vector<4xi1>, vector<4xf16>) -> vector<4xf16>
    "func.return"(%0) : (vector<4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi8, #amdgpu.address_space<fat_raw_buffer>>, index, index, vector<4xi1>, vector<4xi8>) -> vector<4xi8>, sym_name = "transfer_to_maskedload_fatrawbuffer_dynamic_i8"}> ({
  ^bb0(%arg0: memref<?x?xi8, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: index, %arg3: vector<4xi1>, %arg4: vector<4xi8>):
    %0 = "vector.maskedload"(%arg0, %arg1, %arg2, %arg3, %arg4) : (memref<?x?xi8, #amdgpu.address_space<fat_raw_buffer>>, index, index, vector<4xi1>, vector<4xi8>) -> vector<4xi8>
    "func.return"(%0) : (vector<4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x8xf32>, index, vector<4xi1>, vector<4xf32>) -> vector<4xf32>, sym_name = "transfer_to_maskedload_regular"}> ({
  ^bb0(%arg0: memref<8x8xf32>, %arg1: index, %arg2: vector<4xi1>, %arg3: vector<4xf32>):
    %0 = "vector.maskedload"(%arg0, %arg1, %arg1, %arg2, %arg3) : (memref<8x8xf32>, index, index, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x8xf32, #gpu.address_space<workgroup>>, index, vector<4xi1>, vector<4xf32>) -> vector<4xf32>, sym_name = "transfer_to_maskedload_addrspace"}> ({
  ^bb0(%arg0: memref<8x8xf32, #gpu.address_space<workgroup>>, %arg1: index, %arg2: vector<4xi1>, %arg3: vector<4xf32>):
    %0 = "vector.maskedload"(%arg0, %arg1, %arg1, %arg2, %arg3) : (memref<8x8xf32, #gpu.address_space<workgroup>>, index, index, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, index, vector<1xi1>, vector<1xf32>) -> vector<1xf32>, sym_name = "transfer_scalar"}> ({
  ^bb0(%arg0: memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: vector<1xi1>, %arg3: vector<1xf32>):
    %0 = "vector.maskedload"(%arg0, %arg1, %arg1, %arg2, %arg3) : (memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, index, index, vector<1xi1>, vector<1xf32>) -> vector<1xf32>
    "func.return"(%0) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, index, vector<4xi1>, vector<4xf32>) -> vector<4xf32>, sym_name = "transfer_to_maskedload_fatrawbuffer"}> ({
  ^bb0(%arg0: memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: vector<4xi1>, %arg3: vector<4xf32>):
    %0 = "vector.maskedload"(%arg0, %arg1, %arg1, %arg2, %arg3) : (memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, index, index, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x8xf16, #amdgpu.address_space<fat_raw_buffer>>, index, i1, vector<4xf16>) -> vector<4xf16>, sym_name = "full_select_maskedload_fatrawbuffer_to_load"}> ({
  ^bb0(%arg0: memref<8x8xf16, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: i1, %arg3: vector<4xf16>):
    %0 = "vector.broadcast"(%arg2) : (i1) -> vector<4xi1>
    %1 = "vector.maskedload"(%arg0, %arg1, %arg1, %0, %arg3) : (memref<8x8xf16, #amdgpu.address_space<fat_raw_buffer>>, index, index, vector<4xi1>, vector<4xf16>) -> vector<4xf16>
    "func.return"(%1) : (vector<4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x8xf16>, index, i1, vector<4xf16>) -> vector<4xf16>, sym_name = "full_select_maskedload_to_load"}> ({
  ^bb0(%arg0: memref<8x8xf16>, %arg1: index, %arg2: i1, %arg3: vector<4xf16>):
    %0 = "vector.broadcast"(%arg2) : (i1) -> vector<4xi1>
    %1 = "vector.maskedload"(%arg0, %arg1, %arg1, %0, %arg3) : (memref<8x8xf16>, index, index, vector<4xi1>, vector<4xf16>) -> vector<4xf16>
    "func.return"(%1) : (vector<4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x8xf16>, index, i1, vector<4xf16>) -> (), sym_name = "full_mask_maskedstore_to_store"}> ({
  ^bb0(%arg0: memref<8x8xf16>, %arg1: index, %arg2: i1, %arg3: vector<4xf16>):
    %0 = "vector.broadcast"(%arg2) : (i1) -> vector<4xi1>
    "vector.maskedstore"(%arg0, %arg1, %arg1, %0, %arg3) : (memref<8x8xf16>, index, index, vector<4xi1>, vector<4xf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

