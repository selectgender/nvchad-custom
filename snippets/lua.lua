local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require "luasnip.util.events"
local ai = require "luasnip.nodes.absolute_indexer"
local extras = require "luasnip.extras"
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require "luasnip.extras.expand_conditions"
local postfix = require("luasnip.extras.postfix").postfix
local types = require "luasnip.util.types"
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

return {
  s(
    "?",
    fmt(
      [[
        if {} then
          {}
        end
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    "!",
    fmt(
      [[
        if not {} then
          {}
        end
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    "|",
    fmt(
      [[
        if {} then
          {}
        else
          {}
        end
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    ")",
    fmt(
      [[
        if {} then
          {}
        elseif {} then
          {}
        end
      ]],
      { i(1), i(3), i(2), i(0) }
    )
  ),
  s(
    "M",
    fmt(
      [[
        local <> = {}
          
        <>.<> = function(<>)
          <>
        end

        return <>
      ]],
      { i(1), rep(1), i(2), i(3), i(0), rep(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    "f",
    fmt(
      [[
        function {}({})
          {}
        end
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    "i",
    fmt(
      [[
        for i = {}, {} do
          {}
        end
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    "pairs",
    fmt(
      [[
        for {}, {} in pairs({}) do
          {}
        end
      ]],
      { i(1), i(2), i(3), i(0) }
    )
  ),
  s(
    "ipairs",
    fmt(
      [[
        for {}, {} in ipairs({}) do
          {}
        end
      ]],
      { i(1), i(2), i(3), i(0) }
    )
  ),
  s(
    "w",
    fmt(
      [[
        while {} do
          {}
        end
      ]],
      { i(1, "true"), i(0) }
    )
  ),
  s(
    "r",
    fmt(
      [[
        require({})
      ]],
      { i(0) }
    )
  ),
}
