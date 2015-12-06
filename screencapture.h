#ifndef SCREENCAPTURE_H
#define SCREENCAPTURE_H

#include <QObject>

#include <QString>
#include <QQuickWindow>

class ScreenCapture : public QObject
{
    Q_OBJECT

public:
    explicit ScreenCapture(QQuickWindow *window = 0);

public slots:
    void capture(QString const &path) const;

private:
    QQuickWindow *_currentWindow;
};

#endif // SCREENCAPTURE_H
