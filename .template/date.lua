function Meta(m)
    language, _ = m["lang"][1]["text"]:gsub("-", "_")
    os.setlocale(language)
    m.date = os.date("%B %e, %Y")
    return m
end
