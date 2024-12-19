--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is the lush tutorial, it provides a basic demo of the lush
-- experience and API and should only take a few minutes.
--
-- For more information, see:
--
-- * :h lush
-- * CREATE.md
-- * EXTEND.md
-- * README.md

-- ###
-- ### Lushify
-- ###

local lush = require('lush')


-- ###
-- ### Lush specifications
-- ###
--
-- A lush theme is built from a lush-spec, which is a function, that returns a
-- table, that we pass to lush().
--
-- This sounds a lot more complicated than it is in practice. See below where we do
-- it all in one go, we call lush(), and pass it a function(), that returns a { table }.
--
---@diagnostic disable: undefined-global

local total_black = hsl(240, 100, 0)
local deep_blue = hsl(240, 100, 15)
local light_blue = hsl(225, 90, 60) 
local total_white = hsl(0, 0, 100)
local acid_green = hsl(117, 100, 48)

return lush(function()
  return {
    -- (You might want to disable line wrapping here via `setlocal nowrap`.)
    --
    -- Each element in the table should match this format:
    --
    --   <HighlightGroupName> { bg = <hsl>|<string>,
    --                          fg = <hsl>|<string>,
    --                          sp = <hsl>|<string>,
    --                          gui = <string>,
    --                          ... },
    --
    -- Any vim highlight group name is valid, and any unrecognized key is
    -- removed.

    -- Every theme needs a "Normal" group, so let's define that first. You can
    -- see we already have a definition prepared, so just remove uncomment the
    -- line directly after this one.
    Normal { bg = total_black, fg = total_white }, -- Goodbye gray, hello blue!

    -- You should immediately see your background and text color change to the
    -- colors we setup before. That's all there is to writing basic highlight groups
    -- with Lush!
    --
    -- But we can do more. Lush can use previous groups to define new ones, as
    -- well as access properties of those groups.
    --
    -- For example, let's set our CursorLine to be slightly lighter than our
    -- normal background. (If disabled: `setlocal cursorline`).
    -- We can do this by setting the background property (bg) to the Normal
    -- groups background, lightened by a few points.
    CursorLine { bg = deep_blue }, -- lighten() can also be called via li()
    -- Also note that (after you move your cursor away from the line) the text
    -- "CursorLine" is highlighted to match the definition, so you can always
    -- see how parts of your theme will look.

    -- We can swap colors around too, let's make our visual selection ("v mode")
    -- the inverse of Normal.
    Visual { fg = total_white, bg = deep_blue }, -- Try pressing v and selecting some text

    -- We can adjust our comments to look like desaturate normal text
    -- Comment { fg = Normal.bg.de(25).li(25).ro(-10) },
    Comment { fg = acid_green },
    Keyword { fg = light_blue },
    
    -- Besides directly using group properties, we can define two relationships
    -- between groups, "link" and "inherit".
    --
    -- Link is natively supported by Neovim (see `:h hl-link`), both groups
    -- will appear the same, and changes to the "root" will effect the other.
    --
    -- Inherit groups behave similarly to link, but the parent group properties
    -- are copied to the child, and then any changed properties override the
    -- parent.

    -- For example, let's "link" CursorColumn to CursorLine.
    -- (If disabled: `setlocal cursorcolumn`)
    ColorColumn { CursorLine }, -- CursorColumn is linked to CursorLine

    -- Or we can make LineNr inherit from Comment, but we'll adjust the gui
    -- property (`setlocal number`)

    CursorLineNr { fg = hsl(52, 52, 30) },

    -- Finally you can also use highlight groups to define "base" colors, if
    -- you dont want to use regular Lua variables. They will behave in the same
    -- way. Note that these groups *will* be defined as a vim-highlight-group,
    -- so try not to pick names that might end up being used by something else.
    --
    -- CamelCase is by tradition but you don't have to use it.
    search_base  { bg = hsl(52, 52, 52), fg = hsl(52, 10, 10) },
    Search       { search_base },
    IncSearch    { bg = search_base.bg.ro(-20), fg = search_base.fg.da(90) },
  }
end)

