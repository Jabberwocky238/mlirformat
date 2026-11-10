"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "url_in_string"}> ({
    "test.op"() {url = "http://example.com/path"} : () -> ()
    "test.op"() {url = "https://example.com//double//slashes"} : () -> ()
    "test.op"() {proto = "file:///local/path"} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

