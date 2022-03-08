# Common Lisp Test

[![Run on Repl.it](https://repl.it/badge/github/raphm/common-lisp-test)](https://repl.it/github/raphm/common-lisp-test)

Simple test to see if we can get SBCL running on a Replit Repl.

Yes! Yes, we can!

Once some nix-specific fun with the `LD_LIBRARY_PATH` got hammered out (see `.replit`), it turned out to be pretty easy.

Unfortunately, exposing the Swank port seems to be impossible at this point. 

Options:

- Easiest would be to find a way to expose an additional non-webish port.
- Most wonderful would be to make the Replit editor Common-Lisp-friendly. The Replit editor already is LSP-aware; what if it was possible to make a Common Lisp version that's Swank-aware? The protocol is not terribly complicated, and although there's not a ton of canonical documentation there has been a reasonable amount of reverse-engineering work. See, e.g., https://github.com/astine/swank-client/blob/master/swank-description.markdown. And see https://github.com/brown/Swank-client for a Common Lisp implementation.
- Finally, it'd be relatively easy and also a lot of fun to hack up a SLIME -> HTTP RPC API -> HUNCHENTOOT/WOO -> SWANK pipeline. We've never needed it before because the usual use case is an SSH tunnel, but there's nothing fundamentally impossible about creating a Swank-over-HTTP implementation. This could simply be a tunnel that passes opaque text blobs over the wire. The Swank protocol is entirely text-based, so I'd just need to hijack the network connection portion of the protocol and stream text back and forth.

It is also possible that this might benefit Clojure (w/ CIDER) as well.


