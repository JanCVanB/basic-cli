app [main!] { pf: platform "../platform/main.roc" }

import pf.BugRepro
import pf.Stdout

main! = \{} ->
    happy = { foo: 11, bar: 22, baz: 33, fluff1: 0, fluff2: 0, fluff3: 0, fluff4: 0 }
    _ = Stdout.line! "🦅 happy: $(Inspect.toStr happy)"
    BugRepro.sendZeroedStruct! happy
    |> Result.mapErr (\message -> Exit 1 message)
