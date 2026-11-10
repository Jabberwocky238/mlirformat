module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var0 bind(0, 1) : !spirv.ptr<!spirv.struct<(i32, !spirv.struct<(f32, i32)>, f32)>, Uniform>
    spirv.GlobalVariable @var1 bind(0, 2) : !spirv.ptr<!spirv.struct<(!spirv.array<64 x i32>, f32)>, StorageBuffer>
    spirv.GlobalVariable @var2 bind(1, 0) : !spirv.ptr<!spirv.struct<(!spirv.struct<(!spirv.array<64 x i32>, f32)>, i32)>, StorageBuffer>
    spirv.GlobalVariable @var3 : !spirv.ptr<!spirv.struct<(!spirv.array<16 x !spirv.struct<(f32, f32, !spirv.array<16 x f32>)>>, f32)>, StorageBuffer>
    spirv.GlobalVariable @var4 bind(1, 2) : !spirv.ptr<!spirv.struct<(!spirv.struct<(!spirv.struct<(i1, i8, i16, i32, i64)>, f32, i1)>, i1)>, StorageBuffer>
    spirv.GlobalVariable @var5 bind(1, 3) : !spirv.ptr<!spirv.struct<(!spirv.array<256 x f32>)>, StorageBuffer>
    spirv.func @kernel() "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %var0_addr = spirv.mlir.addressof @var0 : !spirv.ptr<!spirv.struct<(i32, !spirv.struct<(f32, i32)>, f32)>, Uniform>
      %0 = spirv.AccessChain %var0_addr[%cst0_i32] : !spirv.ptr<!spirv.struct<(i32, !spirv.struct<(f32, i32)>, f32)>, Uniform>, i32 -> !spirv.ptr<i32, Uniform>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var0 : !spirv.ptr<!spirv.struct<(!spirv.struct<(!spirv.struct<(!spirv.struct<(!spirv.struct<(i1, i1, f64)>, i1)>, i1)>, i1)>, i1)>, Uniform>
    spirv.GlobalVariable @var1 : !spirv.ptr<!spirv.struct<(!spirv.struct<(i16, !spirv.struct<(i1, f64)>, f32)>, f32)>, Uniform>
    spirv.GlobalVariable @var2 : !spirv.ptr<!spirv.struct<(!spirv.struct<(i16, !spirv.struct<(i1, !spirv.array<16 x !spirv.array<16 x i64>>)>, f32)>, f32)>, Uniform>
    spirv.GlobalVariable @var3 : !spirv.ptr<!spirv.struct<(!spirv.struct<(!spirv.array<64 x i64>, i1)>, i1)>, Uniform>
    spirv.GlobalVariable @var4 : !spirv.ptr<!spirv.struct<(i1, !spirv.struct<(i64, i1, i1, i1, i1)>, i1)>, Uniform>
    spirv.GlobalVariable @var5 : !spirv.ptr<!spirv.struct<(i1, !spirv.struct<(i1, i1, i1, i1, i64)>, i1)>, Uniform>
    spirv.GlobalVariable @var6 : !spirv.ptr<!spirv.struct<(i1, !spirv.struct<(i64, i32, i16, i8, i1)>, i1)>, Uniform>
    spirv.GlobalVariable @var7 : !spirv.ptr<!spirv.struct<(i1, !spirv.struct<(!spirv.struct<(i1, i64)>, i1)>, i1)>, Uniform>
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var0 : !spirv.ptr<!spirv.struct<(vector<2xi32>, f32)>, StorageBuffer>
    spirv.GlobalVariable @var1 : !spirv.ptr<!spirv.struct<(vector<3xi32>, f32)>, StorageBuffer>
    spirv.GlobalVariable @var2 : !spirv.ptr<!spirv.struct<(vector<4xi32>, f32)>, StorageBuffer>
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @emptyStructAsMember : !spirv.ptr<!spirv.struct<(!spirv.struct<()>)>, StorageBuffer>
    spirv.GlobalVariable @arrayType : !spirv.ptr<!spirv.array<4 x !spirv.array<4 x f32>>, StorageBuffer>
    spirv.GlobalVariable @InputStorage : !spirv.ptr<!spirv.struct<(!spirv.array<256 x f32>)>, Input>
    spirv.GlobalVariable @customLayout : !spirv.ptr<!spirv.struct<(f32 [256], i32 [512])>, Uniform>
    spirv.GlobalVariable @emptyStruct : !spirv.ptr<!spirv.struct<()>, Uniform>
  }
}

// -----
module {
  spirv.module Logical GLSL450 {
    spirv.GlobalVariable @var0 : !spirv.ptr<!spirv.struct<(i32)>, PushConstant>
    spirv.GlobalVariable @var1 : !spirv.ptr<!spirv.struct<(i32)>, PhysicalStorageBuffer>
  }
}

