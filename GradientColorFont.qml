import QtQuick 2.0


//  渐变色字体

Rectangle{
    width: 600
    height: 600
    color:"#000000"
   // ColorAnimation { from: "white"; to: "black"; duration: 10 }

    Rectangle {
      id: gradientRect;
      width: 10
      height: 10
      gradient: Gradient {
          GradientStop { position: 0; color: "green" }
          GradientStop { position: 1; color: "red" }
      }
        visible: false; // should not be visible on screen.
      layer.enabled: true;
      layer.smooth: true
  }

  Text {
      id: textItem
      font.bold: true
      font.pixelSize: 80
      text: "Gradient Text"
      anchors.centerIn: parent
      layer.enabled: true
      // This item should be used as the 'mask'
      layer.samplerName: "maskSource"
      layer.effect: ShaderEffect {
          property var colorSource: gradientRect;
          fragmentShader: "
                    uniform lowp sampler2D colorSource;
                    uniform lowp sampler2D maskSource;
                    uniform lowp float qt_Opacity;
                    varying highp vec2 qt_TexCoord0;
                    void main() {
                        gl_FragColor =
                            texture2D(colorSource, qt_TexCoord0)
                            * texture2D(maskSource, qt_TexCoord0).a
                            * qt_Opacity;
                    }
                "
      }
  }
}
