/****************************************************************************
 * This file is part of Hawaii.
 *
 * Copyright (C) 2012-2015 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
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
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.0
import Hawaii.Themes 1.0

ColumnLayout {
    property string timeFormat

    signal clicked()
    signal doubleClicked()

    id: root

    Timer {
        id: timer
        repeat: true
        triggeredOnStart: true
        interval: 3000
        onTriggered: {
            var now = new Date();
            timeLabel.text = Qt.formatTime(now, timeFormat);
            dateLabel.text = Qt.formatDate(now, Locale.LongFormat);
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
        onDoubleClicked: root.doubleClicked()
    }

    Label {
        id: timeLabel
        font.pointSize: 36
        color: Theme.palette.window.textColor

        Layout.alignment: Qt.AlignCenter
    }

    Label {
        id: dateLabel
        font.pointSize: 18
        color: Theme.palette.window.textColor

        Layout.alignment: Qt.AlignCenter
    }

    Component.onCompleted: {
        // Remove seconds from time format
        timeFormat = Qt.locale().timeFormat(Locale.ShortFormat).replace(/.ss?/i, "");

        // Start timer
        timer.start();
    }
}
