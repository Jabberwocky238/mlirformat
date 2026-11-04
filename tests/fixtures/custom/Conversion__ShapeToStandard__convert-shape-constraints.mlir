module {
  func.func @cstr_broadcastable(%arg0: tensor<?xindex>, %arg1: tensor<?xindex>) -> !shape.witness {
    %0 = shape.cstr_broadcastable %arg0, %arg1 : tensor<?xindex>, tensor<?xindex>
    return %0 : !shape.witness
  }
  func.func @cstr_eq(%arg0: tensor<?xindex>, %arg1: tensor<?xindex>) -> !shape.witness {
    %0 = shape.cstr_eq %arg0, %arg1 : tensor<?xindex>, tensor<?xindex>
    return %0 : !shape.witness
  }
  func.func @cstr_require(%arg0: i1) -> !shape.witness {
    %0 = shape.cstr_require %arg0, "msg"
    return %0 : !shape.witness
  }
}

