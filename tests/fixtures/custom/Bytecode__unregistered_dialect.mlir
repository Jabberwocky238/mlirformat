module {
  func.func @map1d(%arg0: index, %arg1: index, %arg2: index) {
    %0:2 = "new_processor_id_and_range"() : () -> (index, index)
    return
  }
}

