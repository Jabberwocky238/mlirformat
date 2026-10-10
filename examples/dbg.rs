//! Debug helper: `cargo run --example dbg -- FILE [CHUNK]` parses, prints, reparses, diffs.
use mlirformat::Module;

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let src = std::fs::read_to_string(&args[1]).unwrap();
    let chunk = args.get(2).map_or(src.as_str(), |i| src.split("// -----").nth(i.parse().unwrap()).unwrap());
    let m = Module::try_from(chunk).unwrap_or_else(|e| panic!("{e}"));
    let text = m.to_string();
    let again = Module::try_from(text.as_str()).unwrap_or_else(|e| panic!("reparse {e}\n{text}"));
    if again != m {
        let (a, b) = (format!("{m:#?}"), format!("{again:#?}"));
        let at = a.lines().zip(b.lines()).position(|(x, y)| x != y).unwrap_or(0);
        let ctx = |s: &str| s.lines().skip(at.saturating_sub(8)).take(14).collect::<Vec<_>>().join("\n");
        println!("MISMATCH at debug line {at}\n--- first\n{}\n--- second\n{}", ctx(&a), ctx(&b));
    } else {
        println!("{text}");
    }
}
