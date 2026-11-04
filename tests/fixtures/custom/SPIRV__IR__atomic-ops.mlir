module {
  func.func @atomic_and(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32) -> i32 {
    %0 = spirv.AtomicAnd <Device> <None> %arg0, %arg1 : !spirv.ptr<i32, StorageBuffer>
    return %0 : i32
  }
}

// -----
// -----
// -----
// -----
module {
  func.func @atomic_compare_exchange(%arg0: !spirv.ptr<i32, Workgroup>, %arg1: i32, %arg2: i32) -> i32 {
    %0 = spirv.AtomicCompareExchange <Workgroup> <Release> <Acquire> %arg0, %arg1, %arg2 : !spirv.ptr<i32, Workgroup>
    return %0 : i32
  }
}

// -----
// -----
// -----
// -----
module {
  func.func @atomic_compare_exchange_weak(%arg0: !spirv.ptr<i32, Workgroup>, %arg1: i32, %arg2: i32) -> i32 {
    %0 = spirv.AtomicCompareExchangeWeak <Workgroup> <Release> <Acquire> %arg0, %arg1, %arg2 : !spirv.ptr<i32, Workgroup>
    return %0 : i32
  }
}

// -----
// -----
// -----
// -----
module {
  func.func @atomic_exchange(%arg0: !spirv.ptr<i32, Workgroup>, %arg1: i32) -> i32 {
    %0 = spirv.AtomicExchange <Workgroup> <Release> %arg0, %arg1 : !spirv.ptr<i32, Workgroup>
    return %0 : i32
  }
}

// -----
// -----
// -----
module {
  func.func @atomic_iadd(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32) -> i32 {
    %0 = spirv.AtomicIAdd <Workgroup> <None> %arg0, %arg1 : !spirv.ptr<i32, StorageBuffer>
    return %0 : i32
  }
  func.func @atomic_idecrement(%arg0: !spirv.ptr<i32, StorageBuffer>) -> i32 {
    %0 = spirv.AtomicIDecrement <Workgroup> <None> %arg0 : !spirv.ptr<i32, StorageBuffer>
    return %0 : i32
  }
  func.func @atomic_iincrement(%arg0: !spirv.ptr<i32, StorageBuffer>) -> i32 {
    %0 = spirv.AtomicIIncrement <Workgroup> <None> %arg0 : !spirv.ptr<i32, StorageBuffer>
    return %0 : i32
  }
  func.func @atomic_isub(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32) -> i32 {
    %0 = spirv.AtomicISub <Workgroup> <None> %arg0, %arg1 : !spirv.ptr<i32, StorageBuffer>
    return %0 : i32
  }
  func.func @atomic_or(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32) -> i32 {
    %0 = spirv.AtomicOr <Workgroup> <None> %arg0, %arg1 : !spirv.ptr<i32, StorageBuffer>
    return %0 : i32
  }
  func.func @atomic_smax(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32) -> i32 {
    %0 = spirv.AtomicSMax <Workgroup> <None> %arg0, %arg1 : !spirv.ptr<i32, StorageBuffer>
    return %0 : i32
  }
  func.func @atomic_smin(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32) -> i32 {
    %0 = spirv.AtomicSMin <Workgroup> <None> %arg0, %arg1 : !spirv.ptr<i32, StorageBuffer>
    return %0 : i32
  }
  func.func @atomic_umax(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32) -> i32 {
    %0 = spirv.AtomicUMax <Workgroup> <None> %arg0, %arg1 : !spirv.ptr<i32, StorageBuffer>
    return %0 : i32
  }
  func.func @atomic_umin(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32) -> i32 {
    %0 = spirv.AtomicUMin <Workgroup> <None> %arg0, %arg1 : !spirv.ptr<i32, StorageBuffer>
    return %0 : i32
  }
  func.func @atomic_xor(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32) -> i32 {
    %0 = spirv.AtomicXor <Workgroup> <None> %arg0, %arg1 : !spirv.ptr<i32, StorageBuffer>
    return %0 : i32
  }
}

// -----
module {
  func.func @atomic_fadd(%arg0: !spirv.ptr<f32, StorageBuffer>, %arg1: f32) -> f32 {
    %0 = spirv.EXT.AtomicFAdd <Device> <None> %arg0, %arg1 : !spirv.ptr<f32, StorageBuffer>
    return %0 : f32
  }
}

// -----
// -----
// -----
// -----
