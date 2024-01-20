sub init()
    bindBaseComponents()
end sub

sub bindBaseComponents()
    m.focusedBackground = m.top.findNode("focusedBackground")
    m.layoutGroup = m.top.findNode("layoutGroup")
    m.poster = m.top.findNode("poster")
    m.title = m.top.findNode("title")
end sub

sub onItemContentChanged()
    m.item = m.top.itemContent
    m.title.text = m.item.TITLE
    m.poster.uri = m.item.HDPOSTERURL
end sub

sub onUserHasFocus()
    print "onUserHasFocus: "; m.top.focusPercent
    if m.top.focusPercent > 0.5 then
        m.focusedBackground.visible = true
    else
        m.focusedBackground.visible = false
    end if
end sub
