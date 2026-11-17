"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, index, vector<4xi1>, vector<4xf32>) -> vector<4xf32>, sym_name = "transfer_to_maskedload_fatrawbuffer"}> ({
  ^bb0(%arg0: memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:71), %arg2: vector<4xi1> loc("<stdin>":3:85), %arg3: vector<4xf32> loc("<stdin>":3:106)):
    %0 = "vector.maskedload"(%arg0, %arg1, %arg1, %arg2, %arg3) : (memref<8x8xf32, #amdgpu.address_space<fat_raw_buffer>>, index, index, vector<4xi1>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<4xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
