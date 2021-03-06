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

import QtQuick 2.4
import QtGraphicalEffects 1.0
import Hawaii.Components 1.0 as Components
import Hawaii.Themes 1.0 as Themes
import org.hawaii.misc 0.1 as Misc

Components.Showable {
    signal unlocked()

    id: root
    showAnimation: OpacityAnimator {
        target: root
        easing.type: Easing.InSine
        duration: Themes.Units.longDuration
        from: 0.0
        to: 1.0
    }
    hideAnimation: OpacityAnimator {
        target: root
        easing.type: Easing.OutSine
        duration: Themes.Units.longDuration
        from: 1.0
        to: 0.0
    }
    opacity: 0.0
    visible: true

    Image {
        id: picture
        anchors.fill: parent
        source: Misc.StandardPaths.locateFile(Misc.StandardPaths.GenericDataLocation, "backgrounds/hawaii/Also_Calm.png")
        sourceSize.width: width * 0.75
        sourceSize.height: height * 0.75
        fillMode: Image.PreserveAspectCrop
        cache: false
        visible: false
    }

    FastBlur {
        anchors.fill: picture
        source: picture
        radius: 32
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.AllButtons
    }
}
