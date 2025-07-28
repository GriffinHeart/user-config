local status, ls = pcall(require, 'luasnip')
if (not status) then return end

-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

ls.add_snippets("markdown", {
  --trigger
  s("jira",
    fmt("[WOVAPPSEC-{}](https://jira.tmc-stargate.com/browse/WOVAPPSEC-{})",
      {
        i(1, "000"),
        rep(1),
      }
  )),
  s("gh",
    fmt("[title](https://github.com/wp-appsec/sectools/pull/{})",
      {
        i(1, "pr#")
      }
  ))
})

