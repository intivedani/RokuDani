sub init()
    m.top.functionName = "getContent"
end sub 

sub getContent()
    urlTransfer = CreateObject("roUrlTransfer")
    urlTransfer.setUrl("http://raw.githubusercontent.com/jack1590/Roku/master/Netflix/mock/profile.json")
    urlTransfer.setCertificatesFile("common:/certs/ca-bundle.crt")
    urlTransfer.initClientCertificates()
    stringBody = urlTransfer.getToString() 
    data = parseJson(stringBody)
 
    content = createObject("RoSGNode", "ContentNode") 
    section = content.createChild("ContentNode")

    for i = 0 to data.profile.items.count() - 1
        profile = data.profile.items[i]
        item = section.createChild("ContentNode")
        item.id = profile.id
        item.title = profile.name
        item.HDPOSTERURL = profile.poster 
    end for

    m.top.output = content 
end sub 