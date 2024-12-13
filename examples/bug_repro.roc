app [main!] { pf: platform "../platform/main.roc" }

import pf.BugRepro
import pf.Stdout

main! = \{} ->
    happy = { foo: 11, bar: 22, baz: 33, }
    _ = Stdout.line! "🦅 happy: $(Inspect.toStr happy)"
    BugRepro.sendZeroedStruct! happy
    |> Result.mapErr (\message -> Exit 1 message)
