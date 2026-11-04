module {
  func.func @reduce_add_f32(%arg0: vector<16xf32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 : vector<16xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduce_add_f32_always_reassoc(%arg0: vector<16xf32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 fastmath<reassoc> : vector<16xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @reduce_mul_f32(%arg0: vector<16xf32>) -> f32 {
    %0 = vector.reduction <mul>, %arg0 fastmath<nnan,ninf> : vector<16xf32> into f32
    return %0 : f32
  }
}

// -----
module {
  func.func @masked_reduce_add_f32(%arg0: vector<16xf32>, %arg1: vector<16xi1>) -> f32 {
    %0 = vector.mask %arg1 { vector.reduction <add>, %arg0 : vector<16xf32> into f32 } : vector<16xi1> -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @masked_reduce_add_f32_scalable(%arg0: vector<[16]xf32>, %arg1: vector<[16]xi1>) -> f32 {
    %0 = vector.mask %arg1 { vector.reduction <add>, %arg0 : vector<[16]xf32> into f32 } : vector<[16]xi1> -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @masked_reduce_mul_f32(%arg0: vector<16xf32>, %arg1: vector<16xi1>) -> f32 {
    %0 = vector.mask %arg1 { vector.reduction <mul>, %arg0 : vector<16xf32> into f32 } : vector<16xi1> -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @masked_reduce_minf_f32(%arg0: vector<16xf32>, %arg1: vector<16xi1>) -> f32 {
    %0 = vector.mask %arg1 { vector.reduction <minnumf>, %arg0 : vector<16xf32> into f32 } : vector<16xi1> -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @masked_reduce_minf_f32_scalable(%arg0: vector<[16]xf32>, %arg1: vector<[16]xi1>) -> f32 {
    %0 = vector.mask %arg1 { vector.reduction <minnumf>, %arg0 : vector<[16]xf32> into f32 } : vector<[16]xi1> -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @masked_reduce_maxf_f32(%arg0: vector<16xf32>, %arg1: vector<16xi1>) -> f32 {
    %0 = vector.mask %arg1 { vector.reduction <maxnumf>, %arg0 : vector<16xf32> into f32 } : vector<16xi1> -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @masked_reduce_maximumf_f32(%arg0: vector<16xf32>, %arg1: vector<16xi1>) -> f32 {
    %0 = vector.mask %arg1 { vector.reduction <maximumf>, %arg0 : vector<16xf32> into f32 } : vector<16xi1> -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @masked_reduce_minimumf_f32(%arg0: vector<16xf32>, %arg1: vector<16xi1>) -> f32 {
    %0 = vector.mask %arg1 { vector.reduction <minimumf>, %arg0 : vector<16xf32> into f32 } : vector<16xi1> -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @masked_reduce_add_i8(%arg0: vector<32xi8>, %arg1: vector<32xi1>) -> i8 {
    %0 = vector.mask %arg1 { vector.reduction <add>, %arg0 : vector<32xi8> into i8 } : vector<32xi1> -> i8
    return %0 : i8
  }
}

// -----
module {
  func.func @masked_reduce_add_i8_scalable(%arg0: vector<[32]xi8>, %arg1: vector<[32]xi1>) -> i8 {
    %0 = vector.mask %arg1 { vector.reduction <add>, %arg0 : vector<[32]xi8> into i8 } : vector<[32]xi1> -> i8
    return %0 : i8
  }
}

// -----
module {
  func.func @masked_reduce_mul_i8(%arg0: vector<32xi8>, %arg1: vector<32xi1>) -> i8 {
    %0 = vector.mask %arg1 { vector.reduction <mul>, %arg0 : vector<32xi8> into i8 } : vector<32xi1> -> i8
    return %0 : i8
  }
}

// -----
module {
  func.func @masked_reduce_minui_i8(%arg0: vector<32xi8>, %arg1: vector<32xi1>) -> i8 {
    %0 = vector.mask %arg1 { vector.reduction <minui>, %arg0 : vector<32xi8> into i8 } : vector<32xi1> -> i8
    return %0 : i8
  }
}

// -----
module {
  func.func @masked_reduce_minui_i8_scalable(%arg0: vector<[32]xi8>, %arg1: vector<[32]xi1>) -> i8 {
    %0 = vector.mask %arg1 { vector.reduction <minui>, %arg0 : vector<[32]xi8> into i8 } : vector<[32]xi1> -> i8
    return %0 : i8
  }
}

// -----
module {
  func.func @masked_reduce_maxui_i8(%arg0: vector<32xi8>, %arg1: vector<32xi1>) -> i8 {
    %0 = vector.mask %arg1 { vector.reduction <maxui>, %arg0 : vector<32xi8> into i8 } : vector<32xi1> -> i8
    return %0 : i8
  }
}

// -----
module {
  func.func @masked_reduce_minsi_i8(%arg0: vector<32xi8>, %arg1: vector<32xi1>) -> i8 {
    %0 = vector.mask %arg1 { vector.reduction <minsi>, %arg0 : vector<32xi8> into i8 } : vector<32xi1> -> i8
    return %0 : i8
  }
}

// -----
module {
  func.func @masked_reduce_maxsi_i8(%arg0: vector<32xi8>, %arg1: vector<32xi1>) -> i8 {
    %0 = vector.mask %arg1 { vector.reduction <maxsi>, %arg0 : vector<32xi8> into i8 } : vector<32xi1> -> i8
    return %0 : i8
  }
}

// -----
module {
  func.func @masked_reduce_maxsi_i8_scalable(%arg0: vector<[32]xi8>, %arg1: vector<[32]xi1>) -> i8 {
    %0 = vector.mask %arg1 { vector.reduction <maxsi>, %arg0 : vector<[32]xi8> into i8 } : vector<[32]xi1> -> i8
    return %0 : i8
  }
}

// -----
module {
  func.func @masked_reduce_or_i8(%arg0: vector<32xi8>, %arg1: vector<32xi1>) -> i8 {
    %0 = vector.mask %arg1 { vector.reduction <or>, %arg0 : vector<32xi8> into i8 } : vector<32xi1> -> i8
    return %0 : i8
  }
}

// -----
module {
  func.func @masked_reduce_and_i8(%arg0: vector<32xi8>, %arg1: vector<32xi1>) -> i8 {
    %0 = vector.mask %arg1 { vector.reduction <and>, %arg0 : vector<32xi8> into i8 } : vector<32xi1> -> i8
    return %0 : i8
  }
}

// -----
module {
  func.func @masked_reduce_xor_i8(%arg0: vector<32xi8>, %arg1: vector<32xi1>) -> i8 {
    %0 = vector.mask %arg1 { vector.reduction <xor>, %arg0 : vector<32xi8> into i8 } : vector<32xi1> -> i8
    return %0 : i8
  }
}

// -----
module {
  func.func @masked_reduce_xor_i8_scalable(%arg0: vector<[32]xi8>, %arg1: vector<[32]xi1>) -> i8 {
    %0 = vector.mask %arg1 { vector.reduction <xor>, %arg0 : vector<[32]xi8> into i8 } : vector<[32]xi1> -> i8
    return %0 : i8
  }
}

