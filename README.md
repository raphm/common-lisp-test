# Common Lisp Test

Code sketch to see if we can get SBCL running on a Replit Repl.

Yes. Yes, we can.

Once some nix-specific oddities with the `LD_LIBRARY_PATH` got hammered out (see `.replit`), it turned out to be pretty easy.

Unfortunately, exposing the swank port seems to be impossible at this point. :)

Options:

- Easiest would be to find a way to expose an additional non-webish port.
- Most wonderful would be to make the Replit editor Common-Lisp-friendly. The Replit editor already is LSP-aware; can we make a Common Lisp version that's Swank-aware? The protocol is relatively uncomplicated. See https://github.com/brown/swank-client for a Common Lisp implementation, for example.
- Finally, it'd be theoretically possible and also a lot of fun to hack up a SLIME -> HTTP RPC API -> HUNCHENTOOT/WOO -> SWANK pipeline. We've never needed it before because the usual use case is an SSH tunnel, but there's nothing fundamentally impossible about creating a Swank-over-HTTP implementation.



