import QtQuick 2.0
import QtQuick.XmlListModel 2.0

//! [restmodel]
XmlListModel {
    property variant coordinate

    source: "https://api.flickr.com/services/rest/?" +
            "min_taken_date=2000-01-01+0:00:00&" +
            "extras=date_taken&" +
            "method=flickr.photos.search&" +
            "per_page=30&" +
            "sort=date-taken-desc&" +
            "api_key=e36784df8a03fea04c22ed93318b291c&" +
            "lat=" + coordinate.latitude + "&lon=" + coordinate.longitude;
    query: "/rsp/photos/photo"

    XmlRole { name: "title"; query: "@title/string()" }
    XmlRole { name: "datetaken"; query: "@datetaken/string()" }
    XmlRole { name: "farm"; query: "@farm/string()" }
    XmlRole { name: "server"; query: "@server/string()" }
    XmlRole { name: "id"; query: "@id/string()" }
    XmlRole { name: "secret"; query: "@secret/string()" }
}
//! [restmodel]
