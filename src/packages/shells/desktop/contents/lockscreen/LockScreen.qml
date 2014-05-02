/****************************************************************************
 * This file is part of Hawaii Shell.
 *
 * Copyright (C) 2013-2014 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
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

import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0
import Fluid.Ui 1.0 as FluidUi
import Fluid.Effects 1.0 as FluidEffects
import Hawaii.Shell 1.0

Item {
    Timer {
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            dateText.text = Qt.formatDate(new Date(), Qt.locale().dateFormat(Locale.LongFormat));
            timeText.text = Qt.formatTime(new Date(), Qt.locale().timeFormat(Locale.ShortFormat));
        }
    }

    /*
    Background {
        id: background
        anchors.fill: parent
        visible: false
    }
    */
    FluidUi.NoiseBackground {
        id: background
        anchors.fill: parent
        color: "#336699"
        visible: false
    }

    FastBlur {
        id: fastBlurEffect
        anchors.fill: parent
        source: background
        radius: 32
        visible: false
    }

    FluidEffects.Vignette {
        anchors.fill: fastBlurEffect
        source: fastBlurEffect
        radius: 4
    }

    ColumnLayout {
        anchors.centerIn: parent

        Text {
            id: timeText
            font.family: "Raleway [Medium]"
            font.pointSize: 52
            color: "white"
            style: Text.Raised
            styleColor: Qt.rgba(0, 0, 0, 0.7)

            Layout.alignment: Qt.AlignCenter
        }

        Text {
            id: dateText
            font.family: "Raleway [Thin]"
            font.pointSize: 36
            color: "white"
            style: Text.Raised
            styleColor: Qt.rgba(0, 0, 0, 0.7)

            Layout.alignment: Qt.AlignCenter
        }

        Item {
            Layout.fillHeight: true
            Layout.minimumHeight: 250
        }

        MouseArea {
            width: 96
            height: 96
            onReleased: SessionManager.unlock()

            Rectangle {
                anchors.fill: parent
                radius: height
                color: "#80222222"
                border.color: "#44000000"
                antialiasing: true

                FluidUi.Icon {
                    anchors.fill: parent
                    anchors.margins: 20
                    iconName: "changes-allow-symbolic"
                    color: "white"
                }
            }

            Layout.alignment: Qt.AlignCenter
        }
    }
}
