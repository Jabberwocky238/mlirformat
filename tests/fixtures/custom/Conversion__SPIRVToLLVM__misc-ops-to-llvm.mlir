module {
  spirv.func @composite_extract_array(%arg0: !spirv.array<4 x !spirv.array<4 x f32>>) "None" {
    %0 = spirv.CompositeExtract %arg0[1 : i32, 3 : i32] : !spirv.array<4 x !spirv.array<4 x f32>>
    spirv.Return
  }
  spirv.func @composite_extract_vector(%arg0: vector<3xf32>) "None" {
    %0 = spirv.CompositeExtract %arg0[0 : i32] : vector<3xf32>
    spirv.Return
  }
  spirv.func @composite_insert_struct(%arg0: i32, %arg1: !spirv.struct<(f32, !spirv.array<4 x i32>)>) "None" {
    %0 = spirv.CompositeInsert %arg0, %arg1[1 : i32, 3 : i32] : i32 into !spirv.struct<(f32, !spirv.array<4 x i32>)>
    spirv.Return
  }
  spirv.func @composite_insert_vector(%arg0: vector<3xf32>, %arg1: f32) "None" {
    %0 = spirv.CompositeInsert %arg1, %arg0[1 : i32] : f32 into vector<3xf32>
    spirv.Return
  }
  spirv.func @select_scalar(%arg0: i1, %arg1: vector<3xi32>, %arg2: vector<3xi32>, %arg3: f32, %arg4: f32) "None" {
    %0 = spirv.Select %arg0, %arg1, %arg2 : i1, vector<3xi32>
    %1 = spirv.Select %arg0, %arg3, %arg4 : i1, f32
    spirv.Return
  }
  spirv.func @select_vector(%arg0: vector<2xi1>, %arg1: vector<2xi32>, %arg2: vector<2xi32>) "None" {
    %0 = spirv.Select %arg0, %arg1, %arg2 : vector<2xi1>, vector<2xi32>
    spirv.Return
  }
  spirv.func @vector_shuffle_same_size(%arg0: vector<2xf32>, %arg1: vector<2xf32>) -> vector<3xf32> "None" {
    %0 = spirv.VectorShuffle [0 : i32, 2 : i32, -1 : i32] %arg0, %arg1 : vector<2xf32>, vector<2xf32> -> vector<3xf32>
    spirv.ReturnValue %0 : vector<3xf32>
  }
  spirv.func @vector_shuffle_different_size(%arg0: vector<3xf32>, %arg1: vector<2xf32>) -> vector<3xf32> "None" {
    %0 = spirv.VectorShuffle [0 : i32, 4 : i32, -1 : i32] %arg0, %arg1 : vector<3xf32>, vector<2xf32> -> vector<3xf32>
    spirv.ReturnValue %0 : vector<3xf32>
  }
  spirv.module Logical OpenCL {
    spirv.func @empty() "None" {
      spirv.Return
    }
    spirv.EntryPoint "Kernel" @empty
    spirv.ExecutionMode @empty "ContractionOff"
  }
  spirv.module Logical OpenCL {
    spirv.func @bar() "None" {
      spirv.Return
    }
    spirv.EntryPoint "Kernel" @bar
    spirv.ExecutionMode @bar "ContractionOff"
    spirv.ExecutionMode @bar "LocalSizeHint", 32, 1, 1
  }
  spirv.func @undef_scalar() "None" {
    %0 = spirv.Undef : f32
    spirv.Return
  }
  spirv.func @undef_vector() "None" {
    %0 = spirv.Undef : vector<2xi32>
    spirv.Return
  }
}

