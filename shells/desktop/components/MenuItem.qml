/****************************************************************************
 * This file is part of Hawaii.
 *
 * Copyright (C) 2015 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * Author(s):
 *    Pier Luigi Fiorini
 *
 * $BEGIN_LICENSE:GPL2+$
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * $END_LICENSE$
 ***************************************************************************/

import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import Hawaii.Components 1.0 as Components
import Hawaii.Themes 1.0 as Themes

Item {
    property alias text: label.text
    property alias iconName: icon.iconName
    property alias hover: mouseArea.hover

    signal clicked()

    id: root
    width: layout.implicitWidth + (Themes.Units.smallSpacing * 4)
    height: layout.implicitHeight + (Themes.Units.smallSpacing * 4)

    Rectangle {
        id: container
        anchors {
            left: parent.left
            top: parent.top
            margins: Themes.Units.smallSpacing
        }
        gradient: Gradient {
            GradientStop { position: 0; color: Themes.Theme.palette.panel.selectedBackgroundColor }
            GradientStop { position: 1; color: Qt.darker(Themes.Theme.palette.panel.selectedBackgroundColor, 1.45) }
        }
        width: Math.max(layout.implicitWidth + (Themes.Units.smallSpacing * 2), root.parent.width - (Themes.Units.smallSpacing * 2))
        height: layout.implicitHeight + (Themes.Units.smallSpacing * 2)
        radius: Themes.Units.dp(6)
        border.color: Themes.Theme.palette.rgba(Qt.darker(Themes.Theme.palette.panel.selectedBackgroundColor, 1.3), 0.35)
        border.width: Themes.Units.dp(1)
        opacity: hover ? 1.0 : 0.0
        antialiasing: true

        MouseArea {
            property bool hover: false

            id: mouseArea
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton
            hoverEnabled: true
            z: 100
            onEntered: hover = true
            onExited: hover = false
            onClicked: root.clicked()
        }

        Behavior on opacity {
            NumberAnimation {
                easing.type: Easing.OutQuad
                duration: Themes.Units.shortDuration
            }
        }
    }

    RowLayout {
        id: layout
        anchors {
            left: container.left
            top: container.top
            margins: Themes.Units.smallSpacing
        }
        spacing: Themes.Units.smallSpacing

        Components.Icon {
            id: icon
            width: Themes.Units.iconSizes.small
            height: width
            color: hover ? Themes.Theme.palette.panel.selectedTextColor : Themes.Theme.palette.panel.textColor
            visible: status == Image.Ready

            Behavior on color {
                ColorAnimation {
                    duration: Themes.Units.shortDuration
                }
            }
        }

        Label {
            id: label
            color: hover ? Themes.Theme.palette.panel.selectedTextColor : Themes.Theme.palette.panel.textColor

            Behavior on color {
                ColorAnimation {
                    duration: Themes.Units.shortDuration
                }
            }

            Layout.alignment: Qt.AlignVCenter
            Layout.fillWidth: true
        }
    }
}
