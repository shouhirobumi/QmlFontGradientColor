import QtQuick 2.0

Rectangle{
    width: 500
    height: 300         //一定要指定出大小才能显示
    color: "#000000"
    Rectangle{
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        width: 400
        height: 200      //一定要指定出大小才能显示
        visible: true
        antialiasing: true          //抗锯齿，默认就是开启的
    //    border.width: 10;
    //    border.color: "red"           //边框的一些属性
        color: "blue"                       //内部的颜色
        gradient: Gradient{             //颜色渐变
            GradientStop { position: 0.0;       color: "lightyellow" }
            GradientStop { position: 1.0;       color: "yellow" }
        }
        radius: 10      //圆角
        clip:true       //这一属性设置表示如果他的子类超出了范围，那么就剪切掉，不让他显示和起作用
        Rectangle{
            id:son

            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 100
            color: "gray"

            Text {
                id: name
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 32
                color: "#ffffff"
                font.family: "Times"
                font.bold: true
                text: qsTr("轻度污染")
            }
        }
    }
}
