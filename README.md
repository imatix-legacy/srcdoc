# SrcDoc

`srcdoc` generates HTML documentation from source files.

It is written in Perl v4, and implemented using a state machine, for 
which the implementation (in `srcdoc.d`) is built using `libero` to 
process the state machine source (in `srcdoc.l`); `srcdoc.fmt` was 
written by hand to support the various `srcdoc` actions referenced
by the state machine.

Brief documentation is available in [srcdoc.man](srcdoc.man); apart from
this the only documentation is the source code.

`srcdoc.zip` contains the original release artefact (the only release
every made stand alone); the other files were unpacked from `srcdoc.zip`
for ease of reference.

Released under the GNU GPL v2, a copy of which can be found in 
[COPYING](COPYING).

On [2016-04-29 it was also released under the
MPLv2](https://github.com/imatix-legacy/license) ([license
text](https://imatix-legacy.github.io/license/MPLv2.html)), so
`srcdoc` can be used under either the GPLv2, or the MPLv2.
