import QtQuick.Window 2.2
import QtQuick 2.9
import QtQuick.Controls 2.0
import com.mycompany.tempdata 1.0
ApplicationWindow {
    id: window
    width: 800
    height: 800
    visible: true


    FakeData {
        id: fakedata
    }
    Gauge {
        property bool accelerating
        //I found it!!!!!!!!!!!!
        value: accelerating ? maximumValue: 0
        maximumValue: 250
        anchors {
            fill: parent
            margins: window.height * 0.2
        }
        Component.onCompleted: forceActiveFocus()

        Behavior on value { NumberAnimation { from:fakedata.first(); to:fakedata.second(); duration: 1000 }}

        Keys.onPressed : accelerating= true;
        Keys.onReleased: {
            if (event.key === Qt.Key_Space) {
                accelerating = false;
                event.accepted = true;
            }
        }
    }
}
