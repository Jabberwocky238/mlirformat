use std::io::{Read as _, Write as _};
use std::path::PathBuf;

use mlirformat::{Bytecode, Item, MlirOpt, Module};

/// Converts between MLIR text and bytecode: bytecode in ⇒ text out, text in ⇒ bytecode out
#[derive(clap::Args)]
pub struct Args {
    /// The input file (`-`: standard input)
    #[arg(default_value = "-")]
    input: PathBuf,
    /// The output file (`-`: standard output)
    #[arg(short, long, default_value = "-")]
    out: PathBuf,
    /// The producer written in the bytecode's header
    #[arg(long, default_value = Bytecode::UPSTREAM_PRODUCER)]
    producer: String,
}

impl Args {
    /// The path that names standard input / output
    const STDIO: &'static str = "-";

    pub fn run(self) -> Result<(), String> {
        let bytes = self.input()?;
        let out = if Bytecode::recognizes(&bytes) {
            let op = Bytecode::read(&bytes).map_err(|e| e.0)?;
            MlirOpt::upstream().show(&Module { items: vec![Item::Op(op)] }).to_string().into_bytes()
        } else {
            let text = std::str::from_utf8(&bytes).map_err(|e| format!("{}: neither bytecode nor text: {e}", self.input.display()))?;
            let module = MlirOpt::upstream().parse(text).map_err(|e| e.to_string())?;
            let op = module.items.into_iter().find_map(|i| if let Item::Op(o) = i { Some(o) } else { None }).ok_or("no op to write")?;
            {
                let mut bc = Bytecode::default();
                bc.producer.clone_from(&self.producer);
                bc.write(&op)
            }.map_err(|e| e.0)?
        };
        self.output(&out)
    }

    fn input(&self) -> Result<Vec<u8>, String> {
        if self.input.as_os_str() == Self::STDIO {
            let mut b = Vec::new();
            std::io::stdin().read_to_end(&mut b).map_err(|e| e.to_string())?;
            return Ok(b);
        }
        std::fs::read(&self.input).map_err(|e| format!("{}: {e}", self.input.display()))
    }

    fn output(&self, bytes: &[u8]) -> Result<(), String> {
        if self.out.as_os_str() == Self::STDIO {
            return std::io::stdout().write_all(bytes).map_err(|e| e.to_string());
        }
        std::fs::write(&self.out, bytes).map_err(|e| format!("{}: {e}", self.out.display()))
    }
}
