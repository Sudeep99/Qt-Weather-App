import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {

    property color backgroundColor: "#E1F5FE"
    property color fontColor: "#000000"
    property string appFont: "Segoe UI Light"

    id: mainWindow
    width: 640
    height: 480

    //locking the window size
    maximumWidth: mainWindow.width
    maximumHeight: mainWindow.height
    minimumWidth: mainWindow.width
    minimumHeight: mainWindow.height

    visible: true
    title: qsTr("Weather App")
    color: mainWindow.backgroundColor

    Rectangle{
        id: topRect
        width: parent.width
        height: 50
        color: mainWindow.backgroundColor
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            topMargin: 10
        }

        Text{
            anchors.centerIn: parent
            text: qsTr("Weather App")
            font.family: mainWindow.appFont
            font.pointSize: 25
            color: mainWindow.fontColor
        }
    }

    Rectangle{
        id: bodyRect
        width: parent.width
        height: parent.height - topRect.height
        color: mainWindow.backgroundColor
        anchors{
            top: topRect.bottom
            left: parent.left
            right: parent.right
        }

        Rectangle{
            id: locationSection
            width: parent.width
            height: parent.height/3
            anchors{
                top: bodyRect.top
                left: parent.left
                right: parent.right
            }
            color: mainWindow.backgroundColor

            Text {
                id: locationSectionHeading
                anchors{
                    left: parent.left
                    leftMargin: 20
                }
                text: qsTr("Location Details")
                font.family: mainWindow.appFont
                font.pointSize: 15
                color: mainWindow.fontColor
            }

            Row{
                id: latituteRow
                spacing: 10

                anchors{
                    top: locationSectionHeading.bottom
                    topMargin: 20
                    left: parent.left
                    leftMargin: 20
                    right: parent.right
                }

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Latitude:   ")
                    font.family: mainWindow.appFont
                    font.pointSize: 12
                    color: mainWindow.fontColor
                }

                TextField {
                    id: latitudeField
                    width: parent.width * 0.2
                    placeholderText: "Enter latitude"
                    validator: RegularExpressionValidator{ regularExpression: /^(?:-?(?:\d|[1-8]\d|90)(?:\.\d{1,2})?)?$/ } // latitude can only be between -90 to 90 with 2 decimal numbers
                    font.family: mainWindow.appFont
                    font.pointSize: 12
                    color: mainWindow.fontColor
                }
            }

            Row{
                id: longitudeRow
                spacing: 10

                anchors{
                    top: latituteRow.bottom
                    topMargin: 10
                    left: parent.left
                    leftMargin: 20
                    right: parent.right
                }

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Longitude:")
                    font.family: mainWindow.appFont
                    font.pointSize: 12
                    color: mainWindow.fontColor
                }

                TextField {
                    id: longitudeField
                    width: parent.width * 0.2
                    placeholderText: "Enter longitude"
                    validator: RegularExpressionValidator{ regularExpression: /^(?:-?(?:\d|1[0-7]\d|180)(?:\.\d{1,2})?)?$/ } // longitude can only be between -180 to 180 with 2 decimal numbers
                    font.family: mainWindow.appFont
                    font.pointSize: 12
                    color: mainWindow.fontColor
                }
            }
        }

        Rectangle{
            id: unitsSection
            width: parent.width
            height: parent.height/3
            anchors{
                top: locationSection.bottom
                left: parent.left
                right: parent.right
            }
            color: mainWindow.backgroundColor

            Text {
                id: unitsSectionHeading
                anchors{
                    left: parent.left
                    leftMargin: 20
                }
                text: qsTr("Units Preference")
                font.family: mainWindow.appFont
                font.pointSize: 15
                color: mainWindow.fontColor
            }

            Column{
                id: unitsRadioButton
                spacing: 10

                anchors{
                    top: unitsSectionHeading.bottom
                    topMargin: 20
                    left: parent.left
                    leftMargin: 20
                    right: parent.right
                }

                RadioButton{
                    id: standardUnitsRadioButton
                    text: "Standard (Temperature in Kelvin and Wind speed in meters/sec)"
                    font.family: mainWindow.appFont
                    font.pointSize: 12
                    checked: true //default option
                }

                RadioButton{
                    id: metricUnitsRadioButton
                    text: "Metric (Temperature in Celcius and Wind speed in meters/sec)"
                    font.family: mainWindow.appFont
                    font.pointSize: 12
                }

                RadioButton{
                    id: imperialUnitsRadioButton
                    text: "Imperial (Temperature in Fahrenheit  and Wind speed in miles/sec)"
                    font.family: mainWindow.appFont
                    font.pointSize: 12
                }
            }
        }

        Rectangle{
            id: buttonsSection
            width: parent.width
            height: parent.height/3
            anchors{
                top: unitsSection.bottom
                left: parent.left
                right: parent.right
            }
            color: mainWindow.backgroundColor

            Rectangle{
                width: parent.width/2.5
                height: parent.height/2.5
                anchors.centerIn: parent

                Button{
                    id: getWeatherButton
                    anchors.fill: parent
                    text: qsTr("Get Weather Data")
                    font {
                        family: mainWindow.appFont
                        pixelSize: 20
                    }
                }
            }
        }
    }
}
