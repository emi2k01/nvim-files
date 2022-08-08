return {
    s("rus", {
        t("const ["), i(1), t(", "),
        f(function(args)
            return "set" .. args[1][1]:gsub("^%l", string.upper)
        end,
            { 1 }, {}),
        t("] = React.useState("), i(2), t(");"), i(0)
    }),
    parse("ruc", "const $1 = React.useCallback(($2) => {\n$3\n}, [$4]);$0")
}, nil
