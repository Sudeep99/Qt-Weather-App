import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {

    property color backgroundColor: "#E1F5FE"
    property color fontColor: "#333333"
    property string appFont: "Segoe UI Light"

    id: mainWindow
    width: 1280
    height: 720

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
        height: 30
        color: mainWindow.backgroundColor
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            topMargin: 20
        }

        Text{
            anchors.centerIn: parent
            text: qsTr("Weather App")
            font.family: mainWindow.appFont
            font.pointSize: 25
            color: mainWindow.fontColor
        }
    }
}
