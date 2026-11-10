module @index attributes {dlti.dl_spec = #dlti.dl_spec<index = 32 : i64>} {
  func.func @query() {
    %0 = "test.data_layout_query"() : () -> index
    return
  }
}

// -----
module @index_default {
  func.func @query() {
    %0 = "test.data_layout_query"() : () -> index
    return
  }
}

