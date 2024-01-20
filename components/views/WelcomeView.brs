sub init()
    bindBaseComponents()
    _bindObservers()
    'setStyles()
end sub

sub bindBaseComponents()
    m.title = m.top.findNode("title")
    m.rowlist = m.top.findNode("rowlist")
    m.scene = m.top.getScene()
    m.rowlist.setFocus(true)

    createRowlistContentTask()
end sub

sub _bindObservers()
    m.rowList.observeField("itemSelected", "onProfileSelected")
    m.top.observeField("focusedChild", "onFocusChildChanged")
end sub

sub onFocusChildChanged()
    print "WELCOME - onFocusChildChanged"; m.top.focusedChild
    if m.top.hasFocus() = true then m.rowlist.setFocus(true)
end sub

sub createRowlistContentTask()
    m.rowlistContentTask = CreateObject("roSGNode", "CreateProfilesContentTask")
    m.rowlistContentTask.observeField("output", "onRowlistContentReady")
    m.rowlistContentTask.control = "RUN" 
end sub

sub onRowlistContentReady()
    m.rowList.content = m.rowlistContentTask.output
    m.rowlistContentTask.control = "STOP"
    m.rowlistContentTask.unobserveField("output")
    m.rowlistContentTask = invalid
end sub

sub onProfileSelected()
    rowItemFocused = m.rowList.rowItemFocused 
    row = m.rowList.rowItemFocused[1]
    itemContent = m.rowList.content.getChild(0).getChild(row)
    displayHomeView(itemContent)  
end sub

sub displayHomeView(itemContent)
    m.scene.callFunc("displayHome", itemContent)
end sub

sub setStyles()
    font  = CreateObject("roSGNode", "Font")
    font.uri = "pkg:/fonts/Black.ttf"
    font.size = 40
    m.title.font = font
end sub
