"builtin.module"() ({
  "gpu.module"() <{sym_name = "nvvm_module_1"}> ({
  ^bb0:
  }) : () -> ()
  "gpu.module"() <{sym_name = "nvvm_module_2", targets = [#nvvm.target<chip = "sm_60">]}> ({
  ^bb0:
  }) : () -> ()
  "gpu.module"() <{sym_name = "nvvm_module_3", targets = [#nvvm.target<O = 3, chip = "sm_90">]}> ({
  ^bb0:
  }) : () -> ()
  "gpu.module"() <{sym_name = "rocdl_module"}> ({
  ^bb0:
  }) : () -> ()
  "gpu.module"() <{sym_name = "xevm_module"}> ({
  ^bb0:
  }) : () -> ()
  "gpu.module"() <{sym_name = "options_module_1"}> ({
  ^bb0:
  }) : () -> ()
  "gpu.module"() <{sym_name = "options_module_2", targets = [#nvvm.target<O = 3, chip = "sm_90">]}> ({
  ^bb0:
  }) : () -> ()
}) {gpu.container_module} : () -> ()

