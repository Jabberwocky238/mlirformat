module {
  func.func @entry() {
    vector.print str "Hello, World!\0A"
    vector.print str "Bye!\0A"
    return
  }
}

