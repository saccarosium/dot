if exists(":TableModeEnable")
    if eval(tablemode#IsActive()) == 0
        TableModeEnable
    endif
endif
