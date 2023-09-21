#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "FetchWeather.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<FetchWeather>("weatherClass",1,0,"FetchWeather");

    const QUrl url(u"qrc:/Qt-Weather-app/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
