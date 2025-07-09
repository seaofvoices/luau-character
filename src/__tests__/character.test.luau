local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local character = require('../character')

local expect = jestGlobals.expect
local it = jestGlobals.it

type TestCase = {
    displayName: string?,
    ascii: boolean,
    alphabetic: boolean,
    alphanumeric: boolean,
    numeric: boolean,
    uppercase: boolean,
    lowercase: boolean,
    whitespace: boolean,
    control: boolean,
}

local characterTestCases: { [string]: TestCase } = {
    [''] = {
        displayName = 'empty string',
        ascii = true,
        alphabetic = true,
        numeric = true,
        alphanumeric = true,
        uppercase = true,
        lowercase = true,
        whitespace = true,
        control = true,
    },
    ['0'] = {
        ascii = true,
        alphabetic = false,
        numeric = true,
        alphanumeric = true,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['0123'] = {
        ascii = true,
        alphabetic = false,
        numeric = true,
        alphanumeric = true,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['a'] = {
        ascii = true,
        alphabetic = true,
        numeric = false,
        alphanumeric = true,
        uppercase = false,
        lowercase = true,
        whitespace = false,
        control = false,
    },
    ['A'] = {
        ascii = true,
        alphabetic = true,
        numeric = false,
        alphanumeric = true,
        uppercase = true,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['A1'] = {
        ascii = true,
        alphabetic = false,
        numeric = false,
        alphanumeric = true,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['ABC'] = {
        ascii = true,
        alphabetic = true,
        numeric = false,
        alphanumeric = true,
        uppercase = true,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['AbCd'] = {
        ascii = true,
        alphabetic = true,
        numeric = false,
        alphanumeric = true,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['を'] = {
        ascii = false,
        alphabetic = true,
        numeric = false,
        alphanumeric = true,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['フ'] = {
        ascii = false,
        alphabetic = true,
        numeric = false,
        alphanumeric = true,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['ァ'] = {
        ascii = false,
        alphabetic = true,
        numeric = false,
        alphanumeric = true,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['Σ'] = {
        ascii = false,
        alphabetic = true,
        numeric = false,
        alphanumeric = true,
        uppercase = true,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['Δ'] = {
        ascii = false,
        alphabetic = true,
        numeric = false,
        alphanumeric = true,
        uppercase = true,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['δ'] = {
        ascii = false,
        alphabetic = true,
        numeric = false,
        alphanumeric = true,
        uppercase = false,
        lowercase = true,
        whitespace = false,
        control = false,
    },
    ['ﬄ'] = {
        ascii = false,
        alphabetic = true,
        numeric = false,
        alphanumeric = true,
        uppercase = false,
        lowercase = true,
        whitespace = false,
        control = false,
    },
    ['٣'] = {
        ascii = false,
        alphabetic = false,
        numeric = true,
        alphanumeric = true,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['7'] = {
        ascii = true,
        alphabetic = false,
        numeric = true,
        alphanumeric = true,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['৬'] = {
        ascii = false,
        alphabetic = false,
        numeric = true,
        alphanumeric = true,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['¾'] = {
        ascii = false,
        alphabetic = false,
        numeric = true,
        alphanumeric = true,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['¾999'] = {
        ascii = false,
        alphabetic = false,
        numeric = true,
        alphanumeric = true,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['藏'] = {
        ascii = false,
        alphabetic = true,
        numeric = false,
        alphanumeric = true,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['中'] = {
        ascii = false,
        alphabetic = true,
        numeric = false,
        alphanumeric = true,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['\u{a0}'] = {
        displayName = 'non-breaking space',
        ascii = false,
        alphabetic = false,
        numeric = false,
        alphanumeric = false,
        uppercase = false,
        lowercase = false,
        whitespace = true,
        control = false,
    },
    [' '] = {
        displayName = 'space',
        ascii = true,
        alphabetic = false,
        numeric = false,
        alphanumeric = false,
        uppercase = false,
        lowercase = false,
        whitespace = true,
        control = false,
    },
    ['\n'] = {
        displayName = 'newline',
        ascii = true,
        alphabetic = false,
        numeric = false,
        alphanumeric = false,
        uppercase = false,
        lowercase = false,
        whitespace = true,
        control = true,
    },
    ['\n\t \n\r'] = {
        displayName = 'mixed whitespace',
        ascii = true,
        alphabetic = false,
        numeric = false,
        alphanumeric = false,
        uppercase = false,
        lowercase = false,
        whitespace = true,
        control = false,
    },
    ['\b'] = {
        displayName = 'backspace',
        ascii = true,
        alphabetic = false,
        numeric = false,
        alphanumeric = false,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = true,
    },
    ['q'] = {
        ascii = true,
        alphabetic = true,
        numeric = false,
        alphanumeric = true,
        uppercase = false,
        lowercase = true,
        whitespace = false,
        control = false,
    },
    ['①'] = {
        ascii = false,
        alphabetic = false,
        numeric = true,
        alphanumeric = true,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['三'] = {
        ascii = false,
        alphabetic = true,
        numeric = false,
        alphanumeric = true,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
    ['❤'] = {
        ascii = false,
        alphabetic = false,
        numeric = false,
        alphanumeric = false,
        uppercase = false,
        lowercase = false,
        whitespace = false,
        control = false,
    },
}

local function isOrIsNot(value: boolean): string
    return if value then 'is' else 'is not'
end

for input, case in characterTestCases do
    local displayName = if case.displayName then case.displayName else `'{input}'`

    it(`verifies {displayName} {isOrIsNot(case.ascii)} ascii`, function()
        expect(character.isAscii(input)).toEqual(case.ascii)
    end)

    it(`verifies {displayName} {isOrIsNot(case.alphabetic)} alphabetic`, function()
        expect(character.isAlphabetic(input)).toEqual(case.alphabetic)
    end)

    it(`verifies {displayName} {isOrIsNot(case.numeric)} numeric`, function()
        expect(character.isNumeric(input)).toEqual(case.numeric)
    end)

    it(`verifies {displayName} {isOrIsNot(case.alphanumeric)} alphanumeric`, function()
        expect(character.isAlphaNumeric(input)).toEqual(case.alphanumeric)
    end)

    it(`verifies {displayName} {isOrIsNot(case.uppercase)} uppercase`, function()
        expect(character.isUppercase(input)).toEqual(case.uppercase)
    end)

    it(`verifies {displayName} {isOrIsNot(case.lowercase)} lowercase`, function()
        expect(character.isLowercase(input)).toEqual(case.lowercase)
    end)

    it(`verifies {displayName} {isOrIsNot(case.whitespace)} whitespace`, function()
        expect(character.isWhitespace(input)).toEqual(case.whitespace)
    end)

    it(`verifies {displayName} {isOrIsNot(case.control)} a control character`, function()
        expect(character.isControl(input)).toEqual(case.control)
    end)
end
