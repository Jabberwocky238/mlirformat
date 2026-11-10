module {
  func.func @token_produce_consume() {
    %0 = test.token.produce
    test.token.consume %0
    return
  }
}

// -----
module {
  func.func @token_region_entry_block_arg() {
    "test.token.region"() ({
    ^bb0(%arg0: token):
      test.token.consume %arg0
      "test.finish"() : () -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @any_type_with_non_token(%arg0: i32) {
    test.token.any_type %arg0 : i32
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
