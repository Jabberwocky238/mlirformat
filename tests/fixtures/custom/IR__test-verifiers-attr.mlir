module {
  func.func @existing_symbol() {
    return
  }
  func.func @test() attributes {symbol_ref = #test.symbol_ref_attr<@existing_symbol>} {
    return
  }
}

// -----
