module {
  func.func @test_ptr_add(%arg0: !ptr.ptr<#ptr.generic_space>, %arg1: index) -> (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>) {
    %0 = ptr.ptr_add %arg0, %arg1 : !ptr.ptr<#ptr.generic_space>, index
    %1 = ptr.ptr_add nusw %arg0, %arg1 : !ptr.ptr<#ptr.generic_space>, index
    %2 = ptr.ptr_add nuw %arg0, %arg1 : !ptr.ptr<#ptr.generic_space>, index
    %3 = ptr.ptr_add inbounds %arg0, %arg1 : !ptr.ptr<#ptr.generic_space>, index
    return %0, %1, %2, %3 : !ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>
  }
  func.func @test_type_offset() -> (index, index, index) {
    %0 = ptr.type_offset f32 : index
    %1 = ptr.type_offset i64 : index
    %2 = ptr.type_offset !llvm.struct<(i32, f64)> : index
    return %0, %1, %2 : index, index, index
  }
  func.func @test_to_ptr(%arg0: memref<10xf32, #ptr.generic_space>) -> !ptr.ptr<#ptr.generic_space> {
    %0 = ptr.to_ptr %arg0 : memref<10xf32, #ptr.generic_space> -> <#ptr.generic_space>
    return %0 : !ptr.ptr<#ptr.generic_space>
  }
  func.func @test_get_metadata_static(%arg0: memref<10x20xf32, #ptr.generic_space>) -> !ptr.ptr_metadata<memref<10x20xf32, #ptr.generic_space>> {
    %0 = ptr.get_metadata %arg0 : memref<10x20xf32, #ptr.generic_space>
    return %0 : !ptr.ptr_metadata<memref<10x20xf32, #ptr.generic_space>>
  }
  func.func @test_get_metadata_dynamic(%arg0: memref<?x?xf32, #ptr.generic_space>) -> !ptr.ptr_metadata<memref<?x?xf32, #ptr.generic_space>> {
    %0 = ptr.get_metadata %arg0 : memref<?x?xf32, #ptr.generic_space>
    return %0 : !ptr.ptr_metadata<memref<?x?xf32, #ptr.generic_space>>
  }
  func.func @test_from_ptr_static(%arg0: !ptr.ptr<#ptr.generic_space>, %arg1: !ptr.ptr_metadata<memref<10x20xf32, #ptr.generic_space>>) -> memref<10x20xf32, #ptr.generic_space> {
    %0 = ptr.from_ptr %arg0 metadata %arg1 : <#ptr.generic_space> -> memref<10x20xf32, #ptr.generic_space>
    return %0 : memref<10x20xf32, #ptr.generic_space>
  }
  func.func @test_from_ptr_dynamic(%arg0: !ptr.ptr<#ptr.generic_space>, %arg1: !ptr.ptr_metadata<memref<?x?xf32, #ptr.generic_space>>) -> memref<?x?xf32, #ptr.generic_space> {
    %0 = ptr.from_ptr %arg0 metadata %arg1 : <#ptr.generic_space> -> memref<?x?xf32, #ptr.generic_space>
    return %0 : memref<?x?xf32, #ptr.generic_space>
  }
  func.func @test_memref_mixed(%arg0: memref<10x?x30xf32, #ptr.generic_space>) -> memref<10x?x30xf32, #ptr.generic_space> {
    %0 = ptr.to_ptr %arg0 : memref<10x?x30xf32, #ptr.generic_space> -> <#ptr.generic_space>
    %1 = ptr.get_metadata %arg0 : memref<10x?x30xf32, #ptr.generic_space>
    %2 = ptr.from_ptr %0 metadata %1 : <#ptr.generic_space> -> memref<10x?x30xf32, #ptr.generic_space>
    return %2 : memref<10x?x30xf32, #ptr.generic_space>
  }
  func.func @test_memref_strided(%arg0: memref<10x20xf32, strided<[40, 2], offset: 5>, #ptr.generic_space>) -> memref<10x20xf32, strided<[40, 2], offset: 5>, #ptr.generic_space> {
    %0 = ptr.to_ptr %arg0 : memref<10x20xf32, strided<[40, 2], offset: 5>, #ptr.generic_space> -> <#ptr.generic_space>
    %1 = ptr.get_metadata %arg0 : memref<10x20xf32, strided<[40, 2], offset: 5>, #ptr.generic_space>
    %2 = ptr.from_ptr %0 metadata %1 : <#ptr.generic_space> -> memref<10x20xf32, strided<[40, 2], offset: 5>, #ptr.generic_space>
    return %2 : memref<10x20xf32, strided<[40, 2], offset: 5>, #ptr.generic_space>
  }
  func.func @test_comprehensive_dynamic(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>, #ptr.generic_space>) -> memref<?x?xf32, strided<[?, ?], offset: ?>, #ptr.generic_space> {
    %0 = ptr.to_ptr %arg0 : memref<?x?xf32, strided<[?, ?], offset: ?>, #ptr.generic_space> -> <#ptr.generic_space>
    %1 = ptr.get_metadata %arg0 : memref<?x?xf32, strided<[?, ?], offset: ?>, #ptr.generic_space>
    %2 = ptr.type_offset f32 : index
    %3 = ptr.ptr_add inbounds %0, %2 : !ptr.ptr<#ptr.generic_space>, index
    %4 = ptr.from_ptr %3 metadata %1 : <#ptr.generic_space> -> memref<?x?xf32, strided<[?, ?], offset: ?>, #ptr.generic_space>
    return %4 : memref<?x?xf32, strided<[?, ?], offset: ?>, #ptr.generic_space>
  }
  func.func @test_memref_0d(%arg0: memref<f32, #ptr.generic_space>) -> memref<f32, #ptr.generic_space> {
    %0 = ptr.to_ptr %arg0 : memref<f32, #ptr.generic_space> -> <#ptr.generic_space>
    %1 = ptr.get_metadata %arg0 : memref<f32, #ptr.generic_space>
    %2 = ptr.from_ptr %0 metadata %1 : <#ptr.generic_space> -> memref<f32, #ptr.generic_space>
    return %2 : memref<f32, #ptr.generic_space>
  }
  func.func @test_memref_ptradd_indexing(%arg0: memref<10x?x30xf32, #ptr.generic_space>, %arg1: index) -> !ptr.ptr<#ptr.generic_space> {
    %0 = ptr.to_ptr %arg0 : memref<10x?x30xf32, #ptr.generic_space> -> <#ptr.generic_space>
    %1 = ptr.type_offset f32 : index
    %2 = arith.muli %1, %arg1 : index
    %3 = ptr.ptr_add %0, %2 : !ptr.ptr<#ptr.generic_space>, index
    return %3 : !ptr.ptr<#ptr.generic_space>
  }
  func.func @test_constant_address_ops() -> (!ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>) {
    %0 = ptr.constant #ptr.address<0> : !ptr.ptr<#ptr.generic_space>
    %1 = ptr.constant #ptr.null : !ptr.ptr<#ptr.generic_space>
    return %0, %1 : !ptr.ptr<#ptr.generic_space>, !ptr.ptr<#ptr.generic_space>
  }
}

