sub init()
    m.top.functionName = "doRequest"
end sub

sub doRequest()
    headers = {}
    headers["X-RapidAPI-Key"] = "98039b3cb3msh92a7b0381e55adcp10cb23jsncaa25ed54dd9"
    headers["X-RapidAPI-Host"] = "imdb-top-100-movies.p.rapidapi.com"
    response = getContent(headers)

    content = createObject("RoSGNode", "ContentNode") 
    section = content.createChild("ContentNode")

    for i = 0 to response.count() - 1
        catalog = response[i]
        item = section.createChild("ContentNode")
        item.title = catalog.title
        item.HDPOSTERURL = catalog.image 
    end for

    m.top.output = content 
end sub 

function getContent(headers = invalid)
    request = CreateObject("roUrlTransfer")
    request.setCertificatesFile("common:/certs/ca-bundle.crt")
    request.initClientCertificates()

    if headers <> invalid then
        for each item in headers.Items()
            request.AddHeader(item.key, item.value)
        end for
    end if

    request.setUrl("https://imdb-top-100-movies.p.rapidapi.com/")
    stringObject = request.getToString()
    response = parseJson(stringObject)
    
    return response
end function