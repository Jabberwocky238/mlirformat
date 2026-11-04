"builtin.module"() ({
  "gpu.module"() <{sym_name = "check_valid_SM_exact", targets = [#nvvm.target<chip = "sm_80">]}> ({
    "test.nvvm_requires_sm_80"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "check_valid_SM_greater_1", targets = [#nvvm.target<chip = "sm_86">]}> ({
    "test.nvvm_requires_sm_80"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "check_valid_SM_greater_2", targets = [#nvvm.target<chip = "sm_90">]}> ({
    "test.nvvm_requires_sm_80"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "check_valid_SM_arch_acc_1", targets = [#nvvm.target<chip = "sm_90a">]}> ({
    "test.nvvm_requires_sm_90a"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "check_valid_SM_arch_acc_2", targets = [#nvvm.target<chip = "sm_90a">]}> ({
    "test.nvvm_requires_sm_80"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "check_valid_SM_arch_acc_multi_1", targets = [#nvvm.target<chip = "sm_90a">]}> ({
    "test.nvvm_requires_sm_90a_or_sm_100a"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "check_valid_SM_arch_acc_multi_2", targets = [#nvvm.target<chip = "sm_100a">]}> ({
    "test.nvvm_requires_sm_90a_or_sm_100a"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "disable_verify_target1", targets = [#nvvm.target<chip = "sm_90", verifyTarget = false>]}> ({
    "test.nvvm_requires_sm_90a"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "disable_verify_target2", targets = [#nvvm.target<chip = "sm_70", verifyTarget = false>]}> ({
    "test.nvvm_requires_sm_80"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "disable_verify_target3", targets = [#nvvm.target<chip = "sm_90", verifyTarget = false>]}> ({
    "test.nvvm_requires_sm_90a_or_sm_100a"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
