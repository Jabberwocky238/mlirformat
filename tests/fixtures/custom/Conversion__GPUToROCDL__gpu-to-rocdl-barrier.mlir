module {
  gpu.module @test_module {
    func.func @barrier_default() {
      gpu.barrier
      return
    }
    func.func @barrier_no_fence() {
      gpu.barrier memfence []
      return
    }
    func.func @barrier_workgroup_only() {
      gpu.barrier memfence [#gpu.address_space<workgroup>]
      return
    }
    func.func @barrier_global_only() {
      gpu.barrier memfence [#gpu.address_space<global>]
      return
    }
    func.func @barrier_both() {
      gpu.barrier memfence [#gpu.address_space<global>, #gpu.address_space<workgroup>]
      return
    }
    func.func @barrier_private_only() {
      gpu.barrier memfence [#gpu.address_space<private>]
      return
    }
    func.func @barrier_constant_only() {
      gpu.barrier memfence [#gpu.address_space<constant>]
      return
    }
    func.func @barrier_subgroup_scope() {
      gpu.barrier scope <subgroup>
      return
    }
    func.func @barrier_subgroup_scope_no_fence() {
      gpu.barrier memfence [] scope <subgroup>
      return
    }
  }
}

