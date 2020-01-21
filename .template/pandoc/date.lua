function Meta(m)
    if m["lang"] == nil then
        return m
    end

    language, _ = m["lang"][1]["text"]:gsub("-", "_")
    os.setlocale(language)
    m.date = os.date("%B %e, %Y")
    return m
end
