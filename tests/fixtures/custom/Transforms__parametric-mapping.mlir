module {
  func.func @map1d(%arg0: index, %arg1: index, %arg2: index) {
    %0:2 = "new_processor_id_and_range"() : () -> (index, index)
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
    }
    return
  }
  func.func @map2d(%arg0: index, %arg1: index, %arg2: index) {
    %0:2 = "new_processor_id_and_range"() : () -> (index, index)
    %1:2 = "new_processor_id_and_range"() : () -> (index, index)
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
    }
    return
  }
}

