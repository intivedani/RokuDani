sub init()
    bindBaseComponents()
end sub

sub bindBaseComponents()
    m.contentInfo = m.top.findNode("info")
    m.profileImage = m.top.findNode("profileImage")
    m.profileName = m.top.findNode("profileName")
    m.rowlist = m.top.findNode("rowlist")
    m.scene = m.top.getScene()
    m.rowlist.setFocus(true)
    createContentTask()
end sub

sub onProfileInfoChange()
    m.profileInfo = m.top.profileInfo
    m.profileImage.uri = m.profileInfo.HDPOSTERURL
    m.profileName.text = m.profileInfo.TITLE
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    print "OKE - HomeView: key ";key + "press: "; press
    handled = false
    if (press = true)
        if (key = "back")
            m.scene.callFunc("displayWelcome")
            handled = true
        end if
    end if
    return handled
end function

sub createContentTask()
    m.contentTask = CreateObject("roSGNode", "createContentTask")
    m.contentTask.observeField("output", "onContentReceived")
    m.contentTask.control = "RUN"
end sub

sub onContentReceived()
    m.rowList.content = m.contentTask.output
    m.contentTask.control = "STOP"
    m.contentTask.unobserveField("output")
    m.contentTask = invalid
end sub