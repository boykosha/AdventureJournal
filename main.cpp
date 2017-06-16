#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>


#include "database.h"
#include "listmodel.h"
#include "sqleventmodel.h"



int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    DataBase database;
    database.connectToDataBase();

    ListModel *model = new ListModel();

    qmlRegisterType<SqlEventModel>("AdventureJournal", 1, 0, "SqlEventModel");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("database", &database);
    engine.rootContext()->setContextProperty("myModel", model);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
