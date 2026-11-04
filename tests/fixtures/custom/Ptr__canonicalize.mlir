module {
  func.func @zero_offset(%arg0: !ptr.ptr<#ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> {
    %idx0 = index.constant 0
    %0 = ptr.ptr_add %arg0, %idx0 : !ptr.ptr<#ptr.generic_space>, index
    return %0 : !ptr.ptr<#ptr.generic_space>
  }
  func.func @test_from_ptr_0(%arg0: memref<f32, #ptr.generic_space>) -> memref<f32, #ptr.generic_space> {
    %0 = ptr.to_ptr %arg0 : memref<f32, #ptr.generic_space> -> <#ptr.generic_space>
    %1 = ptr.get_metadata %arg0 : memref<f32, #ptr.generic_space>
    %2 = ptr.from_ptr %0 metadata %1 : <#ptr.generic_space> -> memref<f32, #ptr.generic_space>
    return %2 : memref<f32, #ptr.generic_space>
  }
  func.func @test_from_ptr_1(%arg0: memref<f32, #ptr.generic_space>) -> memref<f32, #ptr.generic_space> {
    %0 = ptr.to_ptr %arg0 : memref<f32, #ptr.generic_space> -> <#ptr.generic_space>
    %1 = ptr.from_ptr %0 : <#ptr.generic_space> -> memref<f32, #ptr.generic_space>
    return %1 : memref<f32, #ptr.generic_space>
  }
  func.func @test_from_ptr_2(%arg0: memref<f32, #ptr.generic_space>, %arg1: !ptr.ptr_metadata<memref<f32, #ptr.generic_space>>) -> memref<f32, #ptr.generic_space> {
    %0 = ptr.to_ptr %arg0 : memref<f32, #ptr.generic_space> -> <#ptr.generic_space>
    %1 = ptr.from_ptr %0 metadata %arg1 : <#ptr.generic_space> -> memref<f32, #ptr.generic_space>
    return %1 : memref<f32, #ptr.generic_space>
  }
  func.func @test_from_ptr_3(%arg0: memref<f32, #ptr.generic_space>) -> memref<f32, #ptr.generic_space> {
    %0 = ptr.get_metadata %arg0 : memref<f32, #ptr.generic_space>
    %1 = ptr.to_ptr %arg0 : memref<f32, #ptr.generic_space> -> <#ptr.generic_space>
    %2 = ptr.from_ptr %1 metadata %0 : <#ptr.generic_space> -> memref<f32, #ptr.generic_space>
    %3 = ptr.to_ptr %2 : memref<f32, #ptr.generic_space> -> <#ptr.generic_space>
    %4 = ptr.from_ptr %3 metadata %0 : <#ptr.generic_space> -> memref<f32, #ptr.generic_space>
    return %4 : memref<f32, #ptr.generic_space>
  }
  func.func @test_to_ptr_0(%arg0: !ptr.ptr<#ptr.generic_space>, %arg1: !ptr.ptr_metadata<memref<f32, #ptr.generic_space>>) -> !ptr.ptr<#ptr.generic_space> {
    %0 = ptr.from_ptr %arg0 metadata %arg1 : <#ptr.generic_space> -> memref<f32, #ptr.generic_space>
    %1 = ptr.to_ptr %0 : memref<f32, #ptr.generic_space> -> <#ptr.generic_space>
    return %1 : !ptr.ptr<#ptr.generic_space>
  }
  func.func @test_to_ptr_1(%arg0: !ptr.ptr<#ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> {
    %0 = ptr.from_ptr %arg0 : <#ptr.generic_space> -> memref<f32, #ptr.generic_space>
    %1 = ptr.to_ptr %0 : memref<f32, #ptr.generic_space> -> <#ptr.generic_space>
    return %1 : !ptr.ptr<#ptr.generic_space>
  }
  func.func @test_to_ptr_2(%arg0: !ptr.ptr<#ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> {
    %0 = ptr.from_ptr %arg0 : <#ptr.generic_space> -> memref<f32, #ptr.generic_space>
    %1 = ptr.to_ptr %0 : memref<f32, #ptr.generic_space> -> <#ptr.generic_space>
    %2 = ptr.from_ptr %1 : <#ptr.generic_space> -> memref<f32, #ptr.generic_space>
    %3 = ptr.to_ptr %2 : memref<f32, #ptr.generic_space> -> <#ptr.generic_space>
    %4 = ptr.from_ptr %3 : <#ptr.generic_space> -> memref<f32, #ptr.generic_space>
    %5 = ptr.to_ptr %4 : memref<f32, #ptr.generic_space> -> <#ptr.generic_space>
    return %5 : !ptr.ptr<#ptr.generic_space>
  }
  func.func @test_cast_chain_folding(%arg0: memref<f32, #ptr.generic_space>, %arg1: !ptr.ptr_metadata<memref<f32, #ptr.generic_space>>) -> memref<f32, #ptr.generic_space> {
    %0 = ptr.to_ptr %arg0 : memref<f32, #ptr.generic_space> -> <#ptr.generic_space>
    %1 = ptr.from_ptr %0 metadata %arg1 : <#ptr.generic_space> -> memref<f32, #ptr.generic_space>
    %2 = ptr.to_ptr %1 : memref<f32, #ptr.generic_space> -> <#ptr.generic_space>
    %3 = ptr.get_metadata %arg0 : memref<f32, #ptr.generic_space>
    %4 = ptr.from_ptr %2 metadata %3 : <#ptr.generic_space> -> memref<f32, #ptr.generic_space>
    return %4 : memref<f32, #ptr.generic_space>
  }
}

