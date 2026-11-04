module {
  func.func @transfer_to_maskedload_fatrawbuffer(%arg0: memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: vector<4xi1>, %arg3: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.maskedload %arg0[%arg1, %arg1], %arg2, %arg3 : memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, vector<4xi1>, vector<4xf32> into vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @transfer_to_maskedload_fatrawbuffer_f16(%arg0: memref<8x8xf16, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: index, %arg3: vector<4xi1>, %arg4: vector<4xf16>) -> vector<4xf16> {
    %0 = vector.maskedload %arg0[%arg1, %arg2], %arg3, %arg4 : memref<8x8xf16, #amdgpu.address_space<fat_raw_buffer>>, vector<4xi1>, vector<4xf16> into vector<4xf16>
    return %0 : vector<4xf16>
  }
}

// -----
module {
  func.func @transfer_to_maskedload_fatrawbuffer_dynamic_i8(%arg0: memref<?x?xi8, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: index, %arg3: vector<4xi1>, %arg4: vector<4xi8>) -> vector<4xi8> {
    %0 = vector.maskedload %arg0[%arg1, %arg2], %arg3, %arg4 : memref<?x?xi8, #amdgpu.address_space<fat_raw_buffer>>, vector<4xi1>, vector<4xi8> into vector<4xi8>
    return %0 : vector<4xi8>
  }
}

// -----
module {
  func.func @transfer_to_maskedload_regular(%arg0: memref<8x8xf32>, %arg1: index, %arg2: vector<4xi1>, %arg3: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.maskedload %arg0[%arg1, %arg1], %arg2, %arg3 : memref<8x8xf32>, vector<4xi1>, vector<4xf32> into vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @transfer_to_maskedload_addrspace(%arg0: memref<8x8xf32, #gpu.address_space<workgroup>>, %arg1: index, %arg2: vector<4xi1>, %arg3: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.maskedload %arg0[%arg1, %arg1], %arg2, %arg3 : memref<8x8xf32, #gpu.address_space<workgroup>>, vector<4xi1>, vector<4xf32> into vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @transfer_scalar(%arg0: memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: vector<1xi1>, %arg3: vector<1xf32>) -> vector<1xf32> {
    %0 = vector.maskedload %arg0[%arg1, %arg1], %arg2, %arg3 : memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, vector<1xi1>, vector<1xf32> into vector<1xf32>
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @transfer_to_maskedload_fatrawbuffer(%arg0: memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: vector<4xi1>, %arg3: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.maskedload %arg0[%arg1, %arg1], %arg2, %arg3 : memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, vector<4xi1>, vector<4xf32> into vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @full_select_maskedload_fatrawbuffer_to_load(%arg0: memref<8x8xf16, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: i1, %arg3: vector<4xf16>) -> vector<4xf16> {
    %0 = vector.broadcast %arg2 : i1 to vector<4xi1>
    %1 = vector.maskedload %arg0[%arg1, %arg1], %0, %arg3 : memref<8x8xf16, #amdgpu.address_space<fat_raw_buffer>>, vector<4xi1>, vector<4xf16> into vector<4xf16>
    return %1 : vector<4xf16>
  }
}

// -----
module {
  func.func @full_select_maskedload_to_load(%arg0: memref<8x8xf16>, %arg1: index, %arg2: i1, %arg3: vector<4xf16>) -> vector<4xf16> {
    %0 = vector.broadcast %arg2 : i1 to vector<4xi1>
    %1 = vector.maskedload %arg0[%arg1, %arg1], %0, %arg3 : memref<8x8xf16>, vector<4xi1>, vector<4xf16> into vector<4xf16>
    return %1 : vector<4xf16>
  }
}

// -----
module {
  func.func @full_mask_maskedstore_to_store(%arg0: memref<8x8xf16>, %arg1: index, %arg2: i1, %arg3: vector<4xf16>) {
    %0 = vector.broadcast %arg2 : i1 to vector<4xi1>
    vector.maskedstore %arg0[%arg1, %arg1], %0, %arg3 : memref<8x8xf16>, vector<4xi1>, vector<4xf16>
    return
  }
}

