#include <QApplication>
#include <VPApplication>

#include <QQmlApplicationEngine>

#include <QQuickPaintedItem>
#include <QQuickView>
#include <QQmlContext>

#include "screencapture.h"

int main(int argc, char *argv[])
{

    QApplication app(argc, argv);

    qmlRegisterType<ScreenCapture>("Image", 1, 0, "ScreenCapture");

    VPApplication vplay;

    QQmlApplicationEngine engine;
    vplay.initialize(&engine);

    vplay.setMainQmlFileName(QStringLiteral("qml/Main.qml"));
    //vplay.setMainQmlFileName(QStringLiteral("qrc:/qml/Main.qml"));

    engine.load(QUrl(vplay.mainQmlFileName()));

    QObject *root = engine.rootObjects().first();
    QQuickWindow *window = qobject_cast<QQuickWindow *>(root);

    ScreenCapture screen(window);
    engine.rootContext()->setContextProperty("ScreenCapture", &screen);

    return app.exec();
}


