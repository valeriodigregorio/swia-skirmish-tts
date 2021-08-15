-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

function assertEquals(expected, value)
    if stringify(value) ~= stringify(expected) then
        if expected == nil then
            expected = "nil"
        end
        if value == nil then
            value = "nil"
        end
        error("Expected `"..stringify(expected).."` got `"..stringify(value).."`.")
    end
end

function assertNotEquals(unexpected, value)
    if stringify(value) == stringify(unexpected) then
        if value == nil then
            value = "nil"
        end
        error("Got unexpected value `"..stringify(value).."`.")
    end
end

function assertIn(expected, value)
    if not value[expected] then
        error("Cannot find `"..stringify(expected).."` in `"..stringify(value).."`.")
    end
end

function assertNotIn(unexpected, value)
    if value[unexpected] then
        error("Found `"..stringify(unexpected).."` in `"..stringify(value).."`.")
    end
end

function assertNil(value)
    assertEquals(nil, value)
end

function assertNotNil(value)
    assertNotEquals(nil, value)
end

function assertTrue(value)
    assertEquals(true, value)
end

function assertFalse(value)
    assertEquals(false, value)
end

function assert(value)
    assertTrue(value)
end