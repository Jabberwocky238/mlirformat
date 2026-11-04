module {
  wasmssa.memory @mem1 !wasmssa<limit[512:]>
  wasmssa.memory exported @mem2 !wasmssa<limit[0: 65536]>
}

