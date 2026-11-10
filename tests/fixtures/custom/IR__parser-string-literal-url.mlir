module {
  func.func @url_in_string() {
    "test.op"() {url = "http://example.com/path"} : () -> ()
    "test.op"() {url = "https://example.com//double//slashes"} : () -> ()
    "test.op"() {proto = "file:///local/path"} : () -> ()
    return
  }
}

