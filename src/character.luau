local unicodeData = require('./unicodeData')

local numericLookup = unicodeData.n.lookup
local alphabeticLookup = unicodeData.alphabetic.lookup
local lowercaseLookup = unicodeData.lowercase.lookup
local uppercaseLookup = unicodeData.uppercase.lookup
local controlLookup = unicodeData.cc.lookup
local whitespaceLookup = unicodeData.whiteSpace.lookup

local function isAscii(char: string): boolean
    local code = utf8.codepoint(char)
    return code <= 0x7f
end

local function isAlphabetic(char: string): boolean
    local code = utf8.codepoint(char)
    if
        (code >= 65 and code <= 90)
        or (code >= 97 and code <= 122)
        or (code > 0x7f and alphabeticLookup(char))
    then
        return true
    end
    return false
end

local function isNumeric(char: string): boolean
    local code = utf8.codepoint(char)
    if (code >= 48 and code <= 57) or (code > 0x7f and numericLookup(char)) then
        return true
    end
    return false
end

local function isAlphaNumeric(char: string): boolean
    local code = utf8.codepoint(char)
    if
        (code >= 65 and code <= 90)
        or (code >= 97 and code <= 122)
        or (code >= 48 and code <= 57)
        or (code > 0x7f and (alphabeticLookup(char) or numericLookup(char)))
    then
        return true
    end
    return false
end

local function isLowercase(char: string): boolean
    local code = utf8.codepoint(char)
    if (code >= 97 and code <= 122) or (code > 0x7f and lowercaseLookup(char)) then
        return true
    end
    return false
end

local function isUppercase(char: string): boolean
    local code = utf8.codepoint(char)
    if (code >= 65 and code <= 90) or (code > 0x7f and uppercaseLookup(char)) then
        return true
    end
    return false
end

local function isControl(char: string): boolean
    return controlLookup(char)
end

local function isWhitespace(char: string): boolean
    local code = utf8.codepoint(char)
    if code == 32 or (code >= 9 and code <= 13) then
        return true
    elseif code > 0x7f and whitespaceLookup(char) then
        return true
    end
    return false
end

local function toLowercase(str: string): string
    local result = table.create(#str)

    for _, code in utf8.codes(str) do
        local points = unicodeData.conversions.toLower(code)

        table.insert(result, utf8.char(points[1]))

        if points[2] == 0 then
            -- nothing to do
        elseif points[3] == 0 then
            table.insert(result, utf8.char(points[2]))
        else
            table.insert(result, utf8.char(points[2]))
            table.insert(result, utf8.char(points[3]))
        end
    end

    return table.concat(result, '')
end

local function toUppercase(str: string): string
    local result = table.create(#str)

    for _, code in utf8.codes(str) do
        local points = unicodeData.conversions.toUpper(code)

        table.insert(result, utf8.char(points[1]))

        if points[2] == 0 then
            -- nothing to do
        elseif points[3] == 0 then
            table.insert(result, utf8.char(points[2]))
        else
            table.insert(result, utf8.char(points[2]))
            table.insert(result, utf8.char(points[3]))
        end
    end

    return table.concat(result, '')
end

return {
    isAscii = isAscii,
    isAlphabetic = isAlphabetic,
    isNumeric = isNumeric,
    isAlphaNumeric = isAlphaNumeric,
    isLowercase = isLowercase,
    isUppercase = isUppercase,
    isControl = isControl,
    isWhitespace = isWhitespace,
    toLowercase = toLowercase,
    toUppercase = toUppercase,
}
