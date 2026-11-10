module {
  func.func @barrier_default() {
    gpu.barrier
    return
  }
}

// -----
module {
  func.func @barrier_with_scope() {
    gpu.barrier scope <subgroup>
    return
  }
}

// -----
module {
  func.func @barrier_workgroup_scope_not_printed() {
    gpu.barrier
    return
  }
}

// -----
module {
  func.func @barrier_memfence_and_scope() {
    gpu.barrier memfence [#gpu.address_space<workgroup>] scope <subgroup>
    return
  }
}

// -----
module {
  func.func @initialize_named_barrier(%arg0: i32) {
    %0 = gpu.initialize_named_barrier %arg0 : i32 -> !gpu.named_barrier
    gpu.barrier named(%0 : !gpu.named_barrier)
    return
  }
}

// -----
module {
  func.func @named_barrier_with_memfence(%arg0: i32) {
    %0 = gpu.initialize_named_barrier %arg0 : i32 -> !gpu.named_barrier
    gpu.barrier named(%0 : !gpu.named_barrier) memfence [#gpu.address_space<workgroup>]
    return
  }
}

// -----
