module attributes {gpu.container_module} {
  gpu.module @nvvm_module_1 {
  }
  gpu.module @nvvm_module_2 [#nvvm.target<chip = "sm_60">] {
  }
  gpu.module @nvvm_module_3 [#nvvm.target<O = 3, chip = "sm_90">] {
  }
  gpu.module @rocdl_module {
  }
  gpu.module @xevm_module {
  }
  gpu.module @options_module_1 {
  }
  gpu.module @options_module_2 [#nvvm.target<O = 3, chip = "sm_90">] {
  }
}

