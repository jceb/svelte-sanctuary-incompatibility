# Steps to reproduce the bug

1. Install software: `make install`
2. Start UI: `make dev`
3. Navigate to [http://localhost:3000]() for a working version of the
   page
4. Navigate to [http://localhost:3000]() for the same page with added
   sanctuary import

# Bug

- 500: `process` is accessed by sanctuary but it doesn't exist, svelte
  interprets it as a module and throws an error.
- 500: `module`: Apparently, the svelte compiler environment looks like
  it's a node environment, therefore `module` and `module.exports`
  exists and sanctuary is misguided to execute the wrong code path.

# Workaround

- Add the test that checks whether `module.path` is `undefined` - this
  is the case in the svelte compiler environment while in node
  `module.path` is a string.

# Notice

- Please not that this repository uses the `svelte@next` repository
  which isn't supported / released yet. I did'nt have the time to try to
  reproduce the bug with the regular `svelte` framework but I think it
  will produce the same error because it also uses a compiler.
