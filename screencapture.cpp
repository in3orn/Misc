#include "screencapture.h"

#include <QImage>

ScreenCapture::ScreenCapture(QQuickWindow *window) :
    QObject(0),
    _currentWindow(window)
{

}

void ScreenCapture::capture(QString const &path) const
{
    QImage image = _currentWindow->grabWindow();
    image.save(path);
}
