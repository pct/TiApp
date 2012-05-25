$.parse_rss = (data) ->
    parser = new com.hamasyou.XML.TiDomParser
    dom = Titanium.XML.parseString(data)
    json = parser.dom2Json(dom)
    if json.rss
        return json.rss.channel.item
    return false

$.parse_xml = (data) ->
    parser = new com.hamasyou.XML.TiDomParser
    dom = Titanium.XML.parseString(data)
    json = parser.dom2Json(dom)
