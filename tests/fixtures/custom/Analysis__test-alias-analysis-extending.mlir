module {
  func.func @restrict(%arg0: memref<?xf32>, %arg1: memref<?xf32> {local_alias_analysis.restrict}) attributes {test.ptr = "func"} {
    %subview = memref.subview %arg0[0] [2] [1] {test.ptr = "view1"} : memref<?xf32> to memref<2xf32>
    %subview_0 = memref.subview %arg1[0] [2] [1] {test.ptr = "view2"} : memref<?xf32> to memref<2xf32>
    return
  }
}

