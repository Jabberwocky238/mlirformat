"builtin.module"() ({
  "wasmssa.memory"() <{limits = !wasmssa<limit[512:]>, sym_name = "mem1"}> : () -> ()
  "wasmssa.memory"() <{exported, limits = !wasmssa<limit[0: 65536]>, sym_name = "mem2"}> : () -> ()
}) : () -> ()

