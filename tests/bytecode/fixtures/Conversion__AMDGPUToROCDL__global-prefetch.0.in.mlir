"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x64xf16, #gpu.address_space<global>>, i64, i64) -> (), sym_name = "glb_prefetch0"}> ({
  ^bb0(%arg9: memref<64x64xf16, #gpu.address_space<global>> loc("<stdin>":3:8), %arg10: i64 loc("<stdin>":3:62), %arg11: i64 loc("<stdin>":3:75)):
    "amdgpu.global_prefetch"(%arg9, %arg10, %arg11) <{cacheScope = #amdgpu<cache_scope WGP>, temporalHint = #amdgpu<load_temporal_hint HT>}> : (memref<64x64xf16, #gpu.address_space<global>>, i64, i64) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<64x64xf16, #gpu.address_space<global>>, i64, i64) -> (), sym_name = "glb_prefetch1"}> ({
  ^bb0(%arg6: memref<64x64xf16, #gpu.address_space<global>> loc("<stdin>":8:8), %arg7: i64 loc("<stdin>":8:62), %arg8: i64 loc("<stdin>":8:74)):
    "amdgpu.global_prefetch"(%arg6, %arg7, %arg8) <{cacheScope = #amdgpu<cache_scope SE>, speculative, temporalHint = #amdgpu<load_temporal_hint HT>}> : (memref<64x64xf16, #gpu.address_space<global>>, i64, i64) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (memref<64x64xf16, #gpu.address_space<global>>, i64, i64) -> (), sym_name = "glb_prefetch2"}> ({
  ^bb0(%arg3: memref<64x64xf16, #gpu.address_space<global>> loc("<stdin>":13:8), %arg4: i64 loc("<stdin>":13:62), %arg5: i64 loc("<stdin>":13:74)):
    "amdgpu.global_prefetch"(%arg3, %arg4, %arg5) <{cacheScope = #amdgpu<cache_scope DEV>, speculative, temporalHint = #amdgpu<load_temporal_hint RT>}> : (memref<64x64xf16, #gpu.address_space<global>>, i64, i64) -> () loc("<stdin>":14:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (memref<64x64xf16, #gpu.address_space<global>>, i64, i64) -> (), sym_name = "glb_prefetch3"}> ({
  ^bb0(%arg0: memref<64x64xf16, #gpu.address_space<global>> loc("<stdin>":18:8), %arg1: i64 loc("<stdin>":18:62), %arg2: i64 loc("<stdin>":18:74)):
    "amdgpu.global_prefetch"(%arg0, %arg1, %arg2) <{cacheScope = #amdgpu<cache_scope SE>, speculative, temporalHint = #amdgpu<load_temporal_hint NT_RT>}> : (memref<64x64xf16, #gpu.address_space<global>>, i64, i64) -> () loc("<stdin>":19:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":1:1)
