sub init()
    bindBaseComponents()
    setStyles()
end sub

sub bindBaseComponents()
    m.mainLayoutGroup = m.top.findNode("mainLayoutGroup")
    m.title = m.top.findNode("title")
    m.subLayoutGroup = m.top.findNode("subLayoutGroup")
    m.season = m.top.findNode("season")
    m.year = m.top.findNode("year")
    m.gener = m.top.findNode("gener")
    m.description = m.top.findNode("description")
    m.checkLayoutGroup = m.top.findNode("checkLayoutGroup")
    m.chulo = m.top.findNode("chulo")
    m.primeInfo = m.top.findNode("primeInfo")
end sub 

sub setStyles()
    titleFont = CreateObject("roSGNode", "Font")
    titleFont.uri = "pkg:/fonts/font.otf"
    titleFont.size = 36
    m.title.font = titleFont
end sub

