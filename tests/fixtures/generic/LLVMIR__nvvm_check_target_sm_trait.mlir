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
  "gpu.module"() <{sym_name = "check_valid_SM_family_1", targets = [#nvvm.target<chip = "sm_100f">]}> ({
    "test.nvvm_requires_sm_100f"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "check_valid_SM_family_2", targets = [#nvvm.target<chip = "sm_100a">]}> ({
    "test.nvvm_requires_sm_100f"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "check_valid_SM_family_3", targets = [#nvvm.target<chip = "sm_103a">]}> ({
    "test.nvvm_requires_sm_100f"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "check_valid_SM_family_4", targets = [#nvvm.target<chip = "sm_103f">]}> ({
    "test.nvvm_requires_sm_100f"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "check_valid_SM_family_multi_1", targets = [#nvvm.target<chip = "sm_100f">]}> ({
    "test.nvvm_requires_sm_100f_or_sm_120f"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "check_valid_SM_family_multi_2", targets = [#nvvm.target<chip = "sm_120f">]}> ({
    "test.nvvm_requires_sm_100f_or_sm_120f"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "check_valid_SM_arch_or_family_1", targets = [#nvvm.target<chip = "sm_90a">]}> ({
    "test.nvvm_requires_sm_90a_or_sm_100f"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "check_valid_SM_arch_or_family_2", targets = [#nvvm.target<chip = "sm_100f">]}> ({
    "test.nvvm_requires_sm_90a_or_sm_100f"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "check_valid_SM_arch_or_family_3", targets = [#nvvm.target<chip = "sm_103a">]}> ({
    "test.nvvm_requires_sm_90a_or_sm_100f"() : () -> ()
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
  "gpu.module"() <{sym_name = "disable_verify_target4", targets = [#nvvm.target<chip = "sm_120f", verifyTarget = false>]}> ({
    "test.nvvm_requires_sm_100f"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "disable_verify_target5", targets = [#nvvm.target<chip = "sm_100", verifyTarget = false>]}> ({
    "test.nvvm_requires_sm_100f_or_sm_120f"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "disable_verify_target6", targets = [#nvvm.target<chip = "sm_90", verifyTarget = false>]}> ({
    "test.nvvm_requires_sm_90a_or_sm_100f"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
