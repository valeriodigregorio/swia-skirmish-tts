-- -----------------------------------------------------------------------------
-- Star Wars: Imperial Assault - Skirmish
-- by Ikon
-- -----------------------------------------------------------------------------

local Overlay = require("swia-skirmish-tts/modules/figurine/overlay")

local tests = {}

function tests.test_version()
	local overlay = Overlay:create()
	local decode = JSON.decode(overlay:toJson())
	assertEquals(Overlay.CURRENT_VERSION, decode.version)
	assertEquals({}, decode.symbols)
end

function tests.test_add_remove_single()
	local expected = {
		Overlay.RECON,
		Overlay.FOCUSED,
		Overlay.HIDDEN,
		Overlay.STUNNED,
		Overlay.BLEEDING,
		Overlay.WEAKENED
	}

	local overlay = Overlay:create()
	for _, symbol in pairs(expected) do
		assertTrue(overlay:add(symbol))
	end
	assertFalse(overlay:add(Overlay.BLEEDING))

	local decode = JSON.decode(overlay:toJson()).symbols
	assertEquals(expected, decode)

	assertTrue(overlay:remove(Overlay.WEAKENED))
	assertTrue(overlay:remove(Overlay.HIDDEN))

	expected = {
		Overlay.RECON,
		Overlay.FOCUSED,
		Overlay.STUNNED,
		Overlay.BLEEDING
	}

	decode = JSON.decode(overlay:toJson()).symbols
	assertEquals(expected, decode)
end

function tests.test_add_multiple()
	local expected = {
		Overlay.DAMAGE,
		Overlay.DAMAGE,
		Overlay.SURGE,
		Overlay.BLOCK,
		Overlay.DAMAGE,
		Overlay.SURGE,
		Overlay.EVADE
	}

	local overlay = Overlay:create()
	for _, symbol in pairs(expected) do
		assertTrue(overlay:add(symbol))
	end

	local decode = JSON.decode(overlay:toJson()).symbols
	assertEquals(expected, decode)

	assertTrue(overlay:remove(Overlay.DAMAGE))
	assertTrue(overlay:remove(Overlay.DAMAGE))
	assertTrue(overlay:remove(Overlay.SURGE))
	assertTrue(overlay:remove(Overlay.SURGE))
	assertFalse(overlay:remove(Overlay.SURGE))

	expected = {
		Overlay.BLOCK,
		Overlay.DAMAGE,
		Overlay.EVADE
	}

	decode = JSON.decode(overlay:toJson()).symbols
	assertEquals(expected, decode)
end

function tests.test_size()
	local expected = {
		Overlay.RECON,
		Overlay.FOCUSED,
		Overlay.HIDDEN,
		Overlay.STUNNED,
		Overlay.BLEEDING,
		Overlay.WEAKENED,
		Overlay.RECON,
		Overlay.FOCUSED,
		Overlay.HIDDEN,
		Overlay.STUNNED,
		Overlay.BLEEDING,
		Overlay.WEAKENED,
		Overlay.DAMAGE,
		Overlay.DAMAGE,
		Overlay.SURGE,
		Overlay.BLOCK,
		Overlay.DAMAGE,
		Overlay.SURGE,
		Overlay.EVADE
	}

	local overlay = Overlay:create()
	for _, symbol in pairs(expected) do
		overlay:add(symbol)
	end

	expected = {
		Overlay.RECON,
		Overlay.FOCUSED,
		Overlay.HIDDEN,
		Overlay.STUNNED,
		Overlay.BLEEDING,
		Overlay.WEAKENED,
		Overlay.DAMAGE,
		Overlay.DAMAGE,
		Overlay.SURGE,
		Overlay.BLOCK,
		Overlay.DAMAGE,
		Overlay.SURGE,
		Overlay.EVADE
	}

	local decode = JSON.decode(overlay:toJson()).symbols
	assertEquals(#expected, #decode)
	assertEquals(expected, decode)
end

function tests.test_apply_no_symbols()
	local height = 123
	local width = 456

	local overlay = Overlay:create()
	local object = Object:create("Ko-Tun Feralo")
	overlay:apply(object, height, width)

	assertEquals([[
<Defaults>
    <Button onClick="onClick" fontStyle="Bold" textColor="black" color="#00000000" />
</Defaults>
<Panel position="0 0 -]]..height..[[" rotation="270 270 90" scale="0.2 0.2">
    <Panel height="]]..width..[[" width="]]..(overlay:size()*width)..[[" position="0 ]]..height..[[ 0">
        <HorizontalLayout spacing="5"></HorizontalLayout>
    </Panel>
</Panel>
<Panel position="0 0 -]]..height..[[" rotation="90 270 90" scale="0.2 0.2">
    <Panel height="]]..width..[[" width="]]..(overlay:size()*width)..[[" position="0 ]]..height..[[ 0">
        <HorizontalLayout spacing="5"></HorizontalLayout>
    </Panel>
</Panel>
]], object.xml)
end

function tests.test_apply_symbols()
	local expected = {
		Overlay.RECON,
		Overlay.FOCUSED,
		Overlay.HIDDEN,
		Overlay.STUNNED,
		Overlay.BLEEDING,
		Overlay.WEAKENED,
		Overlay.RECON,
		Overlay.FOCUSED,
		Overlay.HIDDEN,
		Overlay.STUNNED,
		Overlay.BLEEDING,
		Overlay.WEAKENED,
		Overlay.DAMAGE,
		Overlay.DAMAGE,
		Overlay.SURGE,
		Overlay.BLOCK,
		Overlay.DAMAGE,
		Overlay.SURGE,
		Overlay.EVADE
	}

	local overlay = Overlay:create()
	for _, symbol in pairs(expected) do
		overlay:add(symbol)
	end

	expected = {
		Overlay.RECON,
		Overlay.FOCUSED,
		Overlay.HIDDEN,
		Overlay.STUNNED,
		Overlay.BLEEDING,
		Overlay.WEAKENED,
		Overlay.DAMAGE,
		Overlay.DAMAGE,
		Overlay.SURGE,
		Overlay.BLOCK,
		Overlay.DAMAGE,
		Overlay.SURGE,
		Overlay.EVADE
	}
	table.sort(expected)

	local height = 123
	local width = 456

	local object = Object:create("Ko-Tun Feralo")
	overlay:apply(object, height, width)

    local btn_xml1 = ""
    local btn_xml2 = ""
    for _, symbol in pairs(expected) do
        local button = [[
<Button id="]]..symbol..[[" color="#FFFFFF00" active="true"><Image image="]]..symbol..[[" preserveAspect="true"></Image></Button>
]]
        btn_xml1 = btn_xml1..button
        btn_xml2 = button..btn_xml2
    end

	assertEquals([[
<Defaults>
    <Button onClick="onClick" fontStyle="Bold" textColor="black" color="#00000000" />
</Defaults>
<Panel position="0 0 -]]..height..[[" rotation="270 270 90" scale="0.2 0.2">
    <Panel height="]]..width..[[" width="]]..(overlay:size()*width)..[[" position="0 ]]..height..[[ 0">
        <HorizontalLayout spacing="5">]]..btn_xml1..[[</HorizontalLayout>
    </Panel>
</Panel>
<Panel position="0 0 -]]..height..[[" rotation="90 270 90" scale="0.2 0.2">
    <Panel height="]]..width..[[" width="]]..(overlay:size()*width)..[[" position="0 ]]..height..[[ 0">
        <HorizontalLayout spacing="5">]]..btn_xml2..[[</HorizontalLayout>
    </Panel>
</Panel>
]], object.xml)
end

return tests
