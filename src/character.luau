local unicodeData = require('./unicodeData')

local numericLookup = unicodeData.n.lookup
local alphabeticLookup = unicodeData.alphabetic.lookup
local lowercaseLookup = unicodeData.lowercase.lookup
local uppercaseLookup = unicodeData.uppercase.lookup
local controlLookup = unicodeData.cc.lookup
local whitespaceLookup = unicodeData.whiteSpace.lookup

local function isAscii(str: string): boolean
    for _, code in utf8.codes(str) do
        if code > 0x7f then
            return false
        end
    end
    return true
end

local function isAlphabetic(str: string): boolean
    for _, code in utf8.codes(str) do
        if
            not (
                (code >= 65 and code <= 90)
                or (code >= 97 and code <= 122)
                or (code > 0x7f and alphabeticLookup(code))
            )
        then
            return false
        end
    end

    return true
end

local function isNumeric(str: string): boolean
    for _, code in utf8.codes(str) do
        if not ((code >= 48 and code <= 57) or (code > 0x7f and numericLookup(code))) then
            return false
        end
    end
    return true
end

local function isAlphaNumeric(str: string): boolean
    for _, code in utf8.codes(str) do
        if
            not (
                (code >= 65 and code <= 90)
                or (code >= 97 and code <= 122)
                or (code >= 48 and code <= 57)
                or (code > 0x7f and (alphabeticLookup(code) or numericLookup(code)))
            )
        then
            return false
        end
    end
    return true
end

local function isLowercase(str: string): boolean
    for _, code in utf8.codes(str) do
        if not ((code >= 97 and code <= 122) or (code > 0x7f and lowercaseLookup(code))) then
            return false
        end
    end
    return true
end

local function isUppercase(str: string): boolean
    for _, code in utf8.codes(str) do
        if not ((code >= 65 and code <= 90) or (code > 0x7f and uppercaseLookup(code))) then
            return false
        end
    end
    return true
end

local function isControl(str: string): boolean
    for _, code in utf8.codes(str) do
        if not controlLookup(code) then
            return false
        end
    end
    return true
end

local function isWhitespace(str: string): boolean
    for _, code in utf8.codes(str) do
        if
            not (
                code == 32
                or (code >= 9 and code <= 13)
                or (code > 0x7f and whitespaceLookup(code))
            )
        then
            return false
        end
    end
    return true
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
