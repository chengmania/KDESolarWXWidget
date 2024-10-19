import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.XmlListModel 2.0

Item {
    id: root
    width: 300
    height: 280  // Adjusted height

    Timer {
        interval: 60 * 60 * 1000  // Once an hour
        running: true
        repeat: true
        onTriggered: {
            rssModel.source = ""  // Reset the source to force reload
            rssModel.source = "http://www.hamqsl.com/solarrss.php"
        }
    }

    XmlListModel {
        id: rssModel
        source: "http://www.hamqsl.com/solarrss.php"
        query: "/rss/channel/item/solar/solardata"

        XmlRole { name: "solarFlux"; query: "solarflux/string()" }
        XmlRole { name: "sunspots"; query: "sunspots/string()" }
        XmlRole { name: "aIndex"; query: "aindex/string()" }
        XmlRole { name: "kIndex"; query: "kindex/string()" }
        XmlRole { name: "geomagField"; query: "geomagfield/string()" }
        XmlRole { name: "signalNoise"; query: "signalnoise/string()" }

        onStatusChanged: {
            if (status === XmlListModel.Error) {
                statusText.text = "Error fetching data"
            } else if (status === XmlListModel.Ready) {
                statusText.text = ""  // Clear any previous error messages
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 5

            // Header Text
            Text {
                text: "HF Prop Data"
                font.pointSize: 16
                font.bold: true
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
                padding: 5
            }
            
            RowLayout {
                spacing: 10

                Label {
                    text: "Solar Flux:"
                    font.bold: true
                    color: "white"
                }
                Text {
                    id: solarFluxText
                    color: "white"
                    text: rssModel.count > 0 ? rssModel.get(0).solarFlux : "Loading..."
                }
            }

            RowLayout {
                spacing: 10

                Label {
                    text: "Sunspots (SN):"
                    font.bold: true
                    color: "white"
                }
                Text {
                    id: sunspotsText
                    color: "white"
                    text: rssModel.count > 0 ? rssModel.get(0).sunspots : "Loading..."
                }
            }

            RowLayout {
                spacing: 10

                Label {
                    text: "A-Index:"
                    font.bold: true
                    color: "white"
                }
                Text {
                    id: aIndexText
                    text: rssModel.count > 0 ? rssModel.get(0).aIndex : "Loading..."
                    color: getIndexColor(rssModel.count > 0 ? rssModel.get(0).aIndex : "")
                }
            }

            RowLayout {
                spacing: 10

                Label {
                    text: "K-Index:"
                    font.bold: true
                    color: "white"
                }
                Text {
                    id: kIndexText
                    text: rssModel.count > 0 ? rssModel.get(0).kIndex : "Loading..."
                    color: getIndexColor(rssModel.count > 0 ? rssModel.get(0).kIndex : "")
                }
            }

            RowLayout {
                spacing: 10

                Label {
                    text: "Geomagnetic Field:"
                    font.bold: true
                    color: "white"
                }
                Text {
                    id: geomagFieldText
                    color: "white"
                    text: rssModel.count > 0 ? rssModel.get(0).geomagField : "Loading..."
                }
            }

            RowLayout {
                spacing: 10

                Label {
                    text: "Signal Noise:"
                    font.bold: true
                    color: "white"
                }
                Text {
                    id: signalNoiseText
                    color: "white"
                    text: rssModel.count > 0 ? rssModel.get(0).signalNoise : "Loading..."
                }
            }

            Text {
                id: statusText
                text: ""
                color: "red"
                Layout.alignment: Qt.AlignHCenter
            }

            // Footer Text
            Text {
                text: "Thank you HAMQSL.com and Paul N0NBH"
                font.pixelSize: 10
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                Layout.alignment: Qt.AlignHCenter
                padding: 10
            }
        }
    }

    function getIndexColor(indexValue) {
        var value = parseInt(indexValue)
        if (isNaN(value)) {
            return "white"
        } else if (value >= 10) {
            return "red"
        } else if (value >= 6) {
            return "yellow"
        } else if (value >= 1) {
            return "#00FF00"
        } else {
            return "white"
        }
    }
}

