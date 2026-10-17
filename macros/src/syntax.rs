//! `syntax!`: declares the ODS `custom<X>` directives. One description, both directions.
//!
//! ODS leaves a `custom<X>` directive's syntax out of the `.td` on purpose: upstream writes it
//! as a hand-written `parseX` / `printX` pair in C++. That split is what forces the redundant
//! parameters upstream admits to (`ViewLikeInterface.h`: "`valueTypes` is redundant for printing
//! ... but we must keep the API symmetric"). Here a directive is one rule, and the format
//! interpreter reads and writes from it, so there is no second signature to keep in step.
//!
//! ```ignore
//! syntax! {
//!     /// `[%a, 7, 42]`
//!     DynamicIndexList($values, $integers) = "[" zip($integers, $values) "]";
//! }
//! ```
//!
//! A rule names its parameters positionally (`$x`, as the `.td` call site passes them) and spells
//! the syntax as it appears in the IR: string literals are literals, `$x` passes the call site's
//! element through, and `zip($ints, $vals)` is the one thing ODS cannot say — a list whose items
//! are co-indexed across two fields, an integer array holding a sentinel wherever the item is in
//! the value list instead.

use proc_macro2::TokenStream as Ts;
use quote::quote;
use syn::parse::{Parse, ParseStream};
use syn::{Attribute, Error, Ident, LitStr, Token, parenthesized};

pub struct Rules(Vec<Rule>);

/// `Name($a, $b) = "[" zip($b, $a) "]";`
struct Rule {
    name: Ident,
    params: Vec<Ident>,
    body: Vec<Item>,
}

enum Item {
    /// `"[" ` — a literal, written as it appears.
    Lit(LitStr),
    /// `zip($integers, $values)` — co-indexed list.
    Zip(Ident, Ident),
    /// `$x` — the call site's element, unchanged.
    Pass(Ident),
}

/// `$name`.
fn param(input: ParseStream) -> syn::Result<Ident> {
    input.parse::<Token![$]>()?;
    input.parse()
}

impl Parse for Rules {
    fn parse(input: ParseStream) -> syn::Result<Self> {
        let mut out = Vec::new();
        while !input.is_empty() {
            out.push(input.parse()?);
        }
        Ok(Self(out))
    }
}

impl Parse for Rule {
    fn parse(input: ParseStream) -> syn::Result<Self> {
        input.call(Attribute::parse_outer)?;
        let name = input.parse()?;
        let args;
        parenthesized!(args in input);
        let mut params = Vec::new();
        while !args.is_empty() {
            params.push(param(&args)?);
            if !args.is_empty() {
                args.parse::<Token![,]>()?;
            }
        }
        input.parse::<Token![=]>()?;
        let mut body = Vec::new();
        while !input.peek(Token![;]) {
            body.push(input.parse()?);
        }
        input.parse::<Token![;]>()?;
        Ok(Self { name, params, body })
    }
}

impl Parse for Item {
    fn parse(input: ParseStream) -> syn::Result<Self> {
        if input.peek(LitStr) {
            return input.parse().map(Self::Lit);
        }
        if input.peek(Token![$]) {
            return param(input).map(Self::Pass);
        }
        let word: Ident = input.parse()?;
        if word != "zip" {
            return Err(Error::new(word.span(), "expected a `\"literal\"`, `$param` or `zip($ints, $vals)`"));
        }
        let args;
        parenthesized!(args in input);
        let ints = param(&args)?;
        args.parse::<Token![,]>()?;
        let vals = param(&args)?;
        Ok(Self::Zip(ints, vals))
    }
}

impl Rule {
    /// The rule's match arm, which checks arity, binds the parameters and builds the elements.
    fn arm(&self) -> syn::Result<Ts> {
        let name = self.name.to_string();
        let n = self.params.len();
        let known = |p: &Ident| {
            self.params.contains(p).then(|| ()).ok_or_else(|| Error::new(p.span(), format!("`{p}` is not a parameter of `{name}`")))
        };
        let binds = self.params.iter().enumerate().map(|(i, p)| quote!(let #p = &args[#i];));
        let items = self
            .body
            .iter()
            .map(|it| {
                Ok(match it {
                    Item::Lit(l) => quote!(Elem::Lit(#l)),
                    Item::Zip(i, v) => {
                        known(i)?;
                        known(v)?;
                        quote!(Elem::Zip { integers: var(#i)?, values: var(#v)? })
                    }
                    Item::Pass(x) => {
                        known(x)?;
                        quote!(#x.clone())
                    }
                })
            })
            .collect::<syn::Result<Vec<_>>>()?;
        let arity = format!("custom<{name}> takes {n} argument(s)");
        Ok(quote! {
            #name => {
                if args.len() != #n {
                    return Some(Err(String::from(#arity).into()));
                }
                #(#binds)*
                Some((|| Ok(vec![#(#items),*]))())
            }
        })
    }
}

impl Rules {
    pub fn expand(self) -> syn::Result<Ts> {
        let names = self.0.iter().map(|r| r.name.to_string()).collect::<Vec<_>>();
        let arms = self.0.iter().map(Rule::arm).collect::<syn::Result<Vec<_>>>()?;
        Ok(quote! {
            /// Directives this build knows how to expand. `mlirformat tblgen` asks before it
            /// keeps a format that uses one; the rest of an op's format stays generic.
            pub fn known(name: &str) -> bool {
                matches!(name, #(#names)|*)
            }

            /// `custom<name>(args)` ⇒ the elements it stands for. `None`: not one of ours.
            pub fn expand<'f>(name: &str, args: &[Elem<'f>]) -> Option<Result<Vec<Elem<'f>>, Error>> {
                /// A directive parameter has to be a plain `$field` for us to name the field.
                fn var<'f>(e: &Elem<'f>) -> Result<&'f str, Error> {
                    match e {
                        &Elem::Var(n) => Ok(n),
                        _ => Err(String::from("custom<...>: this argument must be a plain `$field`").into()),
                    }
                }
                match name {
                    #(#arms)*
                    _ => None,
                }
            }
        })
    }
}
