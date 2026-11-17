"builtin.module"() ({
  "wasmssa.memory"() <{limits = !wasmssa<limit[512:]>, sym_name = "mem1"}> : () -> () loc("<stdin>":2:3)
  "wasmssa.memory"() <{exported, limits = !wasmssa<limit[0: 65536]>, sym_name = "mem2"}> : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":1:1)
