/****************************************************************************
 * This file is part of Fluid.
 *
 * Copyright (c) 2012 Pier Luigi Fiorini
 * Copyright (c) 2010 Daker Fernandes Pinheiro
 *
 * Author(s):
 *    Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *    Daker Fernandes Pinheiro <dakerfp@gmail.com>
 *
 * $BEGIN_LICENSE:LGPL-ONLY$
 *
 * This file may be used under the terms of the GNU Lesser General
 * Public License as published by the Free Software Foundation and
 * appearing in the file LICENSE.LGPL included in the packaging of
 * this file, either version 2.1 of the License, or (at your option) any
 * later version.  Please review the following information to ensure the
 * GNU Lesser General Public License version 2.1 requirements
 * will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
 *
 * If you have questions regarding the use of this file, please contact
 * us via http://www.maui-project.org/.
 *
 * $END_LICENSE$
 ***************************************************************************/

/**Documented API
Inherits:
        The private DualStateButton

Imports:
        QtQuick 2.0
        FluidCore

Description:
        A radio button component consists of a radio button and a line of text. Only one item in a list may be selected at a time. Once an item is selected, it can be deselected only by selecting another item. Initial item selection may be set at the list creation. If not set, the list is shown without a selection.

Properties:
        bool checked:
        If the button is checked, its checked property is true; otherwise false. The property is false by default.

        bool pressed:
        If the button is pressed, its pressed property is true.
            See also clicked.

        string text:
        The text is shown beside the check box. By default text is an empty string.

Signals:
        clicked():
            Emitted when the user clicked a mouse button over the checkbox (or tapped on the touch screen)
**/

import QtQuick 2.0
import FluidCore 1.0 as FluidCore
import "private" as Private

//FIXME: this should be round, DualStateButton shouldn't draw the shadow
Private.DualStateButton {
    id: radioButton
    view: FluidCore.SvgItem {
        svg: FluidCore.Svg {
            id: buttonSvg
            imagePath: "widgets/actionbutton"
        }
        elementId: "normal"
        width: theme.defaultFont.mSize.height + 6
        height: width

        FluidCore.SvgItem {
            svg: FluidCore.Svg {
                id: checkmarkSvg
                imagePath: "widgets/checkmarks"
            }
            elementId: "radiobutton"
            opacity: checked ? 1 : 0
            anchors {
                fill: parent
            }
            Behavior on opacity {
                NumberAnimation {
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    shadow: Private.RoundShadow {}
}
