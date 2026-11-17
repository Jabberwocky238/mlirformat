"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<128x256xf16, #gpu.address_space<global>>) -> vector<8xf16>, sym_name = "global_transpose_load_8xf16"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22), %arg2: memref<128x256xf16, #gpu.address_space<global>> loc("<stdin>":3:36)):
    %0 = "amdgpu.global_transpose_load"(%arg2, %arg0, %arg1) : (memref<128x256xf16, #gpu.address_space<global>>, index, index) -> vector<8xf16> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<8xf16>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
