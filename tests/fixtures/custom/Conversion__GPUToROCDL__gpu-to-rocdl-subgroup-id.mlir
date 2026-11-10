module {
  gpu.module @test_module {
    func.func @subgroup_id() -> index {
      %0 = gpu.subgroup_id : index
      return %0 : index
    }
    func.func @subgroup_id_with_upper_bound() -> index {
      %0 = gpu.subgroup_id upper_bound 4 : index
      return %0 : index
    }
    func.func @subgroup_id_with_workgroup_sizes() -> index attributes {gpu.known_block_size = array<i32: 64, 4, 1>} {
      %0 = gpu.subgroup_id upper_bound 4 : index
      return %0 : index
    }
  }
}

