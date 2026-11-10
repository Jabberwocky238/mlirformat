module {
  func.func @no_references(%arg0: !testd.self_referencing<i32>) {
    return
  }
}

// -----
module {
  func.func @one_reference(%arg0: !testd.self_referencing<!testd.self_referencing<i32>>) {
    return
  }
}

// -----
module {
  func.func @type1_no_references(%arg0: !testd.type1<i32>) {
    return
  }
}

// -----
module {
  func.func @type1_one_references(%arg0: !testd.type1<!testd.type2<i32>>) {
    return
  }
}

// -----
module {
  func.func @type1_two_references(%arg0: !testd.type1<!testd.type2<!testd.type1<i32>>>) {
    return
  }
}

