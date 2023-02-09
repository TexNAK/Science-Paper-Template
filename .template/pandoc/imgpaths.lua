-- translating paths autocompleted by VS Code IntelliSense (relative to src/ or absolute (aka. relative to project root)) to relative paths to project root
-- https://github.com/jgm/pandoc/issues/4894#issuecomment-612281355
-- https://stackoverflow.com/questions/4990990/check-if-a-file-exists-with-lua

function Image (img)
    if img.src:sub(1,1) == '/' then
        img.src = img.src:sub(2)
    else
        local f=io.open('src/' .. img.src, 'r')
        if f~=nil then
            io.close(f)
            img.src  = "src/" .. img.src
        end
    end
    return img
end
 