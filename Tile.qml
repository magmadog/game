import QtQuick 2.0

Item {
    width: 64
    height: 64
    property int xw
    property int yw
    property string type

    Image {
        source: "tiles/" + type + ".png"
    }
}
