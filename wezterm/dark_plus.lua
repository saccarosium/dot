return {
    -- The default text color
    foreground = "#D4D4D4",
    -- The default background color
    background = "#1e1e1e",
    -- Overrides the cell background color when the current cell is occupied by the
    -- cursor and the cursor style is set to Block
    cursor_bg = "#D4D4D4",
    -- Overrides the text color when the current cell is occupied by the cursor
    cursor_fg = "#1e1e1e",
    -- Specifies the border color of the cursor when the cursor style is set to Block,
    -- or the color of the vertical or horizontal bar when the cursor style is set to
    -- Bar or Underline.
    cursor_border = "#D4D4D4",
    -- the foreground color of selected text
    selection_fg = "none",
    -- the background color of selected text
    selection_bg = "rgba(68,71,90,0.5)",
    ansi = {
        "#000000", "#cd3131", "#0dbc79", "#e5e510", "#2472c8", "#bc3fbc", "#11a8cd", "#e5e5e5"
    },
    brights = {
        "#666666", "#f14c4c", "#23d18b", "#f5f543", "#3b8eea", "#d670d6", "#29b8db", "#e5e5e5"
    },
    tab_bar = {
        -- The color of the strip that goes along the top of the window
        -- (does not apply when fancy tab bar is in use)
        background = "#111111",
        -- The active tab is the one that has focus in the window
        active_tab = {
            -- The color of the background area for the tab
            bg_color = "#1e1e1e",
            -- The color of the text for the tab
            fg_color = "#D4D4D4",
            -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
            -- label shown for this tab.
            -- The default is "Normal"
            intensity = "Normal",
            -- Specify whether you want "None", "Single" or "Double" underline for
            -- label shown for this tab.
            -- The default is "None"
            underline = "None",
            -- Specify whether you want the text to be italic (true) or not (false)
            -- for this tab.  The default is false.
            italic = false,
            -- Specify whether you want the text to be rendered with strikethrough (true)
            -- or not for this tab.  The default is false.
            strikethrough = false
        },
        -- Inactive tabs are the tabs that do not have focus
        inactive_tab = {
            bg_color = "#111111",
            fg_color = "#666666"
            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `inactive_tab`.
        },
        -- The new tab button that let you create new tabs
        new_tab = {bg_color = "#111111", fg_color = "#D4D4D4"}
    }
}
