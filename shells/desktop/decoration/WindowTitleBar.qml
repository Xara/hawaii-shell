/****************************************************************************
 * This file is part of Hawaii.
 *
 * Copyright (C) 2014-2015 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
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
import Hawaii.Themes 1.0 as Themes

Rectangle {
    property alias title: titleLabel.text
    property bool active: false

    signal close()
    signal minimize()
    signal maximize()

    id: root
    gradient: Gradient {
        GradientStop { color: Themes.Theme.palette.window.primaryColor; position: 0 }
        GradientStop { color: Themes.Theme.palette.window.secondaryColor; position: 1 }
    }

    RowLayout {
        anchors {
            fill: parent
            margins: Themes.Units.gu(0.25)
        }
        spacing: Themes.Units.gridUnit
        opacity: root.active ? 1.0 : 0.5

        WindowControls {
            id: controls
            height: parent.height
            onClose: root.close();
            onMinimize: root.minimize();
            onMaximize: root.maximize();

            Layout.alignment: Qt.AlignVCenter
        }

        Label {
            id: titleLabel
            color: Themes.Theme.palette.window.textColor
            font.bold: true
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            style: Text.Raised
            styleColor: Themes.Theme.palette.window.textEffectColor
            height: parent.height

            Layout.fillHeight: true
        }
    }
}
