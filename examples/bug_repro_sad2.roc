app [main!] { pf: platform "../platform/main.roc" }

import pf.BugRepro
import pf.Stdout

main! = \{} ->

    tag = Foo 100 BugRepro.fluff

    _ = Stdout.line! "🦅 tag: $(Inspect.toStr tag)"
    BugRepro.sendSadPayloadfulTagFluffed! tag
    |> Result.mapErr (\message -> Exit 1 message)
