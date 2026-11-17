"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi16>, sym_name = "blockload2d"}> ({
  ^bb0(%arg0: !llvm.ptr<1> loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:29), %arg2: i32 loc("<stdin>":3:41), %arg3: i32 loc("<stdin>":3:53), %arg4: i32 loc("<stdin>":3:65), %arg5: i32 loc("<stdin>":3:77)):
    %0 = "xevm.blockload2d"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{cache_control = #xevm.load_cache_control<L1uc_L2uc_L3uc>, elem_size_in_bits = 16 : i32, pack_register = false, tile_height = 8 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi16> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<8xi16>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
