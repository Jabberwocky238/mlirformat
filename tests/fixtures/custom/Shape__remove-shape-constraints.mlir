module {
}

// -----
module {
  func.func @f(%arg0: !shape.shape, %arg1: !shape.shape) -> index {
    %0 = shape.cstr_broadcastable %arg0, %arg1 : !shape.shape, !shape.shape
    %1 = shape.assuming %0 -> (index) {
      %2 = "test.source"() : () -> index
      shape.assuming_yield %2 : index
    }
    return %1 : index
  }
}

// -----
module {
  func.func @f(%arg0: !shape.shape, %arg1: !shape.shape) -> index {
    %0 = shape.cstr_eq %arg0, %arg1 : !shape.shape, !shape.shape
    %1 = shape.assuming %0 -> (index) {
      %2 = "test.source"() : () -> index
      shape.assuming_yield %2 : index
    }
    return %1 : index
  }
}

// -----
module {
  func.func @f(%arg0: !shape.shape, %arg1: !shape.shape) -> index {
    %0 = shape.cstr_broadcastable %arg0, %arg1 : !shape.shape, !shape.shape
    %1 = shape.cstr_eq %arg0, %arg1 : !shape.shape, !shape.shape
    %2 = shape.assuming_all %0, %1
    %3 = shape.assuming %0 -> (index) {
      %4 = "test.source"() : () -> index
      shape.assuming_yield %4 : index
    }
    return %3 : index
  }
}

