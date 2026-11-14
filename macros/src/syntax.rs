use proc_macro2::TokenStream as Ts;
use quote::quote;
use syn::parse::{Parse, ParseStream};
use syn::{Attribute, Error, Ident, LitStr, Token, parenthesized};

pub struct Rules(Vec<Rule>);

struct Rule {
    name: Ident,
    params: Vec<Ident>,
    body: Vec<Item>,
}

enum Item {
    Lit(LitStr),
    Zip(Ident, Ident),
    Pass(Ident),
}

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
            pub fn known(name: &str) -> bool {
                matches!(name, #(#names)|*)
            }

            pub fn expand<'f>(name: &str, args: &[Elem<'f>]) -> Option<Result<Vec<Elem<'f>>, Error>> {
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
