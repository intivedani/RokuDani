sub init()
    bindBaseComponents()
end sub

sub bindBaseComponents()
    m.top.backgroundURI = "pkg:/images/background.png"
    m.homeView = m.top.findNode("homeView")
    m.welcomeView = m.top.findNode("welcomeView")
    m.welcomeView.setFocus(true)
    m.homeView.visible = false
end sub

sub displayHome(itemContent)
    m.homeView.setFocus(true)
    m.homeView.visible = true
    m.homeView.profileInfo = itemContent
    m.welcomeView.visible = false
end sub

sub displayWelcome()
    m.welcomeView.setFocus(true)
    m.homeView.visible = false
    m.welcomeView.visible = true
end sub